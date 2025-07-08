import 'package:final_project/models/my_services/my_service_model.dart';

import 'package:equatable/equatable.dart';
import 'package:final_project/models/my_services/my_service_model.dart';
import 'package:equatable/equatable.dart';

/// Represents the state of the services screen
class MyServicesState extends Equatable {
  /// True when loading data
  final bool isLoading;

  /// List of the user’s services
  final List<MyServiceModel> services;

  /// Error message (if any)
  final String? error;

  /// Constructor with default values
  const MyServicesState({
    this.isLoading = false,
    this.services = const [],
    this.error,
  });

  /// Creates a new state with updated values
  MyServicesState copyWith({
    bool? isLoading,
    List<MyServiceModel>? services,
    String? error,
  }) {
    return MyServicesState(
      isLoading: isLoading ?? this.isLoading,
      services: services ?? this.services,
      error: error,
    );
  }

  /// For comparing states
  @override
  List<Object?> get props => [isLoading, services, error];
}
