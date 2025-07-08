import 'package:final_project/repo/my_services_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/screens/service_provider/services/bloc/services_event.dart';
import 'package:final_project/screens/service_provider/services/bloc/services_state.dart';

class MyServicesBloc extends Bloc<MyServicesEvent, MyServicesState> {
  final MyServicesRepository repository;

  MyServicesBloc(this.repository) : super(const MyServicesState()) {
    // Listen to each event and call the matching function
    on<LoadMyServices>(_onLoad);
    on<DeleteService>(_onDelete);
    on<EditService>(_onEdit);
  }

  // Load all services
  Future<void> _onLoad(
    LoadMyServices event,
    Emitter<MyServicesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final services = await repository.getMyServices();
      emit(state.copyWith(isLoading: false, services: services));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  // Delete a specific service
  Future<void> _onDelete(
    DeleteService event,
    Emitter<MyServicesState> emit,
  ) async {
    try {
      await repository.deleteService(event.serviceId);
      add(LoadMyServices()); // Reload after delete
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  // Edit a specific service
  Future<void> _onEdit(EditService event, Emitter<MyServicesState> emit) async {
    try {
      await repository.updateService(event.service);
      add(LoadMyServices()); // Reload after edit
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
