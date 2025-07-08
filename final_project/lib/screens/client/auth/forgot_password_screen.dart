import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/core/constant/app_validation.dart';
import 'package:final_project/screens/client/auth/bloc/auth_bloc.dart';
import 'package:final_project/screens/client/auth/otp_bottom_sheet.dart';
import 'package:final_project/screens/client/auth/reset_password_screen.dart';
import 'package:final_project/style/app_buttons.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/widgets/custom_text_form_field.dart';
import 'package:final_project/widgets/localized_aligned_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<AuthBloc>();
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is OTPSentState) {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => BlocProvider.value(
                              value: bloc,
                              child: OtpBottomSheet(
                                isSignUp: false,
                                onCompleted: (code) {
                                  bloc.add(
                                    VerifyResetPasswordOTPEvent(
                                      email: bloc.emailController.text,
                                      otp: code,
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        }
                        if (state is ResetPasswordOTPVerifiedState) {
                          Navigator.of(context).pop();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                value: bloc,
                                child: ResetPasswordScreen(),
                              ),
                            ),
                          );
                        }

                        if (state is ResetPasswordOTPFailureState) {
                          Flushbar(
                            messageText: Text(
                              state.error,
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

                        if (state is FailureState) {
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
                      builder: (context, state) {
                        return Column(
                          children: [
                            AppSpacing.h72,
                            AppSpacing.h24,
                            LocalizedAlignedText(
                              text: "auth.forget_password".tr(),
                              style: AppTextStyles.interSize26(context)
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                            ),
                            AppSpacing.h4,
                            LocalizedAlignedText(
                              text: "auth.reset_password_instruction".tr(),
                              style: AppTextStyles.interSize14(context)
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                            ),
                            AppSpacing.h16,

                            Form(
                              key: bloc.forgotPasswordFormKey,
                              child: CustomTextFormField(
                                labelText: "auth.email".tr(),
                                icon: Icon(CupertinoIcons.mail),
                                controller: bloc.emailController,
                                validator: AppValidation.requiredField,
                              ),
                            ),

                            AppSpacing.h48,
                            ElevatedButton(
                              style: AppButtons.large,
                              onPressed: () {
                                if (bloc.forgotPasswordFormKey.currentState!
                                    .validate()) {
                                  bloc.add(SendResetPasswordOTPEvent());
                                }
                              },
                              child: Text("auth.send_reset_link".tr()),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
