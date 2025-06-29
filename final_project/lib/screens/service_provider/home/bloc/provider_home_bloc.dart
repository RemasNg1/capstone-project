import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_project/core/enum/types.dart';
import 'package:meta/meta.dart';

part 'provider_home_event.dart';
part 'provider_home_state.dart';

class ProviderHomeBloc extends Bloc<ProviderHomeEvent, ProviderHomeState> {
  final List<int> listOfValue = [
    1000,
    40000,
    90000,
    19000000,
    400000,
    900000,
    1000,
  ];
   EnumTypeOfShowChart selectedDataView= EnumTypeOfShowChart.week;
  final Set<DateTime> unavailableDays = {
    DateTime(2025, 6, 6, 6, 6),
    DateTime(2025, 6, 27, 6, 6),
  };
  final Set<DateTime> selectedDays = {
    DateTime(2025, 6, 8, 6, 6),
    DateTime(2025, 6, 15, 6, 6),
  };
  final int acceptedOrder = 10;
  final int rejectedOrder = 3;
  ProviderHomeBloc() : super(ProviderHomeInitial()) {
    on<ProviderHomeEvent>((event, emit) {});
    on<ChangeDataView>(changeDataView);
  }

  FutureOr<void> changeDataView(ChangeDataView event, Emitter<ProviderHomeState> emit) {
    selectedDataView=event.selectedDataView;
    print(event.selectedDataView);
    emit(ChangeDataViewSuccessful());
  }
}
