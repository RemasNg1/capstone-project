import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/repo/supabase.dart';
import 'package:final_project/screens/general/splash/splash_screen.dart';
import 'package:final_project/style/app_theme.dart';
import 'package:final_project/utils/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await SupabaseConnect.init();
  await EasyLocalization.ensureInitialized();
  // init Hive
  await Hive.initFlutter();

  await Hive.openBox('userInfo');
  await dotenv.load(fileName: ".env");

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
