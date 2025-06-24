import 'package:flutter/material.dart';

// Extension on BuildContext to easily get screen height and width multiplied by a factor for responsive UI sizing.

extension ScreenSize on BuildContext {
  getHeight({double factor = 1}) {
    return MediaQuery.sizeOf(this).height * factor;
  }

  getWidth({double factor = 1}) {
    return MediaQuery.sizeOf(this).width * factor;
  }
}
