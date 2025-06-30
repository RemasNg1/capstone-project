import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageUploader extends StatelessWidget {
  final void Function(List<XFile>) onImagesPicked;

  const CustomImageUploader({super.key, required this.onImagesPicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final ImagePicker picker = ImagePicker();
        final List<XFile> images = await picker.pickMultiImage(
          imageQuality: 80,
        );
        if (images.isNotEmpty) {
          onImagesPicked(images);
        }
      },
      child: Container(
        width: 340,
        height: 85,
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
    );
  }
}
