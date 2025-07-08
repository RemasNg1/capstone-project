// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:final_project/data_layer/auth_layer.dart';
// import 'package:final_project/data_layer/booking_layer.dart';
// import 'package:final_project/models/booking/model_booking.dart';
// import 'package:final_project/repo/booking.dart';
// import 'package:hive/hive.dart';
// import 'package:meta/meta.dart';

// part 'bookings_event.dart';
// part 'bookings_state.dart';

// class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
//   List<ModelBooking>? allProviderBooking = [];
//   List<ModelBooking>? currentBookingNotAccepted = [];
//   List<ModelBooking>? currentBookingAccepted = [];
//   List<ModelBooking>? pastBooking = [];
//   List<ModelBooking>? canceledBooking = [];

//   BookingsBloc() : super(BookingsInitial()) {
//     // ✅ تحميل البيانات
//     on<BookingsLoadingData>(loadingData);

//     // ✅ قبول الحجز
//     on<AcceptBooking>((event, emit) async {
//       emit(BookingLoading());
//       final success = await BookingLayer.updateBookingStatus(
//         bookingId: event.bookingId,
//         status: 'accepted',
//       );
//       if (success) {
//         add(BookingsLoadingData());
//       } else {
//         emit(BookingError());
//       }
//     });

//     // ✅ رفض الحجز
//     on<RejectBooking>((event, emit) async {
//       emit(BookingLoading());
//       final success = await BookingLayer.updateBookingStatus(
//         bookingId: event.bookingId,
//         status: 'rejected',
//       );
//       if (success) {
//         add(BookingsLoadingData());
//       } else {
//         emit(BookingError());
//       }
//     });
//   }

//   FutureOr<void> loadingData(
//     BookingsLoadingData event,
//     Emitter<BookingsState> emit,
//   ) async {
//     emit(BookingLoading());

//     try {
//       allProviderBooking = await BookingLayer.getAllProviderBooking();

//       if (allProviderBooking == null) {
//         emit(BookingError());
//         return;
//       }

//       Map<String, List<ModelBooking>?>? bookingList =
//           BookingLayer.getBookingByStatus(allBooking: allProviderBooking);

//       if (bookingList != null) {
//         currentBookingNotAccepted = bookingList['currentBookingNotAccepted'];
//         currentBookingAccepted = bookingList['currentBookingAccepted'];
//         pastBooking = bookingList['pastBooking'];
//         canceledBooking = bookingList['canceledBooking'];

//         emit(BookingLoadingSuccessfully());
//       } else {
//         emit(BookingError());
//       }
//     } catch (e) {
//       print("Error loading data: $e");
//       emit(BookingError());
//     }
//   }
// }
