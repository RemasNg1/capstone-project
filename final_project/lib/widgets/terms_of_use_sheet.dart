import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';

class TermsOfUseSheet extends StatelessWidget {
  const TermsOfUseSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight(factor: 0.85),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              AppSpacing.h8,
              Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Text(
                'auth.terms'.tr(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              AppSpacing.h16,
              Expanded(
                child: ListView.builder(
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    final titleKey = 'terms.title_${index + 1}';
                    final bodyKey = 'terms.body_${index + 1}';
                    return TermsParagraph(
                      title: (titleKey).tr(),
                      body: (bodyKey).tr(),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            right: context.locale.languageCode == 'ar' ? null : 0,
            left: context.locale.languageCode == 'ar' ? 0 : null,
            top: 0,
            child: SafeArea(
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TermsParagraph extends StatelessWidget {
  final String title;
  final String body;

  const TermsParagraph({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          AppSpacing.h4,
          Text(body, style: TextStyle(fontSize: 14, height: 1.6)),
        ],
      ),
    );
  }
}
