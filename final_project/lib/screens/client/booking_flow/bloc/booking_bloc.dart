import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_project/core/enum/types.dart';
import 'package:final_project/data_layer/chat_layer.dart';
import 'package:final_project/models/chat/model_message.dart';
import 'package:final_project/repo/service.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  List<ModelMessage> conversionMessages = [];
  ChatLayer chatLayer = ChatLayer();
  DateTime selectedDay = DateTime.now();

  BookingBloc() : super(BookingInitial()) {
    on<BookingEvent>((event, emit) {});
    on<DaySelected>(calenderMethod);
    on<SubmitBooking>(bookingMethod);
    on<ToggleFavoriteEvent>(favoriteMethod);
    on<LoadConversion>(loadConversion);
  }

  FutureOr<void> loadConversion(
    LoadConversion event,
    Emitter<BookingState> emit,
  ) async {
    conversionMessages = await chatLayer.getUserConversions(
      userType: EnumUserType.customer,
      authId: Supabase.instance.client.auth.currentUser!.id,
    );
    emit(LoadingConversationSuccessfully());
  }

  FutureOr<void> calenderMethod(DaySelected event, Emitter<BookingState> emit) {
    selectedDay = event.selectedDay;
    emit(CalendarSelectedSuccess());
  }

  FutureOr<void> bookingMethod(
    SubmitBooking event,
    Emitter<BookingState> emit,
  ) {
    Service.insertBooking(
      serviceId: event.serviceId,
      serviceLocationId: event.serviceLocationId,
      date: event.date,
    );
  }

  FutureOr<void> favoriteMethod(
    ToggleFavoriteEvent event,
    Emitter<BookingState> emit,
  ) async {
    try {
      await Service.toggleFavorite(serviceId: event.serviceId);

      final favorites = await Service.fetchFavoriteServices();
      final isFavorite = favorites.any(
        (fav) => fav.serviceProvidedId == event.serviceId,
      );

      emit(FavoriteToggledState(isFavorite: isFavorite));
    } catch (e) {
      emit(FavoriteErrorState(message: 'Favorite error: $e'));
    }
  }
}
