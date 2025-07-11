import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:final_project/data_layer/data_layer.dart';
import 'package:final_project/models/client/client_model.dart';
import 'package:final_project/models/services_models/favorite_service/favorite_service_model.dart';
import 'package:final_project/models/services_models/service/service_model.dart';
import 'package:final_project/models/services_models/services_provided/services_provided_model.dart';
import 'package:final_project/repo/service.dart';
import 'package:get_it/get_it.dart';
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
  };
  final dataLayer = GetIt.I.get<DataLayer>();
  List<ServicesProvidedModel> servicesProvided = [];
  List<ServiceModel> services = [];
  List<ServicesProvidedModel> filteredServices = [];
  List<FavoriteService> favorites = [];
  ClientModel? currentUser;

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
    emit(HomeLoading());
    try {
      await dataLayer.loadDataFromSupabase();
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
      currentUser = dataLayer.currentUser!;

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
