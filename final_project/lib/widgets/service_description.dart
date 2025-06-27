import 'package:final_project/style/app_colors.dart';
import 'package:flutter/material.dart';

class ServiceDescriptionSection extends StatelessWidget {
  final String title;
  final String description;

  const ServiceDescriptionSection({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.blue,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(color: AppColors.gray, fontSize: 12),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
