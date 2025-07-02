import 'package:final_project/core/enum/types.dart';
import 'package:final_project/models/chat/model_message.dart';
import 'package:final_project/repo/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Chat {
  static Supabase? supabase = SupabaseConnect.supabase;
  // in this function we load chat between user and provider has the same authid
  static Future loadChats({required EnumUserType userType}) async {
    String owner = "user_auth_id";
    String info = "providers(name_ar,name_en,avatar)";
    if (userType == EnumUserType.provider) {
      owner = "provider_auth_id";
      info = "user(name,avatar)";
    }
    try {
      final authId = Supabase.instance.client.auth.currentUser!.id;
      final result = await supabase?.client
          .from("message")
          .select("*,$info")
          .eq(owner, authId);
      return result;
    } catch (error) {
      throw FormatException("wrong");
    }
  }

  static Future sendChat({
    required EnumUserType userType,
    required ModelMessage message,
  }) async {
    try {
      
      // print (message.toJson());
      
      final result = await supabase?.client.from("message").insert(message.toJson());

      return result;
    } catch (error) {
      throw FormatException("$error");
    }
  }
}
