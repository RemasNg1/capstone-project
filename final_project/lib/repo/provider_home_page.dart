import 'package:final_project/data_layer/auth_layer.dart';
import 'package:final_project/repo/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProviderHomePage {
  static Supabase? supabase = SupabaseConnect.supabase;
  static Future loadAProviderStatistics() async {
    String currentAuthId = AuthLayer.box.get('authId');
    await getProviderId();
    String? providerId = AuthLayer.box.get('providerId');
    try {
      final result = await supabase?.client
          .from("service_requests")
          .select("*,services_provided(*)")
          .eq('services_provided.provider_id', providerId!);

      print(result);
      return result;
    } catch (error) {
      throw FormatException("$error");
    }
  }

  // this function to  sign provider id to local storage
  static getProviderId() async {
    String currentAuthId = AuthLayer.box.get('authId');
    String? providerId = AuthLayer.box.get('providerId');
    if (providerId == null) {
      try {
        final result = await supabase?.client
            .from("providers")
            .select("id")
            .eq('auth_id', currentAuthId);

        if (result != null && result.isNotEmpty) {
          // print(providerId.isEmpty);
          AuthLayer.box.put('providerId', "${result[0]['id']}");
        }
        return;
      } catch (error) {
        throw FormatException("$error");
      }
    }
    return;
  }
}
