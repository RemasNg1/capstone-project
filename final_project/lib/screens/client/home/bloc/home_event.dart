part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class FetchServicesProvidedEvent extends HomeEvent {}

class DaySelected extends HomeEvent {
  final DateTime selectedDay;
  DaySelected(this.selectedDay);
}

class ToggleFavoriteEvent extends HomeEvent {
  final int serviceId;

  ToggleFavoriteEvent({required this.serviceId});
}

class SearchServicesEvent extends HomeEvent {
  final String query;
  final bool isArabic;

  SearchServicesEvent(this.query, this.isArabic);
}

class FilterByCategoryEvent extends HomeEvent {
  final String categoryName;

  FilterByCategoryEvent(this.categoryName);
}
