import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:final_project/data_layer/data_layer.dart';
import 'package:final_project/models/services_models/services_provided/services_provided_model.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final dataLayer = GetIt.I.get<DataLayer>();
  List<ServicesProvidedModel> favServicesProvided = [];
  FavoritesBloc() : super(FavoritesInitial()) {
    on<FetchServicesProvidedEvent>(fetchMethod);
  }

  FutureOr<void> fetchMethod(
    FetchServicesProvidedEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(ServiceLoading());
    try {
      await dataLayer.loadOnlyFavoriteServices();
      favServicesProvided = dataLayer.favoriteServices;
      log("✅ favoriteServices: ${dataLayer.favoriteServices}");

      emit(ServicesLoaded(servicesProvided: favServicesProvided));
    } catch (e) {
      emit(ServicesError(e.toString()));
    }
  }
}
