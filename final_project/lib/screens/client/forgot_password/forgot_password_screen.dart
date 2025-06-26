import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/screens/client/forgot_password/reset_password_screen.dart';
import 'package:final_project/style/app_buttons.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/widgets/custom_text_form_field.dart';
import 'package:final_project/widgets/localized_aligned_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                AppSpacing.h72,
                AppSpacing.h24,
                LocalizedAlignedText(
                  text: "auth.forget_password".tr(),
                  style: AppTextStyles.interSize26(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                AppSpacing.h4,
                LocalizedAlignedText(
                  text: "auth.reset_password_instruction".tr(),
                  style: AppTextStyles.interSize14(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                AppSpacing.h16,

                CustomTextFormField(
                  labelText: "auth.email".tr(),
                  icon: Icon(CupertinoIcons.mail),
                ),

                AppSpacing.h48,
                ElevatedButton(
                  style: AppButtons.large,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetPasswordScreen(),
                      ),
                    );
                  },
                  child: Text("auth.send_reset_link".tr()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
