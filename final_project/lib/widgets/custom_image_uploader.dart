import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageUploader extends StatelessWidget {
  final void Function(List<XFile>) onImagesPicked;
  final List<XFile> currentImages;

  const CustomImageUploader({
    super.key,
    required this.onImagesPicked,
    required this.currentImages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  عرض الصور المصغرة بعد اختيارها
        if (currentImages.isNotEmpty)
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: currentImages.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final file = File(currentImages[index].path);
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    file,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        AppSpacing.h16,
        // زر رفع الصور
        GestureDetector(
          onTap: () async {
            final picker = ImagePicker();
            final List<XFile> images = await picker.pickMultiImage(
              imageQuality: 80,
            );
            if (images.isNotEmpty) {
              onImagesPicked(images);
            }
          },
          child: Container(
            width: context.getWidth(factor: 0.9),
            height: 90,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.lightBlue, width: 1.2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/attach_file.svg',
                  width: 16,
                  height: 16,
                  color: AppColors.blue,
                ),
                AppSpacing.h16,
                Text(
                  'services.attach'.tr(),
                  style: const TextStyle(
                    color: AppColors.blue,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),

        AppSpacing.h16,
      ],
    );
  }
}
