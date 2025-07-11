import 'package:final_project/core/enum/types.dart';
import 'package:final_project/models/booking/model_bookin_images.dart';
import 'package:final_project/models/booking/model_booking.dart';
import 'package:final_project/repo/booking.dart';

class BookingLayer {
  // Utility method to check if two dates have the same day, month, and year

  static bool isSameDate(DateTime d1, DateTime d2) {
    return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
  }
  // Get all bookings made by the current customer

  static getAllCustomerBooking() async {
    var data = await Booking.loadCustomerBooking();
    List<ModelBooking> allCustomerBooking = List.from(
      data ?? [],
    ).map((item) => ModelBooking.fromJson(item)).toList();

    return allCustomerBooking;
  }
  // Get all bookings received by the current provider

  static getAllProviderBooking() async {
    var data = await Booking.loadProviderBooking();
    List<ModelBooking> allProviderBooking = List.from(
      data ?? [],
    ).map((item) => ModelBooking.fromJson(item)).toList();

    return allProviderBooking;
  }
  // Categorize bookings based on their status

  static Map<String, List<ModelBooking>>? getBookingByStatus({
    required List<ModelBooking>? allBooking,
  }) {
    if (allBooking == null) return null;

    final now = DateTime.now();

    // List<ModelBooking> currentBookingNotAcceptedYet = allBooking.where((
    //   booking,
    // ) {
    //   final bookingDate = DateTime.parse(booking.date!);
    //   return booking.status == EnumBookingStatus.send.name &&
    //       (isSameDate(bookingDate, now) || bookingDate.isAfter(now));
    // }).toList();

    // Accepted bookings or sent bookings for today or in the future

    List<ModelBooking> currentBookingAccepted = allBooking.where((booking) {
      final bookingDate = DateTime.parse(booking.date!);
      return (booking.status == EnumBookingStatus.accepted.name ||
              booking.status == EnumBookingStatus.send.name) &&
          (isSameDate(bookingDate, now) || bookingDate.isAfter(now));
    }).toList();

    // Accepted bookings that are already in the past
    List<ModelBooking> pastBooking = allBooking.where((booking) {
      final bookingDate = DateTime.parse(booking.date!);
      return booking.status == EnumBookingStatus.accepted.name &&
          bookingDate.isBefore(now);
      //  bookingDate.isBefore(DateTime(now.year, now.month, now.day));
    }).toList();

    List<ModelBooking> canceledBooking = allBooking.where((booking) {
      return booking.status == EnumBookingStatus.rejected.name;
    }).toList();

    return {
      // 'currentBookingNotAcceptedYet': currentBookingNotAcceptedYet,
      'currentBookingAccepted': currentBookingAccepted,
      'pastBooking': pastBooking,
      'canceledBooking': canceledBooking,
    };
  }
  // Get all images associated with a specific provided service

  static Future<List<ModelBookingImages>> getImageOfServiceProvided({
    required int provideServiceId,
  }) async {
    var data =
        await Booking.loadImageFromTableServiceImageHasSameProvideServiceId(
          provideServiceId: provideServiceId,
        );
    // Convert raw data to a list of ModelBookingImages objects

    List<ModelBookingImages> allImages = List.from(
      data ?? [],
    ).map((item) => ModelBookingImages.fromJson(item)).toList();

    return allImages;
  }
}
