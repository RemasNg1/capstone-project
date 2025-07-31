import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/core/enum/types.dart';
import 'package:final_project/models/booking/model_bookin_images.dart';
import 'package:final_project/models/booking/model_booking.dart';
import 'package:final_project/repo/booking.dart';

class BookingLayer {
  static Map<int, String> dayAbbreviations = {
    1: 'Mn',
    2: 'Tu',
    3: 'Wd',
    4: 'Th',
    5: 'Fr',
    6: 'St',
    7: 'Su',
  };

  static Map<int, String> monthAbbreviations = {
    1: 'Jan',
    2: 'Feb',
    3: 'Mar',
    4: 'Apr',
    5: 'May',
    6: 'Jun',
    7: 'Jul',
    8: 'Aug',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec',
  };

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

  static Future<List<ModelBooking>> getAllProviderBooking() async {
    var data = await Booking.loadProviderBooking();
    List<ModelBooking> allProviderBooking = List.from(
      data ?? [],
    ).map((item) => ModelBooking.fromJson(item)).toList();

    return allProviderBooking;
  }

  static Future<List<ModelBooking>> getProviderBookingForCurrentWeek() async {
    var data = await Booking.loadProviderBookingCurrentWeek();
    List<ModelBooking> allProviderBooking = List.from(
      data ?? [],
    ).map((item) => ModelBooking.fromJson(item)).toList();

    return allProviderBooking;
  }

  static Future<List<ModelBooking>> getProviderBookingForCurrentYear() async {
    var data = await Booking.loadProviderBookingCurrentYear();
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
          // bookingDate.isBefore(now);
          bookingDate.isBefore(DateTime(now.year, now.month, now.day));
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

  static Map<String, double> getWeeklySummary(List<ModelBooking> allBookings) {
    final now = DateTime.now();
    final daysToMonday = now.weekday - 1;
    final startOfWeek = DateTime(
      now.year,
      now.month,
      now.day,
    ).subtract(Duration(days: daysToMonday));
    final endOfWeek = startOfWeek
        .add(Duration(days: 7))
        .subtract(Duration(milliseconds: 1));

    Map<String, double> dailySums = {
      'Mn': 0.0,
      'Tu': 0.0,
      'Wd': 0.0,
      'Th': 0.0,
      'Fr': 0.0,
      'St': 0.0,
      'Su': 0.0,
    };

    for (var booking in allBookings) {
      if (booking.date != null && booking.status == 'accepted') {
        final bookingDate = DateTime.tryParse(booking.date!);
        final double price = booking.servicesProvided?.price ?? 0.0;

        if (bookingDate != null &&
            !bookingDate.isBefore(startOfWeek) &&
            !bookingDate.isAfter(endOfWeek)) {
          final String dayAbbreviation = dayAbbreviations[bookingDate.weekday]!;
          dailySums[dayAbbreviation] =
              (dailySums[dayAbbreviation] ?? 0.0) + price;
        }
      }
    }
    return dailySums;
  }

  static Map<String, double> getLast7YearsSummary(
    List<ModelBooking> allBookings,
  ) {
    final now = DateTime.now();
    final currentYear = now.year;

    final yearFormatter = DateFormat('yy'); // Formats '2025' to '25'

    Map<String, double> yearlySums = {};
    for (int year = currentYear - 6; year <= currentYear; year++) {
      final yearKey = yearFormatter.format(DateTime(year));
      yearlySums[yearKey] = 0.0;
    }

    for (var booking in allBookings) {
      if (booking.date != null && booking.status == 'accepted') {
        final bookingDate = DateTime.tryParse(booking.date!);
        final double price = booking.servicesProvided?.price ?? 0.0;

        if (bookingDate != null) {
          final String bookingYearKey = yearFormatter.format(
            bookingDate,
          ); // e.g., '25' for a booking in 2025
          if (yearlySums.containsKey(bookingYearKey)) {
            yearlySums[bookingYearKey] =
                (yearlySums[bookingYearKey] ?? 0.0) + price;
          }
        }
      }
    }
    return yearlySums;
  }

  static Map<String, double> getLast7MonthsSummary(
    List<ModelBooking> allBookings,
  ) {
    final now = DateTime.now();
    final startOfPeriod = DateTime(now.year, now.month - 6, 1);

    Map<String, double> monthlySums = {};
    List<String> orderedMonthKeys = [];

    for (int i = 0; i < 7; i++) {
      final monthDateTime = DateTime(
        startOfPeriod.year,
        startOfPeriod.month + i,
        1,
      );
      final String monthKey = "${monthAbbreviations[monthDateTime.month]!}";
      monthlySums[monthKey] = 0.0;
      orderedMonthKeys.add(monthKey);
    }

    for (var booking in allBookings) {
      if (booking.date != null && booking.status == 'accepted') {
        final bookingDate = DateTime.tryParse(booking.date!);
        final double price = booking.servicesProvided?.price ?? 0.0;

        if (bookingDate != null) {
          final String bookingMonthKey =
              "${monthAbbreviations[bookingDate.month]!}";

          if (monthlySums.containsKey(bookingMonthKey)) {
            monthlySums[bookingMonthKey] =
                (monthlySums[bookingMonthKey] ?? 0.0) + price;
          }
        }
      }
    }

    Map<String, double> orderedMonthlyResult = {};
    for (String key in orderedMonthKeys) {
      orderedMonthlyResult[key] = monthlySums[key]!;
    }
    return orderedMonthlyResult;
  }
}
