import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/core/helper/functions.dart';
import 'package:final_project/models/services_models/services_provided/services_provided_model.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/utils/extensions/localization_helper.dart';
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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          // color: AppColors.white,
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              // color: AppColors.lightGray.withOpacity(0.3),
              color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
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
                service.servicImage?.first.imageUrl ?? '',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.isArabic
                            ? service.titleAr ?? ''
                            : service.titleEn ?? '',
                        style: AppTextStyles.interSize16(context).copyWith(),
                      ),

                      InkWell(
                        onTap: onFavoriteTap,
                        child: Icon(
                          service.isFavorite!
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: service.isFavorite!
                              ? Colors.red
                              : AppColors.mediumGray,
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.h4,
                  Text(
                    context.isArabic
                        ? service.services!.nameAr ?? ''
                        : service.services!.nameEn ?? '',

                    style: AppTextStyles.interSize14(
                      context,
                    ).copyWith(color: AppColors.mediumGray),
                  ),
                  AppSpacing.h4,
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: AppColors.mediumGray,
                      ),
                      Text(
                        context.isArabic
                            ? service.locations?.first.city?.nameAr ?? ''
                            : service.locations?.first.city?.nameEn ?? '',

                        style: AppTextStyles.interSize12(
                          context,
                        ).copyWith(color: AppColors.mediumGray),
                      ),
                    ],
                  ),
                  AppSpacing.h8,
                  Row(
                    children: [
                      StarRatingWidget(
                        rating: calculateAverageRating(service.ratings!),
                      ),
                      AppSpacing.w4,

                      Text(
                        '(${service.ratings?.length} ${'home.ratings'.tr()})',
                        style: AppTextStyles.interSize12(
                          context,
                        ).copyWith(color: AppColors.lightGray),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
