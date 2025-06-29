import 'package:final_project/models/model.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:flutter/material.dart';

class PaymentMethodList extends StatelessWidget {
  final List<PaymentMethod> methods;

  const PaymentMethodList({super.key, required this.methods});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Payment Method',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.blue,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        ...methods.map((method) => _buildMethodTile(method)).toList(),
      ],
    );
  }

  Widget _buildMethodTile(PaymentMethod method) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: method.isSelected
                ? AppColors.lightBlue
                : AppColors.lightGray,
            width: method.isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset(method.iconPath, width: 28, height: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Text(method.name, style: const TextStyle(fontSize: 15)),
            ),
            if (method.isSelected)
              const Icon(Icons.check_circle, color: AppColors.lightBlue),
          ],
        ),
      ),
    );
  }
}
