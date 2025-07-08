// import 'package:final_project/core/enum/types.dart';
// import 'package:final_project/data_layer/auth_layer.dart';
// import 'package:final_project/repo/supabase.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class Booking {
//   static Supabase? supabase = SupabaseConnect.supabase;

//   static Future loadCustomerBooking() async {
//     String currentAuthId = AuthLayer.box.get('authId');
//     print("loadCustomerBooking +++++++______$currentAuthId");
//     try {
//       final result = await supabase?.client
//       // services_provided(*)
//           .from("service_requests")
//           .select("*,service_locations(*),services_provided(*)")
//           .eq('user_auth_id', currentAuthId);
//       return result;
//     } catch (error) {
//       throw FormatException("$error");
//     }
//   }
//     static Future loadProviderBooking() async {
//     String currentAuthId = AuthLayer.box.get('authId');
//     try {
//       final result = await supabase?.client
//       // services_provided(*)
//           .from("service_requests")
//           .select("*,service_locations(*),services_provided(*)")
//           .eq('service_provided_id', currentAuthId);
//       return result;
//     } catch (error) {
//       throw FormatException("$error");
//     }
//   }
//   static Future loadImageFromTableServiceImageHasSameProvideServiceId({required int provideServiceId}) async {
//     String currentAuthId = AuthLayer.box.get('authId');
//     try {
//       final result = await supabase?.client
//       // services_provided(*)
//           .from("servic_image")
//           .select("image_url")
//           .eq('servic_provided_id', provideServiceId);
//           print(result);
//       return result;

//     } catch (error) {
//       throw FormatException("$error");
//     }
//   }
// }

// // [
// //   {id: 2, date: 2025-07-03, service_provided_id: 3, service_location_id: 5, status: send, user_auth_id: 423e5f9a-e7a0-4228-9959-71f429875f64, service_locations: {id: 5, city_id: 3, latitude: 24.713, longitude: 46.6753, region_id: 1, service_provided_id: 3}}
// // ]
