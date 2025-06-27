import 'package:final_project/style/app_colors.dart';
import 'package:final_project/widgets/star_rating_widget.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final double rating;
  final int ratingCount;
  final bool showFavorite;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.rating,
    required this.ratingCount,
    this.showFavorite = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    imageUrl,
                    width: 150,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + Favorite
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (showFavorite)
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                            border: Border.all(color: AppColors.lightGray),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.favorite_border,
                              size: 16,
                              color: AppColors.mediumGray,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 12,
                        color: AppColors.mediumGray,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        location,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.mediumGray,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      StarRatingWidget(rating: rating),
                      const SizedBox(width: 4),
                      Text(
                        '($ratingCount ratings)',
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.mediumGray,
                        ),
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
