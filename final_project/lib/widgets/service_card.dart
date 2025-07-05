// import 'package:final_project/style/app_colors.dart';
// import 'package:final_project/widgets/star_rating_widget.dart';
// import 'package:flutter/material.dart';

// class ServiceCard extends StatelessWidget {
//   final String title;
//   final String location;
//   final String imageUrl;
//   final double rating;
//   final VoidCallback onChatPressed;

//   const ServiceCard({
//     super.key,
//     required this.title,
//     required this.location,
//     required this.imageUrl,
//     required this.rating,
//     required this.onChatPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 343,
//       height: 224,
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(23),
//         image: DecorationImage(
//           image: NetworkImage(imageUrl),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Stack(
//         children: [
//           // Overlay Gradient
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(23),
//               gradient: const LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [Colors.transparent, AppColors.dimGray],
//               ),
//             ),
//           ),

//           // Content
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Row(
//                   children: [
//                     const Icon(
//                       Icons.location_on,
//                       size: 18,
//                       color: AppColors.white,
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       location,
//                       style: const TextStyle(
//                         color: AppColors.white,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 8),

//                 Row(
//                   children: [
//                     StarRatingWidget(rating: 4.2),
//                     const SizedBox(width: 6),
//                     const Text(
//                       '4.2',
//                       style: TextStyle(color: AppColors.white, fontSize: 14),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           Positioned(
//             top: 12,
//             right: 12,
//             child: InkWell(
//               onTap: onChatPressed,
//               borderRadius: BorderRadius.circular(25),
//               child: Container(
//                 padding: const EdgeInsets.all(6),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.black26,
//                 ),
//                 child: const Icon(
//                   Icons.chat_bubble_outline,
//                   color: AppColors.lightGray,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/widgets/star_rating_widget.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String location;
  final String imagePath;
  final double rating;
  final int reviewCount;
  final double width;
  final double height;
  final VoidCallback? onTap;
  final VoidCallback? onIconPressed;
  final IconData icon;
  final bool showReviewCount;

  const ServiceCard({
    super.key,
    required this.title,
    required this.location,
    required this.imagePath,
    required this.rating,
    required this.reviewCount,
    required this.width,
    required this.height,
    this.onTap,
    this.onIconPressed,
    this.icon = Icons.favorite_border,
    this.showReviewCount = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          image: DecorationImage(
            image: imagePath.startsWith('http')
                ? NetworkImage(imagePath)
                : AssetImage(imagePath) as ImageProvider,

            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, AppColors.dimGray],
                ),
              ),
            ),

            // Text Content
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.interSize16(context).copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSpacing.h8,
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.white,
                      ),
                      AppSpacing.w4,
                      Expanded(
                        child: Text(
                          location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.interSize14(
                            context,
                          ).copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.h8,
                  Row(
                    children: [
                      StarRatingWidget(rating: rating),
                      AppSpacing.w8,
                      Text(
                        showReviewCount
                            ? '($reviewCount ${'home.ratings'.tr()})'
                            : rating.toStringAsFixed(1),
                        style: AppTextStyles.interSize14(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Top-right icon
            Positioned(
              top: 12,
              right: 12,
              child: InkWell(
                onTap: onIconPressed,
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white24,
                  ),
                  child: Icon(icon, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
