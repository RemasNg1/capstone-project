import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServiceProviderCard extends StatelessWidget {
  final String image;
  final String name;
  final String category;
  final String price;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  const ServiceProviderCard({
    super.key,
    required this.image,
    required this.name,
    required this.category,
    required this.onDelete,
    required this.onEdit,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              image,
              width: 100,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 60,
                height: 60,
                color: AppColors.lightGray,
                child: const Icon(Icons.broken_image, color: Colors.white),
              ),
            ),
          ),

          AppSpacing.w16,
          //text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                AppSpacing.h4,
                Text(
                  category,
                  style: TextStyle(fontSize: 12, color: AppColors.mediumGray),
                ),
                AppSpacing.h4,
                Text(
                  '$price SR',
                  style: TextStyle(fontSize: 12, color: AppColors.mediumGray),
                ),
              ],
            ),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: onDelete,
                child: SvgPicture.asset(
                  'assets/icons/cancel_outlined.svg',
                  width: 24,
                  height: 24,
                  color: AppColors.redAccent,
                ),
              ),

              AppSpacing.h8,
              GestureDetector(
                onTap: onEdit,
                child: SvgPicture.asset(
                  'assets/icons/edit.svg',
                  width: 24,
                  height: 24,
                  color: AppColors.lightGray,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
