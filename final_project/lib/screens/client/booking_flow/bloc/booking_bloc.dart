import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_project/repo/service.dart';
import 'package:meta/meta.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  DateTime selectedDay = DateTime.now();

  BookingBloc() : super(BookingInitial()) {
    on<BookingEvent>((event, emit) {});
    on<DaySelected>(calenderMethod);
    on<SubmitBooking>(bookingMethod);
  }

  FutureOr<void> calenderMethod(DaySelected event, Emitter<BookingState> emit) {
    selectedDay = event.selectedDay;
    emit(CalendarSelectedSuccess());
  }

  FutureOr<void> bookingMethod(
    SubmitBooking event,
    Emitter<BookingState> emit,
  ) {
    print(event.serviceId);
    print(event.serviceLocationId);
    print(event.date);
    Service.insertBooking(
      serviceId: event.serviceId,
      serviceLocationId: event.serviceLocationId,
      date: event.date,
    );
  }
}
