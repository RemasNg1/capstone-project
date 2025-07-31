import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:bloc/bloc.dart';
import 'package:final_project/core/enum/types.dart';
import 'package:final_project/data_layer/chat_layer.dart';
import 'package:final_project/models/chat/model_message.dart';
import 'package:final_project/repo/service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  List<ModelMessage> conversionMessages = [];
  ChatLayer chatLayer = ChatLayer();
  DateTime selectedDay = DateTime.now();
  // final box = Hive.box('userInfo');
  //     final userTypeString = box.get('userType');
  Box get box => Hive.box('userInfo');
  String? get userTypeString => box.get('userType');

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
      if (userTypeString != EnumUserType.customer.name) {
        if (event.context != null) {
          Flushbar(
            message: "الرجاء تسجيل الدخول للإضافة للمفضلة",
            backgroundColor: Colors.red,
            icon: const Icon(Icons.error, color: Colors.white),
            duration: const Duration(seconds: 3),
            flushbarPosition: FlushbarPosition.BOTTOM,
            borderRadius: BorderRadius.circular(8),
            margin: const EdgeInsets.all(16),
          ).show(event.context!);
        }

        return;
      }
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
