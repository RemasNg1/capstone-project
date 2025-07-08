import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/core/constant/app_validation.dart';
import 'package:final_project/screens/service_provider/auth/bloc/auth_bloc.dart';
import 'package:final_project/screens/service_provider/auth/provider_login_screen.dart';
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
            MaterialPageRoute(builder: (context) => ProviderLoginScreen()),
          );
        } else if (state is FailureState) {
          Flushbar(
            messageText: Text(
              state.error!,
              style: AppTextStyles.interSize16(
                context,
              ).copyWith(color: Colors.white),
            ),
            backgroundColor: Colors.red,
            icon: Icon(Icons.error, color: Colors.white),
            duration: Duration(seconds: 3),
            flushbarPosition: FlushbarPosition.BOTTOM,
            borderRadius: BorderRadius.circular(8),
            margin: EdgeInsets.all(16),
          ).show(context);
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
                    Form(
                      key: bloc.resetPasswordFormKey,
                      child: CustomTextFormField(
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
                        validator: AppValidation.validatePassword,
                      ),
                    ),
                    AppSpacing.h48,
                    ElevatedButton(
                      style: AppButtons.large,
                      onPressed: () {
                        if (bloc.resetPasswordFormKey.currentState!
                            .validate()) {
                          bloc.add(
                            ResetPasswordEvent(bloc.passwordController.text),
                          );
                        }
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
