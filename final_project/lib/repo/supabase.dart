import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//remasnugaithan+18@gmail.com
class SupabaseConnect {
  static Supabase? supabase;
  static Future<void> init() async {
    try {
      log("*** connect supabase start ***");

      await dotenv.load(fileName: ".env");
      supabase = await Supabase.initialize(
        url: dotenv.env["url"].toString(),
        anonKey: dotenv.env["anon_key"].toString(),
      );

      log("*** connect supabase done ***");
    } catch (error) {
      throw FormatException("*** There is error with connect DB ***");
    }
  }

}
