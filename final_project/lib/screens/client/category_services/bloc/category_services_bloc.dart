import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_project/models/services_models/services_provided/services_provided_model.dart';
import 'package:final_project/repo/service.dart';
import 'package:meta/meta.dart';

part 'category_services_event.dart';
part 'category_services_state.dart';

class CategoryServicesBloc
    extends Bloc<CategoryServicesEvent, CategoryServicesState> {
  List<ServicesProvidedModel> allServices = [];

  CategoryServicesBloc() : super(CategoryServicesInitial()) {
    on<InitServicesEvent>((event, emit) {
      allServices = event.services;
      emit(SuccessSearch(servicesProvided: allServices));
    });
    on<SearchServicesEvent>(searchMethod);

    // on<ToggleFavoriteEvent>(favoriteMethod);
  }

  FutureOr<void> searchMethod(
    SearchServicesEvent event,
    Emitter<CategoryServicesState> emit,
  ) {
    final query = event.query.toLowerCase();

    final filteredServices = allServices.where((service) {
      final title = event.isArabic
          ? (service.titleAr?.toLowerCase() ?? '')
          : (service.titleEn?.toLowerCase() ?? '');

      return title.contains(query);
    }).toList();

    emit(SuccessSearch(servicesProvided: filteredServices));
  }
}
