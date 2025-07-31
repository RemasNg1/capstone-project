part of 'bookings_bloc.dart';

@immutable
sealed class BookingsEvent {}

class BookingsLoadingData extends BookingsEvent {}

class RatingChangedEvent extends BookingsEvent {
  final int rating;
  RatingChangedEvent(this.rating);
}

class SubmitServiceRating extends BookingsEvent {
  final int serviceProvidedId;
  final int bookingId;
  final double rating;
  final String note;

  SubmitServiceRating({
    required this.serviceProvidedId,
    required this.bookingId,
    required this.rating,
    required this.note,
  });
}
