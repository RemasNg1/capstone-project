import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    return ThemeData(
      fontFamily: isArabic
          //  Noto Sans Arabic
          ? GoogleFonts.tajawal().fontFamily
          : GoogleFonts.inter().fontFamily,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColors.blue, // Used for titles, selected icons, and stars
        secondary: AppColors.lightBlue, // Used for buttons background
        onSecondary: AppColors.black, // Used for text on buttons
        secondaryContainer: AppColors.offWhite, // Used for cards background
        surface: AppColors.white, // Used for general background of the app
        onSurface: AppColors.mediumGray, // Color for general text
        primaryContainer:
            AppColors.white, // Background of AppBar and BottomNavigationBar
        onPrimaryContainer:
            AppColors.black, // Text and unselected icons on AppBar/BottomNav
        outline: AppColors.lightGray, // Default border color
        outlineVariant:
            AppColors.mediumGray, // Alternative border/shadow/divider color
      ),

      scaffoldBackgroundColor: AppColors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightBlue,
          foregroundColor: AppColors.darkGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      textTheme: TextTheme(bodyMedium: TextStyle(color: AppColors.black)),
      appBarTheme: AppBarTheme(backgroundColor: AppColors.white),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    return ThemeData(
      fontFamily: isArabic
          ? GoogleFonts.tajawal().fontFamily
          : GoogleFonts.inter().fontFamily,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColors.blue,
        secondary: AppColors.darkBlue,
        onSecondary: AppColors.lightGray,
        secondaryContainer: AppColors.dimGray,
        surface: AppColors.black,
        onSurface: AppColors.lightGray,
        primaryContainer: AppColors.dimGray,
        onPrimaryContainer: AppColors.lightGray,
        outline: AppColors.lightGray,
        outlineVariant: AppColors.mediumGray,
      ),

      scaffoldBackgroundColor: AppColors.black,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkBlue,
          foregroundColor: AppColors.white,
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),

      appBarTheme: AppBarTheme(backgroundColor: AppColors.black),
    );
  }
}
