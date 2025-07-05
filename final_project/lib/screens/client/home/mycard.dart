import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/models/services_models/services_provided/services_provided_model.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/widgets/star_rating_widget.dart';
import 'package:flutter/material.dart';

class Mycard extends StatelessWidget {
  final ServicesProvidedModel service;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  const Mycard({
    super.key,
    required this.service,
    this.onTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        (service.servicImage != null && service.servicImage!.isNotEmpty)
        ? service.servicImage![0].imageUrl!
        : 'https://assets.hyatt.com/content/dam/hyatt/hyattdam/images/2019/12/09/1201/Hyatt-Regency-London-The-Churchill-P948-Wedding-Dancefloor-View.jpg/Hyatt-Regency-London-The-Churchill-P948-Wedding-Dancefloor-View.4x3.jpg?imwidth=1920';

    final title = service.titleAr ?? 'EMPTY';

    final serviceName = service.services?.nameAr ?? 'EMPTY';

    final locationText =
        (service.locations != null && service.locations!.isNotEmpty)
        ? '${service.locations!.first.city?.nameAr ?? 'EMPTY'}'
        : 'EMPTY';

    final ratings = service.ratings ?? [];
    final double averageRating = ratings.isNotEmpty
        ? ratings.map((e) => e?.rating ?? 0.0).reduce((a, b) => a + b) /
              ratings.length
        : 0.0;

    final ratingsCount = service.ratings?.length ?? 0;

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
                imageUrl,
                height: 80,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            AppSpacing.w8,
            // info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.interSize16(context).copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  AppSpacing.h4,
                  Text(
                    serviceName,
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
                      Text(
                        '  $locationText',
                        style: AppTextStyles.interSize12(
                          context,
                        ).copyWith(color: AppColors.mediumGray),
                      ),
                    ],
                  ),
                  AppSpacing.h8,
                  Row(
                    children: [
                      StarRatingWidget(rating: averageRating),
                      const SizedBox(width: 6),
                      Text(
                        '($ratingsCount ${'home.ratings'.tr()})',
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
