part of 'provider_home_bloc.dart';

@immutable
sealed class ProviderHomeEvent {}

// class ChangeDataView extends ProviderHomeEvent {
//   final EnumTypeOfShowChart selectedDataView;

//   ChangeDataView(EnumTypeOfShowChart newType, {required this.selectedDataView});
// }

class ChangeDataView extends ProviderHomeEvent {
  final EnumTypeOfShowChart selectedDataView;
  ChangeDataView(this.selectedDataView);
}

class LoadData extends ProviderHomeEvent{}
