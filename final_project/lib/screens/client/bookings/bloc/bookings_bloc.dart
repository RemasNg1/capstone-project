import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_project/core/enum/types.dart';
import 'package:final_project/data_layer/auth_layer.dart';
import 'package:final_project/data_layer/booking_layer.dart';
import 'package:final_project/models/booking/model_booking.dart';
import 'package:final_project/repo/booking.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:meta/meta.dart';

part 'bookings_event.dart';
part 'bookings_state.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  List<ModelBooking>? allCustomerBooking = [];
  int selectedRating = 0;

  int rate = 0;
  final ratingsFormKey = GlobalKey<FormState>();
  TextEditingController notesController = TextEditingController();
  // List<ModelBooking>? currentBookingNotAccepted = [];
  List<ModelBooking>? currentBookingAccepted = [];
  List<ModelBooking>? pastBooking = [];
  List<ModelBooking>? canceledBooking = [];
  Box get box => Hive.box('userInfo');
  String? get userTypeString => box.get('userType');
  BookingsBloc() : super(BookingsInitial()) {
    on<BookingsEvent>((event, emit) {});
    on<BookingsLoadingData>(loadingData);
    on<RatingChangedEvent>((event, emit) {
      selectedRating = event.rating;
      emit(RatingUpdatedState(selectedRating));
    });

    on<SubmitServiceRating>((event, emit) async {
      emit(BookingLoading());

      try {
        await Booking.rateService(
          serviceProvidedId: event.serviceProvidedId,
          bookingId: event.bookingId,
          rating: event.rating,
          note: event.note,
        );

        emit(BookingLoadingSuccessfully());
      } catch (e) {
        throw Exception("فشل إرسال التقييم: $e");
      }
    });
  }

  FutureOr<void> loadingData(
    BookingsLoadingData event,
    Emitter<BookingsState> emit,
  ) async {
    if (userTypeString == EnumUserType.guest.name) {
      emit(UserLoggedInAsAnonymousState());
      return;
    }
    // box.add('userType',);
    // print(AuthLayer.box.get('userType')); // Dave: 22
    print(AuthLayer.box.get('authId')); // Dave: 22
    emit(BookingLoading());
    allCustomerBooking = await BookingLayer.getAllCustomerBooking();

    // take all provider id to download his images
    Set<int?> serviceProvidedIdsSet = allCustomerBooking!
        .map((booking) => booking.serviceProvidedId)
        .toSet();

    print("providerd id = : ${serviceProvidedIdsSet.length}");
    Map<String, List<ModelBooking>?>? bookingList =
        BookingLayer.getBookingByStatus(allBooking: allCustomerBooking);

    if (bookingList != null) {
      // currentBookingNotAccepted = bookingList['currentBookingNotAccepted'];
      currentBookingAccepted = bookingList['currentBookingAccepted'];
      pastBooking = bookingList['pastBooking'];
      canceledBooking = bookingList['canceledBooking'];
      emit(BookingLoadingSuccessfully());
      // print(bookingList['pastBooking']![0].serviceProvidedId);
    }

    // print(
    //   "currentBookingNotAccepted:  ${bookingList['currentBookingNotAccepted']?[0].servicesProvided!.titleEn} ${bookingList['currentBookingNotAccepted']?[0].status} | ${bookingList['currentBookingNotAccepted']?[0].date}",
    // );
    // print(
    //   "currentBookingAccepted:  ${bookingList['currentBookingAccepted']?[0].servicesProvided!.titleEn} ${bookingList['currentBookingAccepted']?[0].status} | ${bookingList['currentBookingAccepted']?[0].date}",
    // );
    // print(
    //   "pastBooking:  ${bookingList['pastBooking']?[0].servicesProvided!.titleEn} ${bookingList['pastBooking']?[0].status} | ${bookingList['pastBooking']?[0].date}",
    // );
    // print(
    //   "canceledBooking:  ${bookingList['canceledBooking']?[0].servicesProvided!.titleEn} ${bookingList['canceledBooking']?[0].status} | ${bookingList['canceledBooking']?[0].date}",
    // );
  }
}
