import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/utils/extensions/localization_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoDialog extends StatelessWidget {
  final String title;
  final String content;

  final String? email;

  const InfoDialog({
    super.key,
    required this.title,
    this.email,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titlePadding: EdgeInsets.zero,
      title: SizedBox(
        height: 48,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 0,
              right: context.isArabic ? null : 0,
              left: context.isArabic ? 0 : null,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.grey),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            content,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
          AppSpacing.h8,
          (email != null && email!.isNotEmpty)
              ? Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    // color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            email!,
                            style: AppTextStyles.interSize14(
                              context,
                            ).copyWith(color: AppColors.mediumGray),
                            // TextStyle(
                            //   fontSize: 14,
                            //   color: Colors.black87,
                            // ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.copy,
                          size: 18,
                          color: Colors.grey[600],
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: email!));
                        },
                      ),
                    ],
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
