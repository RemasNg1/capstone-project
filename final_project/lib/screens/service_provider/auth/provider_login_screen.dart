import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/core/constant/app_validation.dart';
import 'package:final_project/screens/service_provider/auth/bloc/auth_bloc.dart';
import 'package:final_project/screens/service_provider/auth/custom_rich_text.dart';
import 'package:final_project/screens/service_provider/auth/otp_bottom_sheet.dart';
import 'package:final_project/screens/service_provider/auth/forgot_password_screen.dart';
import 'package:final_project/screens/service_provider/auth/provider_signup_screen.dart';
import 'package:final_project/screens/service_provider/provider_bottom_navbar/provider_bottom_navbar_screen.dart';
import 'package:final_project/style/app_buttons.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/widgets/custom_text_form_field.dart';
import 'package:final_project/widgets/localized_aligned_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProviderLoginScreen extends StatelessWidget {
  const ProviderLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),

      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is OTPSentState) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => BlocProvider.value(
                value: context.read<AuthBloc>(),
                child: OtpBottomSheet(
                  onCompleted: (code) {
                    context.read<AuthBloc>().add(VerifyOTPEvent(code));
                  },
                ),
              ),
            );
          }

          if (state is OTPVerifiedState) {
            Navigator.of(context).pop();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProviderBottomNavbarScreen(),
              ),
            );
          }

          if (state is OTPFailureState) {
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
          if (state is SuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProviderBottomNavbarScreen(),
              ),
            );
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
          return Builder(
            builder: (context) {
              final bloc = context.read<AuthBloc>();
              return Scaffold(
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
                              text: "auth.login".tr(),
                              style: AppTextStyles.interSize26(context)
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                            ),
                            AppSpacing.h4,
                            LocalizedAlignedText(
                              text: "auth.step_away_provider_login".tr(),
                              style: AppTextStyles.interSize14(context)
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                            ),
                            AppSpacing.h16,

                            Form(
                              key: bloc.loginFormKey,
                              child: Column(
                                children: [
                                  CustomTextFormField(
                                    labelText: "auth.email".tr(),
                                    icon: Icon(CupertinoIcons.mail),
                                    controller: bloc.emailController,
                                    validator: AppValidation.requiredField,

                                    //  (value) {
                                    //   if (value == null || value.isEmpty) {
                                    //     return "Please enter your email";
                                    //   }
                                    //   return null;
                                    // },
                                  ),
                                  AppSpacing.h16,

                                  CustomTextFormField(
                                    labelText: "auth.password".tr(),
                                    obscureText: bloc.isPasswordHidden,

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
                                    validator: AppValidation.requiredField,

                                    // validator: (value) {
                                    //   if (value == null || value.isEmpty) {
                                    //     return "Please enter your password";
                                    //   }
                                    //   return null;
                                    // },
                                  ),
                                ],
                              ),
                            ),
                            AppSpacing.h16,

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPasswordScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "auth.forget_password".tr(),
                                    style: AppTextStyles.interSize14(context)
                                        .copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onSurface,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            AppSpacing.h24,

                            ElevatedButton(
                              style: AppButtons.large,
                              onPressed: () {
                                if (bloc.loginFormKey.currentState!
                                    .validate()) {
                                  bloc.add(LogInEvent());
                                }
                              },
                              child: Text("auth.login".tr()),
                            ),
                            AppSpacing.h24,
                            CustomRichText(
                              normalText: 'auth.no_account'.tr(),
                              linkText: 'auth.signup_now'.tr(),
                              onLinkTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProviderSignupScreen(),
                                  ),
                                );
                              },
                            ),

                            // TextButton(
                            //   onPressed: () {
                            //     bloc.add(SignInAnonymouslyEvent());
                            //   },
                            //   child: Text(
                            //     "auth.guest".tr(),
                            //     style: AppTextStyles.interSize14(context)
                            //         .copyWith(
                            //           color: Theme.of(
                            //             context,
                            //           ).colorScheme.onSurface,
                            //         ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


    // Text.rich(
                            //   TextSpan(
                            //     text: "${'auth.no_account'.tr()} ",

                            //     style: AppTextStyles.interSize14(context)
                            //         .copyWith(
                            //           color: Theme.of(
                            //             context,
                            //           ).colorScheme.onSurface,
                            //         ),
                            //     children: [
                            //       TextSpan(
                            //         text: 'auth.signup_now'.tr(),
                            //         style: AppTextStyles.interSize14(context),

                            //         recognizer: TapGestureRecognizer()
                            //           ..onTap = () {
                            //             Navigator.push(
                            //               context,
                            //               MaterialPageRoute(
                            //                 builder: (context) =>
                            //                     ClientSignupScreen(),
                            //               ),
                            //             );
                            //           },
                            //       ),
                            //     ],
                            //   ),
                            // ),