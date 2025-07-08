import 'package:final_project/models/booking_model/service_request.dart';

abstract class BookingsState {}

class BookingsLoading extends BookingsState {}

class BookingsLoaded extends BookingsState {
  final List<ServiceRequest> waiting;
  final List<ServiceRequest> current;
  final List<ServiceRequest> past;
  final List<ServiceRequest> canceled;

  BookingsLoaded({
    required this.waiting,
    required this.current,
    required this.past,
    required this.canceled,
  });
}

class BookingsError extends BookingsState {
  final String message;
  BookingsError(this.message);
}
