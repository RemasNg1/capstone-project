import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';

class ContentOfOnboarding extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  const ContentOfOnboarding({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.asset(
              imagePath,
              height: context.getHeight(),
              width: context.getWidth(),
              fit: BoxFit.fill,
            ),
            Container(
              height: context.getHeight(),
              width: context.getWidth(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xD9D9D9D9).withOpacity(0.0),
                    const Color(0xFF0C0507).withOpacity(0.85),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: context.getHeight(factor: 0.3),
              left: 20,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.tr(),
                      style: AppTextStyles.interSize48(
                        context,
                      ).copyWith(color: Theme.of(context).colorScheme.surface),
                    ),
                    AppSpacing.h16,
                    Text(
                      description.tr(),
                      style: AppTextStyles.interSize18(
                        context,
                      ).copyWith(color: Theme.of(context).colorScheme.surface),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
