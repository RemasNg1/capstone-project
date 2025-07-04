import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/repo/supabase.dart';
import 'package:final_project/screens/client/checkout/checkout_screen.dart';
import 'package:final_project/screens/client/service_details/service_details_screen.dart';
import 'package:final_project/screens/general/splash/splash_screen.dart';
import 'package:final_project/style/app_theme.dart';
import 'package:final_project/utils/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

//remasnugaithan+36@gmail.com
//main
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await SupabaseConnect.init();
  await EasyLocalization.ensureInitialized();
  print(dotenv.env['SUPABASE_URL']);
  print(dotenv.env['SUPABASE_KEY']);

  setup();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'AR')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme(context),
      home: SplashScreen(),
    );
  }
}
// test