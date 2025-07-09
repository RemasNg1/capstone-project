// widgets/category_chip.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_text_styles.dart';

class CategoryChip extends StatelessWidget {
  final String categoryName;
  final String category;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.categoryName,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: AppColors.lightGray),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                "assets/icons/$category.svg",
                width: 20,
                height: 20,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              categoryName,
              style: AppTextStyles.interSize14(
                context,
              ).copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
