import 'package:final_project/style/app_spacing.dart';
import 'package:flutter/material.dart';

class DialogWithTwoOptions extends StatelessWidget {
  final String title;
  final String? message;
  final String cancelText;
  final String confirmText;
  final Color confirmButtonColor;
  final VoidCallback onConfirm;

  const DialogWithTwoOptions({
    super.key,
    required this.title,
    this.message,
    this.cancelText = "Cancel",
    this.confirmText = "Confirm",
    this.confirmButtonColor = Colors.red,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(24),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, color: Colors.amber, size: 80),
          AppSpacing.h16,
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          // if (message != null) ...[
          AppSpacing.h8,
          Text(
            message!,
            style: TextStyle(fontSize: 16, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          // ],
          AppSpacing.h24,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  cancelText,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: confirmButtonColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  onConfirm();
                },
                child: Text(
                  confirmText,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
