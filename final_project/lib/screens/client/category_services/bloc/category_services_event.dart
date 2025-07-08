part of 'category_services_bloc.dart';

@immutable
sealed class CategoryServicesEvent {}

class InitServicesEvent extends CategoryServicesEvent {
  final List<ServicesProvidedModel> services;

  InitServicesEvent(this.services);
}

class SearchServicesEvent extends CategoryServicesEvent {
  final String query;
  final bool isArabic;

  SearchServicesEvent({required this.query, required this.isArabic});
}
