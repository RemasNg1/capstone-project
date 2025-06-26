import 'package:final_project/style/app_colors.dart';
import 'package:flutter/material.dart';

class PaymentSummaryCard extends StatelessWidget {
  final int venuePrice;
  final int buffetPrice;
  final int plannerPrice;
  final int tax;
  final int total;

  const PaymentSummaryCard({
    super.key,
    required this.venuePrice,
    required this.buffetPrice,
    required this.plannerPrice,
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Summary Detail',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.blue,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            _rowItem('Venue', '$venuePrice SR', labelStyle),
            _rowItem('Buffet for 350 guest', '$buffetPrice SR', labelStyle),
            _rowItem('Wedding planner', '$plannerPrice SR', labelStyle),
            _rowItem('Tax', '$tax SR', labelStyle),
            const Divider(),
            _rowItem('Total', '$total SR', boldStyle),
          ],
        ),
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
