import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeProvider() {
    final box = Hive.box('settings');
    final isDark = box.get('isDark', defaultValue: false);
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  ThemeMode get themeMode => _themeMode;
  bool get isDark => _themeMode == ThemeMode.dark;

  void toggleTheme() {
    final box = Hive.box('settings');
    _themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    box.put('isDark', isDark);
    notifyListeners();
  }
}
