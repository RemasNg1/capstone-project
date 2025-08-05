// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:final_project/core/enum/types.dart';
// import 'package:meta/meta.dart';

// part 'provider_home_event.dart';
// part 'provider_home_state.dart';

// class ProviderHomeBloc extends Bloc<ProviderHomeEvent, ProviderHomeState> {
//   final List<int> listOfValue = [
//     1000,
//     40000,
//     90000,
//     19000000,
//     400000,
//     900000,
//     1000,
//   ];
//    EnumTypeOfShowChart selectedDataView= EnumTypeOfShowChart.week;
//   final Set<DateTime> unavailableDays = {
//     DateTime(2025, 6, 6, 6, 6),
//     DateTime(2025, 6, 27, 6, 6),
//   };
//   final Set<DateTime> selectedDays = {
//     DateTime(2025, 6, 8, 6, 6),
//     DateTime(2025, 6, 15, 6, 6),
//   };
//   final int acceptedOrder = 10;
//   final int rejectedOrder = 3;
//   ProviderHomeBloc() : super(ProviderHomeInitial()) {
//     on<ProviderHomeEvent>((event, emit) {});
//     on<ChangeDataView>(changeDataView);
//   }

//   FutureOr<void> changeDataView(ChangeDataView event, Emitter<ProviderHomeState> emit) {
//     selectedDataView=event.selectedDataView;
//     print(event.selectedDataView);
//     emit(ChangeDataViewSuccessful());
//   }
// }

// // import 'dart:async';

// // import 'dart:async';

// // import 'package:bloc/bloc.dart';
// // import 'package:final_project/core/enum/types.dart';
// // import 'package:meta/meta.dart';

// // part 'provider_home_event.dart';
// // part 'provider_home_state.dart';

// // class ProviderHomeBloc extends Bloc<ProviderHomeEvent, ProviderHomeState> {
// //   final List<int> listOfValue = [
// //     1000,
// //     40000,
// //     90000,
// //     19000000,
// //     400000,
// //     900000,
// //     1000,
// //   ];
// //    EnumTypeOfShowChart selectedDataView= EnumTypeOfShowChart.week;
// //   final Set<DateTime> unavailableDays = {
// //     DateTime(2025, 6, 6, 6, 6),
// //     DateTime(2025, 6, 27, 6, 6),
// //   };
// //   final Set<DateTime> selectedDays = {
// //     DateTime(2025, 6, 8, 6, 6),
// //     DateTime(2025, 6, 15, 6, 6),
// //   };
// //   final int acceptedOrder = 10;
// //   final int rejectedOrder = 3;
// //   ProviderHomeBloc() : super(ProviderHomeInitial()) {
// //     on<ProviderHomeEvent>((event, emit) {});
// //     on<ChangeDataView>(changeDataView);
// //   }

// //   FutureOr<void> changeDataView(ChangeDataView event, Emitter<ProviderHomeState> emit) {
// //     selectedDataView=event.selectedDataView;
// //     print(event.selectedDataView);
// //     emit(ChangeDataViewSuccessful());
// //   }
// // }

// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:final_project/core/enum/types.dart';
// import 'package:meta/meta.dart';

// part 'provider_home_event.dart';
// part 'provider_home_state.dart';

// class ProviderHomeBloc extends Bloc<ProviderHomeEvent, ProviderHomeState> {
//   List<int> get listOfValue {
//     switch (selectedDataView) {
//       case EnumTypeOfShowChart.week:
//         return _weekData;
//       case EnumTypeOfShowChart.month:
//         return _monthData;
//       case EnumTypeOfShowChart.year:
//         return _yearData;
//     }
//   }

//   EnumTypeOfShowChart selectedDataView = EnumTypeOfShowChart.week;
//   final Set<DateTime> unavailableDays = {
//     DateTime(2025, 6, 6, 6, 6),
//     DateTime(2025, 6, 27, 6, 6),
//   };
//   final Set<DateTime> selectedDays = {
//     DateTime(2025, 6, 8, 6, 6),
//     DateTime(2025, 6, 15, 6, 6),
//   };
//   final int acceptedOrder = 10;
//   final int rejectedOrder = 3;
//   ProviderHomeBloc() : super(ProviderHomeInitial()) {
//     on<ProviderHomeEvent>((event, emit) {});
//     on<ChangeDataView>(changeDataView);
//   }

//   FutureOr<void> changeDataView(
//     ChangeDataView event,
//     Emitter<ProviderHomeState> emit,
//   ) {
//     selectedDataView = event.selectedDataView;
//     print(event.selectedDataView);
//     emit(ChangeDataViewSuccessful());
//   }

//   final List<int> _weekData = [100, 200, 300, 400, 500, 600, 700];
//   final List<int> _monthData = [1500, 1200, 1800, 1300, 1700, 1600, 2000];
//   final List<int> _yearData = [10000, 15000, 12000, 18000, 20000, 17000, 19000];
// }

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:final_project/core/enum/types.dart';
import 'package:final_project/data_layer/booking_layer.dart';
import 'package:final_project/models/booking/model_booking.dart';
import 'package:final_project/repo/booking_repo.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'provider_home_event.dart';
part 'provider_home_state.dart';

class ProviderHomeBloc extends Bloc<ProviderHomeEvent, ProviderHomeState> {
  // Initial selected chart type (Week)
  EnumTypeOfShowChart selectedDataView = EnumTypeOfShowChart.week;

  // number of accepted and rejected orders
  int acceptedOrder = 0;
  int rejectedOrder = 0;

  // Mock income data for each chart type
  List<double> _weekData = [];
  List<double> _monthData = [];
  List<double> _yearData = [];
  List<String> yearTitle = [];
  List<String> monthTitle = [];

  Map<String, double> weeklySummary = {};
  Map<String, double> yearlySummary = {};
  Map<String, double> monthlySummary = {};
  // Getter that returns the correct data set based on the selected view
  List<double> get listOfValue {
    switch (selectedDataView) {
      case EnumTypeOfShowChart.week:
        return _weekData;
      case EnumTypeOfShowChart.month:
        return _monthData;
      case EnumTypeOfShowChart.year:
        return _yearData;
    }
  }

  final BookingRepository repository = BookingRepository(
    Supabase.instance.client,
  );

  // Constructor: initializes with initial state and handles events
  ProviderHomeBloc() : super(ProviderHomeInitial()) {
    on<ProviderHomeEvent>((event, emit) {});

    // Handle ChangeDataView events with a separate method
    on<ChangeDataView>(changeDataView);
    // load data from supabase

    on<LoadData>(loadData);
  }

  // Method to update selectedDataView when user changes chart type
  FutureOr<void> changeDataView(
    ChangeDataView event,
    Emitter<ProviderHomeState> emit,
  ) {
    selectedDataView = event.selectedDataView;
    print("Selected type: $selectedDataView");
    emit(ChangeDataViewSuccessful()); // Emit new state to update UI
  }

  FutureOr<void> loadData(
    LoadData event,
    Emitter<ProviderHomeState> emit,
  ) async {
    emit(ProviderHomeLoading()); // ⬅️ هذا الجديد

    print('loadData');
    List<ModelBooking> allBooking = await BookingLayer.getAllProviderBooking();

    weeklySummary = BookingLayer.getWeeklySummary(allBooking);
    _weekData = weeklySummary.values.toList();

    yearlySummary = BookingLayer.getLast7YearsSummary(allBooking);
    _yearData = yearlySummary.values.toList();
    yearTitle = yearlySummary.keys.toList();

    monthlySummary = BookingLayer.getLast7MonthsSummary(allBooking);
    _monthData = monthlySummary.values.toList();
    monthTitle = monthlySummary.keys.toList();

    acceptedOrder = allBooking.where((e) => e.status == "accepted").length;
    rejectedOrder = allBooking.where((e) => e.status == "rejected").length;

    emit(LoadDataSuccessfully());
  }
}
