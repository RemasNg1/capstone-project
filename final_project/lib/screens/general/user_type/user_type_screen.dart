import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/screens/client/auth/client_login_screen.dart';
import 'package:final_project/screens/service_provider/auth/provider_login_screen.dart';
import 'package:final_project/style/app_buttons.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:flutter/material.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/entry.png'),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  AppSpacing.h48,
                  Text(
                    'userType.welcome'.tr(),
                    style: AppTextStyles.interSize20(context),
                  ),
                  AppSpacing.h8,
                  Text(
                    'userType.question'.tr(),
                    style: AppTextStyles.interSize18(context),
                  ),
                  AppSpacing.h32,
                  ElevatedButton(
                    style: AppButtons.large,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClientLoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "userType.customer".tr(),
                      style: AppTextStyles.interSize16(context),
                    ),
                  ),
                  AppSpacing.h16,
                  ElevatedButton(
                    style: AppButtons.large,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProviderLoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "userType.provider".tr(),
                      style: AppTextStyles.interSize16(context),
                    ),
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
