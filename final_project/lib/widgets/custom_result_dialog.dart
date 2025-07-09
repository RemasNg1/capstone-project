import 'package:final_project/style/app_buttons.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomResultDialog {
  static void show(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String message,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 72, color: iconColor),
              AppSpacing.h24,
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              AppSpacing.h8,
              Text(
                message,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.lightGray,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onPressed,
                style: AppButtons.medium,
                child: Text(
                  buttonText,
                  style: AppTextStyles.interSize16(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
