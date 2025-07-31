import 'package:final_project/data_layer/auth_layer.dart';
import 'package:final_project/repo/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Booking {
  static Supabase? supabase = SupabaseConnect.supabase;

  static Future loadCustomerBooking() async {
    String currentAuthId = AuthLayer.box.get('authId');
    print("loadCustomerBooking +++++++______$currentAuthId");
    try {
      final result = await supabase?.client
          // services_provided(*)
          .from("service_requests")
          .select(
            "*,service_locations(*),services_provided(*),service_ratings(*)",
          )
          .eq('user_auth_id', currentAuthId);
      return result;
    } catch (error) {
      throw FormatException("$error");
    }
  }

  // static Future loadProviderBooking() async {
  //   String currentAuthId = AuthLayer.box.get('authId');
  //   print("loadProviderBooking");
  //   try {
  //     final result = await supabase?.client
  //         // services_provided(*)
  //         .from("service_requests")
  //         .select("*,service_locations(*),services_provided(*)")
  //         .eq('services_provided.provider_auth_id', currentAuthId);
  //     return result;
  //   } catch (error) {
  //     throw FormatException("$error");
  //   }
  // }

  static Future loadProviderBooking() async {
    String currentAuthId = AuthLayer.box.get('authId');
    try {
      final result = await supabase?.client
          .from("service_requests")
          .select("*,service_locations(*),services_provided!inner(*)")
          .eq('services_provided.provider_auth_id', currentAuthId);

      return result;
    } catch (error) {
      throw FormatException("$error");
    }
  }

  static Future loadProviderBookingCurrentWeek() async {
    String currentAuthId = AuthLayer.box.get('authId');
    print("loadProviderBooking");
    final now = DateTime.now();
    final sevenDaysAgo = now.subtract(Duration(days: 7));
    try {
      final result = await supabase?.client
          .from("service_requests")
          .select("*,service_locations(*),services_provided!inner(*)")
          // .select("*,service_locations(*),services_provided(*)")
          .eq('services_provided.provider_auth_id', currentAuthId)
          .gte('date', sevenDaysAgo.toIso8601String())
          .lte('date', now.toIso8601String());
      print(currentAuthId);
      return result;
    } catch (error) {
      throw FormatException("$error");
    }
  }

  static Future loadProviderBookingCurrentYear() async {
    String currentAuthId = AuthLayer.box.get('authId');
    print("loadProviderBookingCurrentYear");
    final now = DateTime.now();

    // Calculate the start of the current year (January 1st, 00:00:00)
    final startOfYear = DateTime(now.year, 1, 1);

    // Calculate the end of the current year (December 31st, 23:59:59)
    // To ensure all bookings on Dec 31st are included, we go to the start of Jan 1st of next year
    // and then subtract a millisecond.
    final endOfYear = DateTime(
      now.year + 1,
      1,
      1,
    ).subtract(Duration(milliseconds: 1));

    try {
      final result = await Supabase.instance.client
          .from("service_requests")
          .select("*,service_locations(*),services_provided!inner(*)")
          // .select("*,service_locations(*),services_provided(*)")
          .eq('services_provided.provider_auth_id', currentAuthId)
          .gte('date', startOfYear.toIso8601String())
          .lte('date', endOfYear.toIso8601String());
      print("Current year bookings for $currentAuthId: ${result?.length ?? 0}");
      return result;
    } catch (error) {
      throw FormatException("$error");
    }
  }

  static Future loadImageFromTableServiceImageHasSameProvideServiceId({
    required int provideServiceId,
  }) async {
    // String currentAuthId = AuthLayer.box.get('authId');
    try {
      final result = await supabase?.client
          // services_provided(*)
          .from("servic_image")
          .select("image_url")
          .eq('servic_provided_id', provideServiceId);
      print(result);
      return result;
    } catch (error) {
      throw FormatException("$error");
    }
  }

  static Future<bool> hasUserRatedService({
    required int serviceProvidedId,
  }) async {
    String currentAuthId = AuthLayer.box.get('authId');

    try {
      final result = await supabase?.client
          .from("service_ratings")
          .select("id")
          .eq("user_auth_id", currentAuthId)
          .eq("service_provided_id", serviceProvidedId)
          .maybeSingle();

      return result != null;
    } catch (error) {
      throw Exception("Error checking rating: $error");
    }
  }

  static Future<void> rateService({
    required int serviceProvidedId,
    required int bookingId,

    required double rating,
    required String note,
  }) async {
    String currentAuthId = AuthLayer.box.get('authId');

    try {
      await supabase!.client.from("service_ratings").insert({
        "service_provided_id": serviceProvidedId,
        "user_auth_id": currentAuthId,
        "content": note,
        "rating": rating,
        "booking_id": bookingId,
        "date": DateTime.now().toIso8601String(),
      });
    } catch (error) {
      throw Exception("Error while rating service: $error");
    }
  }

  // Future<List<ServiceRequest>> fetchProviderBookingsForCurrentWeek() async {
  //   print("fetchProviderBookingsForCurrentWeek");
  //   final user = client.auth.currentUser;
  //   if (user == null) throw Exception("User not authenticated");
  //   String? providerId = AuthLayer.box.get('providerId');
  //   if (providerId == null) {
  //     await getProviderIdFromAuthId(user.id);
  //     providerId = AuthLayer.box.get('providerId');
  //   }
  //   if (providerId == null) throw Exception("Provider not found");
  //   final now = DateTime.now();
  //   final sevenDaysAgo = now.subtract(Duration(days: 7));

  //   final response = await client
  //       .from('services_provided')
  //       .select('''
  //     id,
  //     title_en,
  //     servic_image (
  //       image_url
  //     ),
  //     service_requests (
  //       id,
  //       date,
  //       status
  //     )
  //   ''')
  //       .eq('provider_id', providerId)
  //       .gte('service_requests.date', sevenDaysAgo.toIso8601String())
  //       .lte('service_requests.date', now.toIso8601String());

  // final results = response as List;

  // List<ServiceRequest> bookings = [];

  // for (final item in results) {
  //   final serviceTitle = item['title_en'] ?? '';
  //   final imageList = item['servic_image'] as List?;
  //   final imageUrl = (imageList != null && imageList.isNotEmpty)
  //       ? imageList.first['image_url'] as String
  //       : '';

  //   final requests = item['service_requests'] as List?;
  //   if (requests == null) continue;

  //   for (final req in requests) {
  //     bookings.add(
  //       ServiceRequest(
  //         id: req['id'],
  //         date: DateTime.parse(req['date']),
  //         status: req['status'],
  //         serviceTitle: serviceTitle,
  //         imageUrl: imageUrl,
  //       ),
  //     );
  //   }
  // }

  //   return bookings;
  // }
}
