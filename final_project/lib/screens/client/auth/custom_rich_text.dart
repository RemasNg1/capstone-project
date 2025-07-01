import 'package:final_project/style/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String normalText;
  final String linkText;
  final VoidCallback? onLinkTap;

  const CustomRichText({
    super.key,
    required this.normalText,
    required this.linkText,
    required this.onLinkTap,
  });
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "$normalText ",
        style: AppTextStyles.interSize14(
          context,
        ).copyWith(color: Theme.of(context).colorScheme.onSurface),
        children: [
          TextSpan(
            text: linkText,
            style: AppTextStyles.interSize14(context).copyWith(
              color: onLinkTap == null
                  ? Colors.grey
                  : Theme.of(context).colorScheme.primary,
            ),
            recognizer: TapGestureRecognizer()..onTap = onLinkTap,
          ),
        ],
      ),
    );
  }
}
