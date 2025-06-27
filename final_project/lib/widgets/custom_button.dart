import 'package:final_project/style/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double width;
  final double height;
  final Color? buttonColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.width,
    required this.height,
    this.buttonColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonColor ?? AppColors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: textColor ?? AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
