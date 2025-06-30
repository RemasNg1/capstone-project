import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/screens/client/auth/bloc/auth_bloc.dart';
import 'package:final_project/screens/client/auth/otp_bottom_sheet.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientSignupScreen extends StatelessWidget {
  const ClientSignupScreen({super.key});

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
                            builder: (_) => BlocProvider.value(
                              value: bloc,
                              child: OtpBottomSheet(
                                onCompleted: (code) {
                                  bloc.add(VerifyOTPEvent(code));
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
                              builder: (context) => ClientBottomNavbarScreen(),
                            ),
                          );
                        }

                        if (state is OTPFailureState) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(state.error)));
                        }
                        if (state is SuccessState) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClientBottomNavbarScreen(),
                            ),
                          );
                        }

                        if (state is FailureState) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(state.error!)));
                        }
                      },
                      builder: (context, state) {
                        return Column(
                          children: [
                            AppSpacing.h72,
                            AppSpacing.h24,
                            LocalizedAlignedText(
                              text: "auth.signup".tr(),
                              style: AppTextStyles.interSize26(context)
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                            ),
                            AppSpacing.h4,
                            LocalizedAlignedText(
                              text: "auth.step_away".tr(),
                              style: AppTextStyles.interSize14(context)
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                            ),
                            AppSpacing.h16,

                            Form(
                              key: bloc.formKey,
                              child: Column(
                                children: [
                                  CustomTextFormField(
                                    labelText: "auth.username".tr(),
                                    icon: Icon(CupertinoIcons.person),
                                    controller: bloc.usernameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your name';
                                      }
                                      if (value.length < 3) {
                                        return 'Username must be at least 3 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                  AppSpacing.h16,
                                  CustomTextFormField(
                                    labelText: "auth.email".tr(),
                                    icon: Icon(CupertinoIcons.mail),
                                    controller: bloc.emailController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      final emailRegex = RegExp(
                                        r'^[\w.+-]+@([\w-]+\.)+[\w-]{2,4}$',
                                      );
                                      if (!emailRegex.hasMatch(value)) {
                                        return 'Please enter a valid email address';
                                      }
                                      return null;
                                    },
                                  ),
                                  AppSpacing.h16,
                                  CustomTextFormField(
                                    labelText: "auth.phone".tr(),
                                    icon: Icon(CupertinoIcons.phone),
                                    controller: bloc.phoneController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your phone number';
                                      }
                                      final regex = RegExp(r'^05[0-9]{8}$');
                                      if (!regex.hasMatch(value)) {
                                        return 'Please enter a valid Saudi phone number';
                                      }
                                      return null;
                                    },
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Password is required';
                                      } else if (value.length < 6) {
                                        return 'Password must be at least 6 characters';
                                      } else if (!RegExp(
                                        r'[A-Z]',
                                      ).hasMatch(value)) {
                                        return 'Password must contain at least one uppercase letter';
                                      } else if (!RegExp(
                                        r'[!@#$%^&*(),.?_":{}|<>]',
                                      ).hasMatch(value)) {
                                        return 'Password must contain at least one special character';
                                      }
                                      return null;
                                    },
                                  ),
                                  AppSpacing.h16,
                                ],
                              ),
                            ),

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

                                    style: AppTextStyles.interSize14(context)
                                        .copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onSurface,
                                        ),
                                    children: [
                                      TextSpan(
                                        text: 'auth.terms'.tr(),
                                        style: AppTextStyles.interSize14(
                                          context,
                                        ),

                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                      top: Radius.circular(24),
                                                    ),
                                              ),
                                              builder: (_) =>
                                                  const TermsOfUseSheet(),
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
                                if (bloc.formKey.currentState!.validate()) {
                                  bloc.add(SignUpEvent());
                                }
                              },
                              child: Text("auth.signup".tr()),
                            ),
                            AppSpacing.h16,
                            Text.rich(
                              TextSpan(
                                text: "${'auth.have_account'.tr()} ",
                                style: AppTextStyles.interSize14(context)
                                    .copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                children: [
                                  TextSpan(
                                    text: 'auth.login'.tr(),
                                    style: AppTextStyles.interSize14(context),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ClientLoginScreen(),
                                          ),
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                bloc.add(SignInAnonymouslyEvent());
                              },
                              child: Text(
                                "auth.guest".tr(),
                                style: AppTextStyles.interSize14(context)
                                    .copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                              ),
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
