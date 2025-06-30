import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/screens/client/auth/bloc/auth_bloc.dart';
import 'package:final_project/screens/client/auth/client_login_screen.dart';
import 'package:final_project/style/app_buttons.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/widgets/custom_text_form_field.dart';
import 'package:final_project/widgets/localized_aligned_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ClientLoginScreen()),
          );
        } else if (state is FailureState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error!)));
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    AppSpacing.h72,
                    AppSpacing.h24,
                    LocalizedAlignedText(
                      text: "auth.reset_password_title".tr(),
                      style: AppTextStyles.interSize26(
                        context,
                      ).copyWith(color: Theme.of(context).colorScheme.primary),
                    ),
                    AppSpacing.h4,
                    LocalizedAlignedText(
                      text: "auth.reset_password_description".tr(),
                      style: AppTextStyles.interSize14(context).copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    AppSpacing.h16,
                    CustomTextFormField(
                      labelText: "auth.password".tr(),
                      obscureText: true,
                      icon: Icon(CupertinoIcons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          bloc.add(TogglePasswordVisibility());
                        },
                        icon: Icon(
                          bloc.isPasswordHidden
                              ? CupertinoIcons.eye_slash
                              : CupertinoIcons.eye,
                        ),
                      ),
                      controller: bloc.passwordController,
                    ),
                    AppSpacing.h48,
                    ElevatedButton(
                      style: AppButtons.large,
                      onPressed: () {
                        bloc.add(
                          ResetPasswordEvent(bloc.passwordController.text),
                        );
                      },
                      child: Text("auth.confirm_reset".tr()),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
