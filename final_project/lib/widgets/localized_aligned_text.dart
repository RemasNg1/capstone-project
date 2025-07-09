import 'package:final_project/utils/extensions/localization_helper.dart';
import 'package:flutter/material.dart';

class LocalizedAlignedText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const LocalizedAlignedText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: context.isArabic
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Text(
        text,
        style: style,
        textAlign: (context.isArabic ? TextAlign.right : TextAlign.left),
      ),
    );
  }
}
