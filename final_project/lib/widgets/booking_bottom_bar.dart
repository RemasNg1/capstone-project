import 'package:final_project/style/app_colors.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookingBottomBar extends StatelessWidget {
  final int? price;
  final String buttonText;
  final double buttonWidth;
  final VoidCallback? onPressed;
  final bool showPrice;

  const BookingBottomBar({
    super.key,
    this.price,
    required this.buttonText,
    required this.buttonWidth,
    this.onPressed,
    this.showPrice = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showPrice && price != null)
            Expanded(
              child: Text(
                'Total $price SR',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            )
          else
            const Spacer(),
          CustomButton(
            title: buttonText,
            width: buttonWidth,
            height: 48,
            onPressed: onPressed ?? () {},
          ),
        ],
      ),
    );
  }
}
