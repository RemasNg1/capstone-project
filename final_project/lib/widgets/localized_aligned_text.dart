import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LocalizedAlignedText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const LocalizedAlignedText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';

    return Align(
      alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
      child: Text(
        text,
        style: style,
        textAlign: (isArabic ? TextAlign.right : TextAlign.left),
      ),
    );
  }
}
