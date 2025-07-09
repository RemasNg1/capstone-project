import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:flutter/material.dart';

class PaymentSummaryCard extends StatelessWidget {
  final double servicePrice;
  final String serviceTitle;

  final double tax;
  final double total;

  const PaymentSummaryCard({
    super.key,
    required this.servicePrice,
    required this.serviceTitle,

    required this.tax,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle labelStyle = const TextStyle(
      color: AppColors.gray,
      fontSize: 14,
    );
    final TextStyle boldStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'bookingReview.summary'.tr(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.blue,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          _rowItem(serviceTitle, '$servicePrice SR', labelStyle),
          _rowItem(
            'bookingReview.tax'.tr(),
            '${tax.toStringAsFixed(2)} SR',
            labelStyle,
          ),
          const Divider(),
          _rowItem(
            'bookingReview.total'.tr(),
            '${total.toStringAsFixed(2)} SR',
            boldStyle,
          ),
        ],
      ),
    );
  }

  Widget _rowItem(String label, String value, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(value, style: style),
        ],
      ),
    );
  }
}
