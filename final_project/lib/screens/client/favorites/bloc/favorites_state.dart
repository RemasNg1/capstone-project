part of 'favorites_bloc.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

class ServiceLoading extends FavoritesState {}

class ServicesLoaded extends FavoritesState {
  final List<ServicesProvidedModel> servicesProvided;

  ServicesLoaded({required this.servicesProvided});
}

class ServicesError extends FavoritesState {
  final String message;

  ServicesError(this.message);
}
