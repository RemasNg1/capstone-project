import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onToggle;

  final String? activeText;
  final String? inactiveText;
  final Widget? activeIcon;
  final Widget? inactiveIcon;

  final double width;
  final double height;
  final double toggleSize;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onToggle,
    this.activeText,
    this.inactiveText,
    this.activeIcon,
    this.inactiveIcon,
    this.width = 90,
    this.height = 28,
    this.toggleSize = 25,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FlutterSwitch(
        width: 68,
        toggleSize: toggleSize,
        value: value,
        borderRadius: 25,
        duration: Duration(milliseconds: 300),
        showOnOff: activeText != null && inactiveText != null,
        activeText: activeText,
        inactiveText: inactiveText,
        // activeTextFontWeight: FontWeight.w600,
        // inactiveTextFontWeight: FontWeight.w600,
        activeIcon: activeIcon,
        inactiveIcon: inactiveIcon,
        activeColor: Theme.of(context).colorScheme.primary,
        inactiveColor: Theme.of(context).colorScheme.onSurface,
        onToggle: onToggle,
      ),
    );
  }
}
