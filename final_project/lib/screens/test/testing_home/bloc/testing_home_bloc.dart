import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_project/data_layer/data_layer.dart';
import 'package:final_project/models/services_models/services_provided/services_provided_model.dart';
import 'package:final_project/models/services_models/service/service_model.dart';
import 'package:final_project/repo/service.dart';
import 'package:final_project/screens/client/client_bottom_navbar/bloc/client_bottom_navbar_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'testing_home_event.dart';
part 'testing_home_state.dart';

class TestingHomeBloc extends Bloc<TestingHomeEvent, TestingHomeState> {
  final dataLayer = GetIt.I.get<DataLayer>();
  List<ServicesProvidedModel> servicesProvided = [];
  List<ServiceModel> services = [];
  List<ServicesProvidedModel> filteredServices = [];

  DateTime selectedDay = DateTime.now();
  TestingHomeBloc() : super(TestingHomeInitial()) {
    on<FetchServicesProvidedEvent>((event, emit) async {
      emit(TestingHomeLoading());
      try {
        // await dataLayer.loadDataFromSupabase1();
        // await dataLayer.loadDataFromSupabase();
        await dataLayer.loadDataFromSupabase();

        servicesProvided = dataLayer.servicesProvidedModelData;
        services = dataLayer.services;
        emit(
          TestingHomeLoaded(
            servicesProvided: servicesProvided,
            services: services,
          ),
        );
      } catch (e) {
        emit(TestingHomeError(e.toString()));
      }
    });

    on<DaySelected>(calenderMethod);
    on<ToggleFavoriteEvent>(favoriteMethod);

    on<SearchServicesEvent>((event, emit) {
      final query = event.query.toLowerCase();

      final filteredServices = servicesProvided.where((service) {
        final title =
            // event.isArabic
            // ?
            (service.titleAr?.toLowerCase() ?? '');
        // : (service.titleEn?.toLowerCase() ?? '');

        return title.contains(query);
      }).toList();

      emit(
        TestingHomeLoaded(
          servicesProvided: filteredServices,
          services: services,
        ),
      );
    });
    on<FilterByCategoryEvent>((event, emit) {
      filteredServices = servicesProvided
          .where(
            (service) =>
                service.services!.nameEn!.toLowerCase() ==
                event.categoryName.toLowerCase(),
          )
          .toList();
    });
  }

  FutureOr<void> calenderMethod(
    DaySelected event,
    Emitter<TestingHomeState> emit,
  ) {
    selectedDay = event.selectedDay;
    emit(CalendarSelectedSuccess());
  }

  FutureOr<void> favoriteMethod(
    ToggleFavoriteEvent event,
    Emitter<TestingHomeState> emit,
  ) async {
    try {
      await Service.toggleFavorite(serviceId: event.serviceId);
      emit(FavoriteToggledState());
    } catch (e) {
      print("Error toggleFavorite: $e");
    }
  }
}
