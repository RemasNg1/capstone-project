part of 'booking_bloc.dart';

@immutable
sealed class BookingEvent {}

class DaySelected extends BookingEvent {
  final DateTime selectedDay;
  DaySelected(this.selectedDay);
}

class SubmitBooking extends BookingEvent {
  final int serviceId;
  final int serviceLocationId;
  final DateTime date;

  SubmitBooking({
    required this.serviceId,
    required this.serviceLocationId,
    required this.date,
  });
}

class ToggleFavoriteEvent extends BookingEvent {
  final int serviceId;

  ToggleFavoriteEvent({required this.serviceId});
}

class LoadConversion extends BookingEvent {}
