import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/style/app_buttons.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:flutter/material.dart';

class BookingBottomBar extends StatelessWidget {
  final String? price;
  final String buttonText;
  // final double buttonWidth;
  final VoidCallback? onPressed;
  final bool showPrice;
  final ButtonStyle? buttonStyle;

  const BookingBottomBar({
    super.key,
    this.price,
    required this.buttonText,
    // required this.buttonWidth,
    this.onPressed,
    this.buttonStyle,
    this.showPrice = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,

        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Row(
        mainAxisAlignment: showPrice && price != null
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          if (showPrice && price != null)
            Expanded(
              child: Text(
                '${'bookingReview.total'.tr()} $price ${'bookingReview.sr'.tr()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ElevatedButton(
            onPressed: onPressed ?? () {},
            style: buttonStyle ?? AppButtons.small,
            child: Text(buttonText, style: AppTextStyles.interSize16(context)),
          ),
        ],
      ),
    );
  }
}
