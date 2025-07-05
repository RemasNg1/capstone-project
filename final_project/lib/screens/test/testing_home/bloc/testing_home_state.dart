part of 'testing_home_bloc.dart';

@immutable
sealed class TestingHomeState {}

final class TestingHomeInitial extends TestingHomeState {}

class TestingHomeLoading extends TestingHomeState {}

class TestingHomeLoaded extends TestingHomeState {
  final List<ServicesProvidedModel> servicesProvided;
  final List<ServiceModel> services;
  TestingHomeLoaded({required this.servicesProvided, required this.services});
}

class TestingHomeError extends TestingHomeState {
  final String message;

  TestingHomeError(this.message);
}

class CalendarSelectedSuccess extends TestingHomeState {
  CalendarSelectedSuccess();
}

class FavoriteToggledState extends TestingHomeState {
  FavoriteToggledState();
}
