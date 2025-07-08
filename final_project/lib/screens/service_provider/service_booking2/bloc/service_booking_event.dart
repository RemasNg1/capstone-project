part of 'service_booking_bloc.dart';

abstract class BookingsEvent {}

class LoadBookings extends BookingsEvent {}

class UpdateBookingStatus extends BookingsEvent {
  final int requestId;
  final String newStatus;

  UpdateBookingStatus(this.requestId, this.newStatus);
}
