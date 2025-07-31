// // import 'package:flutter/material.dart';
// // import 'package:final_project/style/app_theme.dart';

// // class ThemeProvider with ChangeNotifier {
// //   ThemeData themeDate = AppTheme.lightTheme();
// // }
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// class ThemeProvider extends ChangeNotifier {
//   static const String _boxName = 'themeBox';
//   static const String _key = 'isDark';

//   late bool _isDark;
//   bool get isDark => _isDark;

//   ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;

//   ThemeProvider() {
//     _loadTheme();
//   }

//   Future<void> _loadTheme() async {
//     final box = await Hive.openBox(_boxName);
//     _isDark = box.get(_key, defaultValue: false);
//     notifyListeners();
//   }

//   Future<void> toggleTheme() async {
//     _isDark = !_isDark;
//     final box = await Hive.openBox(_boxName);
//     await box.put(_key, _isDark);
//     notifyListeners();
//   }
// }

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
