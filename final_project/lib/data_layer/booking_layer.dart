// import 'package:final_project/core/enum/types.dart';
// import 'package:final_project/models/booking/model_bookin_images.dart';
// import 'package:final_project/models/booking/model_booking.dart';
// import 'package:final_project/repo/booking.dart';
// import 'package:final_project/repo/supabase.dart';

// class BookingLayer {
//   static getAllCustomerBooking() async {
//     var data = await Booking.loadCustomerBooking();
//     List<ModelBooking> allCustomerBooking = List.from(
//       data ?? [],
//     ).map((item) => ModelBooking.fromJson(item)).toList();

//     return allCustomerBooking;
//   }

//   static getAllProviderBooking() async {
//     var data = await Booking.loadProviderBooking();
//     List<ModelBooking> allCustomerBooking = List.from(
//       data ?? [],
//     ).map((item) => ModelBooking.fromJson(item)).toList();

//     return allCustomerBooking;
//   }

//   static Map<String, List<ModelBooking>> getBookingByStatus({
//     required List<ModelBooking>? allBooking,
//   }) {
//     final now = DateTime.now();
//     List<ModelBooking> waitingToday = [];
//     List<ModelBooking> acceptedToday = [];
//     List<ModelBooking> past = [];
//     List<ModelBooking> canceled = [];

//     for (var booking in allBooking!) {
//       final bookingDate = DateTime.parse(booking.date!);
//       final isToday =
//           bookingDate.year == now.year &&
//           bookingDate.month == now.month &&
//           bookingDate.day == now.day;

//       if (booking.status == 'send' && isToday) {
//         waitingToday.add(booking);
//       } else if (booking.status == 'accepted' && isToday) {
//         acceptedToday.add(booking);
//       } else if (booking.status == 'rejected' || booking.status == 'canceled') {
//         canceled.add(booking);
//       } else {
//         past.add(booking);
//       }
//     }

//     return {
//       'currentBookingNotAccepted': waitingToday,
//       'currentBookingAccepted': acceptedToday,
//       'pastBooking': past,
//       'canceledBooking': canceled,
//     };
//   }

//   static Future<List<ModelBookingImages>> getImageOfServiceProvided({
//     required int provideServiceId,
//   }) async {
//     var data =
//         await Booking.loadImageFromTableServiceImageHasSameProvideServiceId(
//           provideServiceId: provideServiceId,
//         );
//     // print("getImageOfServiceProvided ");

//     List<ModelBookingImages> allImages = List.from(
//       data ?? [],
//     ).map((item) => ModelBookingImages.fromJson(item)).toList();
//     return allImages;
//   }

//   static Future<bool> updateBookingStatus({
//     required int bookingId,
//     required String status,
//   }) async {
//     try {
//       final result = await SupabaseConnect.supabase!.client
//           .from('service_requests')
//           .update({'status': status})
//           .eq('id', bookingId)
//           .select()
//           .maybeSingle();

//       return result != null;
//     } catch (e) {
//       print("Error updating booking status: $e");
//       return false;
//     }
//   }
// }

import 'package:final_project/core/enum/types.dart';
import 'package:final_project/models/booking/model_bookin_images.dart';
import 'package:final_project/models/booking/model_booking.dart';
import 'package:final_project/repo/booking.dart';

class BookingLayer {
  static getAllCustomerBooking() async {
    var data = await Booking.loadCustomerBooking();
    List<ModelBooking> allCustomerBooking = List.from(
      data ?? [],
    ).map((item) => ModelBooking.fromJson(item)).toList();

    return allCustomerBooking;
  }

  static getAllProviderBooking() async {
    var data = await Booking.loadProviderBooking();
    List<ModelBooking> allCustomerBooking = List.from(
      data ?? [],
    ).map((item) => ModelBooking.fromJson(item)).toList();

    return allCustomerBooking;
  }

  static Map<String, List<ModelBooking>>? getBookingByStatus({
    required List<ModelBooking>? allBooking,
  }) {
    DateTime now = DateTime.now();
    String formattedDate =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

    if (allBooking != null) {
      // currentBookingNotAcceptedYet is the booking have status send and the date is >= date now

      // List<ModelBooking> currentBookingNotAcceptedYet = allBooking
      //     .where(
      //       (booking) =>
      //           booking!.status == EnumBookingStatus.send.name &&
      //           (
      //             DateTime.parse(booking.date!).isAtSameMomentAs(DateTime.parse(formattedDate)) ||
      //             DateTime.parse(booking.date!).isAfter(DateTime.parse(formattedDate))
      //           ),
      //     )
      //     .toList();

      List<ModelBooking> currentBookingNotAcceptedYet = allBooking
          .where(
            (booking) =>
                booking!.status == EnumBookingStatus.send.name &&
                    DateTime.parse(
                      booking!.date!,
                    ).isAtSameMomentAs(DateTime.parse(formattedDate)) ||
                DateTime.parse(
                  booking!.date!,
                ).isAfter(DateTime.parse(formattedDate)),
          )
          .toList();
      // currentBookingAccepted is the booking have status accepted and the date is >= date now
      // List<ModelBooking> currentBookingAccepted = allBooking
      //     .where(
      //       (booking) =>
      //           booking!.status == EnumBookingStatus.accepted.name &&
      //           (DateTime.parse(
      //                 booking.date!,
      //               ).isAtSameMomentAs(DateTime.parse(formattedDate)) ||
      //               DateTime.parse(
      //                 booking.date!,
      //               ).isAfter(DateTime.parse(formattedDate))),
      //     )
      //     .toList();

      List<ModelBooking> currentBookingAccepted = allBooking
          .where(
            (booking) =>
                booking!.status == EnumBookingStatus.accepted.name &&
                    DateTime.parse(
                      booking!.date!,
                    ).isAtSameMomentAs(DateTime.parse(formattedDate)) ||
                DateTime.parse(
                  booking!.date!,
                ).isAfter(DateTime.parse(formattedDate)),
          )
          .toList();
      // pastBooking is the booking have status accepted and the date is < date now

      List<ModelBooking> pastBooking = allBooking
          .where(
            (booking) =>
                booking!.status == EnumBookingStatus.accepted.name &&
                DateTime.parse(
                  booking!.date!,
                ).isBefore(DateTime.parse(formattedDate)),
          )
          .toList();
      // pastBooking is the booking have status accepted and the date is < date now

      List<ModelBooking> canceledBooking = allBooking
          .where(
            (booking) => booking!.status == EnumBookingStatus.rejected.name,
          )
          .toList();

      return {
        'currentBookingNotAcceptedYet': currentBookingNotAcceptedYet,
        'currentBookingAccepted': currentBookingAccepted,
        'pastBooking': pastBooking,
        'canceledBooking': canceledBooking,
      };
    }
    return null;
  }

  static Future<List<ModelBookingImages>> getImageOfServiceProvided({
    required int provideServiceId,
  }) async {
    var data =
        await Booking.loadImageFromTableServiceImageHasSameProvideServiceId(
          provideServiceId: provideServiceId,
        );
    // print("getImageOfServiceProvided ");

    List<ModelBookingImages> allImages = List.from(
      data ?? [],
    ).map((item) => ModelBookingImages.fromJson(item)).toList();
    return allImages;
  }
}
