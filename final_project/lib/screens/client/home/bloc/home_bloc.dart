import 'dart:async';
import 'package:another_flushbar/flushbar.dart';
import 'package:bloc/bloc.dart';
import 'package:final_project/core/enum/types.dart';
import 'package:final_project/data_layer/auth_layer.dart';
import 'package:final_project/data_layer/data_layer.dart';
import 'package:final_project/models/client/client_model.dart';
import 'package:final_project/models/services_models/favorite_service/favorite_service_model.dart';
import 'package:final_project/models/services_models/service/service_model.dart';
import 'package:final_project/models/services_models/services_provided/services_provided_model.dart';
import 'package:final_project/repo/service.dart';
import 'package:final_project/repo/supabase.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  Map<String, String> serviceIcon = {
    "Halls": "halls",
    "Hospitality": "hospitality",
    "Photography": "photography",
    "Decoration": "decoration",
    "Transportation": "transportation",
    "Dinner": "dinner",
  };
  final dataLayer = GetIt.I.get<DataLayer>();
  List<ServicesProvidedModel> servicesProvided = [];
  List<ServiceModel> services = [];
  List<ServicesProvidedModel> filteredServices = [];
  List<FavoriteService> favorites = [];
  ClientModel? currentUser;
  bool hasLoaded = false;
  Box get box => Hive.box('userInfo');
  String? get userTypeString => box.get('userType');
  final session = SupabaseConnect.supabase!.client.auth.currentSession;
  final authGetit = GetIt.I.get<AuthLayer>();
  late EnumUserType? userType;

  DateTime selectedDay = DateTime.now();
  HomeBloc() : super(HomeInitial()) {
    on<FetchServicesProvidedEvent>(fetchMethod);
    on<DaySelected>(calenderMethod);
    on<ToggleFavoriteEvent>(favoriteMethod);
    on<SearchServicesEvent>(searchMethod);
    on<FilterByCategoryEvent>(filterMethod);
  }

  FutureOr<void> fetchMethod(
    FetchServicesProvidedEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (hasLoaded) return;
    emit(HomeLoading());
    try {
      await dataLayer.loadDataFromSupabase();

      // final box = Hive.box('userInfo');
      // final userTypeString = box.get('userType');

      if (userTypeString == EnumUserType.customer.name) {
        currentUser = dataLayer.currentUser!;
      } else {
        currentUser = ClientModel(
          name: "Guest",
          status: EnumUserStatus.online,
          phoneNumber: "0000",
        );
      }

      // final isClient = await authGetit.isClient();

      // final user = SupabaseConnect.supabase!.client.auth.currentUser;
      // if (isClient) {
      //   userType = EnumUserType.customer;
      //   currentUser = dataLayer.currentUser!;
      // } else {
      //   currentUser = ClientModel(
      //     name: "guest",
      //     status: EnumUserStatus.online,
      //     phoneNumber: "0000",
      //   );
      // }
      favorites = await Service.fetchFavoriteServices();

      servicesProvided = dataLayer.servicesProvidedModelData;
      services = dataLayer.services;
      // log(favorites.toString());

      await dataLayer.loadOnlyFavoriteServices();
      // log("✅ favoriteServices: ${dataLayer.favoriteServices}");

      final favoriteServiceIds = favorites
          .map((f) => f.serviceProvidedId)
          .toSet();

      servicesProvided = dataLayer.servicesProvidedModelData.map((
        serviceProvided,
      ) {
        final isFav = favoriteServiceIds.contains(serviceProvided.id);
        return serviceProvided.copyWith(isFavorite: isFav);
      }).toList();
      // currentUser = dataLayer.currentUser!;
      hasLoaded = true;
      // log("services.toString(): $services.toString()");
      // log(favoriteServiceIds.toString());
      // log(
      //   "uuuuuuuuuuuu :${Auth.fetchCurrentUser().toString() ?? "hhhhh"}nooo user",
      // );
      // log("uuuuserrrrr  ${dataLayer.currentUser.toString()}");

      // log("uuuuserrrrr  ${currentUser}");

      emit(
        HomeLoaded(
          currentUser: currentUser!,
          servicesProvided: servicesProvided,
          services: services,
        ),
      );
    } catch (e) {
      emit(TestingHomeError(e.toString()));
    }
  }

  FutureOr<void> calenderMethod(DaySelected event, Emitter<HomeState> emit) {
    selectedDay = event.selectedDay;
    emit(CalendarSelectedSuccess());
  }

  // FutureOr<void> favoriteMethod(
  //   ToggleFavoriteEvent event,
  //   Emitter<HomeState> emit,
  // ) async {
  //   try {
  //     await Service.toggleFavorite(serviceId: event.serviceId);
  //     emit(FavoriteToggledState());
  //   } catch (e) {
  //     print("Error toggleFavorite: $e");
  //   }
  // }

  FutureOr<void> favoriteMethod(
    ToggleFavoriteEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      if (currentUser?.name == "Guest") {
        if (event.context != null) {
          Flushbar(
            message: "الرجاء تسجيل الدخول للإضافة للمفضلة",
            backgroundColor: Colors.red,
            icon: const Icon(Icons.error, color: Colors.white),
            duration: const Duration(seconds: 3),
            flushbarPosition: FlushbarPosition.BOTTOM,
            borderRadius: BorderRadius.circular(8),
            margin: const EdgeInsets.all(16),
          ).show(event.context!);
        }

        return;
      }
      await Service.toggleFavorite(serviceId: event.serviceId);

      favorites = await Service.fetchFavoriteServices();

      final favoriteServiceIds = favorites
          .map((f) => f.serviceProvidedId)
          .toSet();
      servicesProvided = servicesProvided.map((serviceProvided) {
        final isFav = favoriteServiceIds.contains(serviceProvided.id);
        return serviceProvided.copyWith(isFavorite: isFav);
      }).toList();

      emit(
        HomeLoaded(
          currentUser: currentUser!,
          servicesProvided: servicesProvided,
          services: services,
        ),
      );
    } catch (e) {
      print("Error toggleFavorite: $e");
      emit(TestingHomeError("Error toggleFavorite: $e"));
    }
  }

  FutureOr<void> searchMethod(
    SearchServicesEvent event,
    Emitter<HomeState> emit,
  ) async {
    final query = event.query.toLowerCase();

    final filteredServices = servicesProvided.where((service) {
      final title = event.isArabic
          ? (service.titleAr?.toLowerCase() ?? '')
          : (service.titleEn?.toLowerCase() ?? '');

      return title.contains(query);
    }).toList();

    emit(
      HomeLoaded(
        currentUser: currentUser!,
        servicesProvided: filteredServices,
        services: services,
      ),
    );
  }

  FutureOr<void> filterMethod(
    FilterByCategoryEvent event,
    Emitter<HomeState> emit,
  ) async {
    filteredServices = servicesProvided
        .where(
          (service) =>
              service.services!.nameEn!.toLowerCase() ==
              event.categoryName.toLowerCase(),
        )
        .toList();
  }
}
