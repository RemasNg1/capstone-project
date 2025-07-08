part of 'category_services_bloc.dart';

@immutable
sealed class CategoryServicesState {}

final class CategoryServicesInitial extends CategoryServicesState {}

class SuccessSearch extends CategoryServicesState {
  final List<ServicesProvidedModel> servicesProvided;
  SuccessSearch({required this.servicesProvided});
}
