import 'package:final_project/models/model.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/widgets/star_rating_widget.dart';
import 'package:flutter/material.dart';

class HorizontalServiceCard extends StatelessWidget {
  final MyService service;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  const HorizontalServiceCard({
    super.key,
    required this.service,
    this.onTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGray.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                service.imageUrl,
                height: 80,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            AppSpacing.w8,
            //info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.name,
                    style: AppTextStyles.interSize16(context).copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  AppSpacing.h4,
                  Text(
                    service.category,
                    style: AppTextStyles.interSize14(
                      context,
                    ).copyWith(color: AppColors.mediumGray),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: AppColors.mediumGray,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        service.location,
                        style: AppTextStyles.interSize12(
                          context,
                        ).copyWith(color: AppColors.mediumGray),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      StarRatingWidget(rating: service.rating),
                      const SizedBox(width: 6),
                      Text(
                        '(${service.reviewCount} ratings)',
                        style: AppTextStyles.interSize12(
                          context,
                        ).copyWith(color: AppColors.lightGray),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Icons (Heart + Arrow)
            Column(
              children: [
                InkWell(
                  onTap: onFavoriteTap,
                  child: const Icon(
                    Icons.favorite_border,
                    color: AppColors.mediumGray,
                  ),
                ),
                const SizedBox(height: 12),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.mediumGray,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
