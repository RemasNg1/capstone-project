import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/screens/client/client_bottom_navbar/client_bottom_navbar_screen.dart';
import 'package:final_project/screens/client/client_login/client_login_screen.dart';
import 'package:final_project/screens/service_provider/provider_bottom_navbar/provider_bottom_navbar_screen.dart';
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
                    style: AppTextStyles.interSize16(context),
                  ),
                  AppSpacing.h4,
                  Text(
                    'userType.question'.tr(),
                    style: AppTextStyles.interSize16(context),
                  ),
                  AppSpacing.h24,
                  ElevatedButton(
                    style: AppButtons.large,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClientBottomNavbarScreen(),
                        ),
                      );
                    },
                    child: Text("userType.customer".tr()),
                  ),
                  AppSpacing.h16,
                  ElevatedButton(
                    style: AppButtons.large,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProviderBottomNavbarScreen(),
                        ),
                      );
                    },
                    child: Text("userType.provider".tr()),
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
