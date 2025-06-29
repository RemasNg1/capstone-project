part of 'provider_home_bloc.dart';

@immutable
sealed class ProviderHomeEvent {}
class ChangeDataView extends ProviderHomeEvent{
  final EnumTypeOfShowChart selectedDataView ;

  ChangeDataView({required this.selectedDataView});
}