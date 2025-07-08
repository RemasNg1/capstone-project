import 'package:equatable/equatable.dart';
import 'package:final_project/models/my_services/my_service_model.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/models/my_services/my_service_model.dart';

abstract class MyServicesEvent extends Equatable {
  const MyServicesEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load the user's services
class LoadMyServices extends MyServicesEvent {}

/// Event to delete a specific service
class DeleteService extends MyServicesEvent {
  final String serviceId;

  const DeleteService(this.serviceId);

  @override
  List<Object?> get props => [serviceId];
}

/// Event to edit a service (not currently used in logic)
class EditService extends MyServicesEvent {
  final MyServiceModel service;

  const EditService(this.service);

  @override
  List<Object?> get props => [service];
}
