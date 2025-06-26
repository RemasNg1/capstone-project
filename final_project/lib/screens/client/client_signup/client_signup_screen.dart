import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/screens/client/client_bottom_navbar/client_bottom_navbar_screen.dart';
import 'package:final_project/screens/client/client_login/client_login_screen.dart';
import 'package:final_project/style/app_buttons.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/widgets/custom_text_form_field.dart';
import 'package:final_project/widgets/localized_aligned_text.dart';
import 'package:final_project/widgets/terms_of_use_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ClientSignupScreen extends StatelessWidget {
  const ClientSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                // Image.asset(
                //   'assets/images/logo_blue.png',
                //   height: context.getHeight(factor: 0.16),
                // ),
                // Text("App Logo", style: AppTextStyles.interSize28(context)),
                // AppSpacing.h72,
                // AppSpacing.h24,
                // AppSpacing.h16,
                AppSpacing.h72,
                AppSpacing.h24,
                LocalizedAlignedText(
                  text: "auth.signup".tr(),
                  style: AppTextStyles.interSize26(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                AppSpacing.h4,
                LocalizedAlignedText(
                  text: "auth.step_away".tr(),
                  style: AppTextStyles.interSize14(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                AppSpacing.h16,

                CustomTextFormField(
                  labelText: "auth.username".tr(),
                  icon: Icon(CupertinoIcons.person),
                ),
                AppSpacing.h16,
                CustomTextFormField(
                  labelText: "auth.email".tr(),
                  icon: Icon(CupertinoIcons.mail),
                ),
                AppSpacing.h16,
                CustomTextFormField(
                  labelText: "auth.phone".tr(),
                  icon: Icon(CupertinoIcons.phone),
                ),
                AppSpacing.h16,
                CustomTextFormField(
                  labelText: "auth.password".tr(),
                  obscureText: true,
                  icon: Icon(CupertinoIcons.lock),
                  suffixIcon: Icon(CupertinoIcons.eye_slash),
                ),
                AppSpacing.h16,

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {
                        value = true;
                      },
                    ),
                    Text.rich(
                      TextSpan(
                        text: "${'auth.agree'.tr()} ",

                        style: AppTextStyles.interSize14(context).copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        children: [
                          TextSpan(
                            text: 'auth.terms'.tr(),
                            style: AppTextStyles.interSize14(context),

                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(24),
                                    ),
                                  ),
                                  builder: (_) => const TermsOfUseSheet(),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
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
                  child: Text("auth.signup".tr()),
                ),
                AppSpacing.h16,
                Text.rich(
                  TextSpan(
                    text: "${'auth.have_account'.tr()} ",
                    style: AppTextStyles.interSize14(
                      context,
                    ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                    children: [
                      TextSpan(
                        text: 'auth.login'.tr(),
                        style: AppTextStyles.interSize14(context),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ClientLoginScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClientBottomNavbarScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "auth.guest".tr(),
                    style: AppTextStyles.interSize14(
                      context,
                    ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
                // AppSpacing.h8,
                // Text("auth.guest".tr()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
