part of 'testing_home_bloc.dart';

@immutable
sealed class TestingHomeEvent {}

class FetchServicesProvidedEvent extends TestingHomeEvent {}

class DaySelected extends TestingHomeEvent {
  final DateTime selectedDay;
  DaySelected(this.selectedDay);
}

class ToggleFavoriteEvent extends TestingHomeEvent {
  final int serviceId;

  ToggleFavoriteEvent({required this.serviceId});
}

class SearchServicesEvent extends TestingHomeEvent {
  final String query;
  final bool isArabic;

  SearchServicesEvent(this.query, this.isArabic);
}

class FilterByCategoryEvent extends TestingHomeEvent {
  final String categoryName;

  FilterByCategoryEvent(this.categoryName);
}
