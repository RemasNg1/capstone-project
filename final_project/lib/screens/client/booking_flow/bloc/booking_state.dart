part of 'booking_bloc.dart';

@immutable
sealed class BookingState {}

final class BookingInitial extends BookingState {}

class CalendarSelectedSuccess extends BookingState {
  CalendarSelectedSuccess();
}

class FavoriteToggledState extends BookingState {
  final bool isFavorite;

  FavoriteToggledState({required this.isFavorite});
}

class FavoriteErrorState extends BookingState {
  final String message;

  FavoriteErrorState({required this.message});
}

class LoadingConversationSuccessfully extends BookingState {}
