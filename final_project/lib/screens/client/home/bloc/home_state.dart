part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ServicesProvidedModel> servicesProvided;
  final List<ServiceModel> services;
  final ClientModel currentUser;

  HomeLoaded({
    required this.currentUser,
    required this.servicesProvided,
    required this.services,
  });
}

class TestingHomeError extends HomeState {
  final String message;

  TestingHomeError(this.message);
}

class CalendarSelectedSuccess extends HomeState {
  CalendarSelectedSuccess();
}

class FavoriteToggledState extends HomeState {
  FavoriteToggledState();
}
