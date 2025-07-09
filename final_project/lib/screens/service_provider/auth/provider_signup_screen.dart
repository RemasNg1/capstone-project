import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/core/constant/app_validation.dart';
import 'package:final_project/screens/service_provider/auth/bloc/auth_bloc.dart';
import 'package:final_project/screens/service_provider/auth/custom_rich_text.dart';
import 'package:final_project/screens/service_provider/auth/otp_bottom_sheet.dart';
import 'package:final_project/screens/service_provider/auth/provider_login_screen.dart';
import 'package:final_project/screens/service_provider/provider_bottom_navbar/provider_bottom_navbar_screen.dart';
import 'package:final_project/style/app_buttons.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/widgets/custom_text_form_field.dart';
import 'package:final_project/widgets/localized_aligned_text.dart';
import 'package:final_project/widgets/legal_content_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProviderSignupScreen extends StatelessWidget {
  const ProviderSignupScreen({super.key});

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
                              builder: (context) =>
                                  ProviderBottomNavbarScreen(),
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
                              builder: (context) =>
                                  ProviderBottomNavbarScreen(),
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
                        return Column(
                          children: [
                            AppSpacing.h32,
                            // AppSpacing.h24,
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
                              text: "auth.step_away_provider_signup".tr(),
                              style: AppTextStyles.interSize14(context)
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                            ),
                            AppSpacing.h16,

                            Form(
                              key: bloc.signUpFormKey,
                              child: Column(
                                children: [
                                  CustomTextFormField(
                                    labelText: "auth.name_ar".tr(),
                                    icon: Icon(CupertinoIcons.person),
                                    controller: bloc.nameArController,
                                    validator: AppValidation.validateNameAr,
                                  ),
                                  AppSpacing.h16,
                                  CustomTextFormField(
                                    labelText: "auth.name_en".tr(),
                                    icon: Icon(CupertinoIcons.person),
                                    controller: bloc.nameEnController,
                                    validator: AppValidation.validateNameEn,
                                  ),
                                  AppSpacing.h16,

                                  CustomTextFormField(
                                    labelText:
                                        "auth.commercial_registration_number"
                                            .tr(),
                                    icon: Icon(CupertinoIcons.doc_text),
                                    controller: bloc.crNumber,
                                    validator: AppValidation.validateCrNumber,
                                  ),
                                  AppSpacing.h16,

                                  CustomTextFormField(
                                    labelText: "auth.iban".tr(),
                                    icon: Icon(CupertinoIcons.creditcard),
                                    controller: bloc.ibanController,
                                    keyboardType: TextInputType.number,
                                    validator: AppValidation.validateIban,
                                  ),
                                  AppSpacing.h16,
                                  CustomTextFormField(
                                    labelText: "auth.email".tr(),
                                    icon: Icon(CupertinoIcons.mail),
                                    controller: bloc.emailController,
                                    validator: AppValidation.validateEmail,
                                  ),
                                  AppSpacing.h16,
                                  CustomTextFormField(
                                    labelText: "auth.phone".tr(),
                                    icon: Icon(CupertinoIcons.phone),
                                    controller: bloc.phoneController,
                                    keyboardType: TextInputType.number,
                                    validator: AppValidation.validatePhone,
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
                                    validator: AppValidation.validatePassword,
                                  ),
                                  AppSpacing.h16,
                                  FormField<bool>(
                                    initialValue: bloc.isAgreedToTerms,
                                    validator:
                                        AppValidation.validateTermsAgreement,

                                    builder: (formFieldState) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Checkbox(
                                                value: formFieldState.value,
                                                onChanged: (value) {
                                                  bloc.add(
                                                    ToggleAgreeToTermsEvent(),
                                                  );
                                                  formFieldState.didChange(
                                                    value,
                                                  );
                                                },
                                              ),
                                              Expanded(
                                                child: Text.rich(
                                                  TextSpan(
                                                    text:
                                                        "${'auth.agree'.tr()} ",
                                                    style:
                                                        AppTextStyles.interSize14(
                                                          context,
                                                        ).copyWith(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onSurface,
                                                        ),
                                                    children: [
                                                      TextSpan(
                                                        text: 'auth.terms'.tr(),
                                                        style:
                                                            AppTextStyles.interSize14(
                                                              context,
                                                            ).copyWith(
                                                              color:
                                                                  Theme.of(
                                                                        context,
                                                                      )
                                                                      .colorScheme
                                                                      .primary,
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                            ),
                                                        recognizer: TapGestureRecognizer()
                                                          ..onTap = () {
                                                            showModalBottomSheet(
                                                              context: context,
                                                              isScrollControlled:
                                                                  true,
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.vertical(
                                                                      top:
                                                                          Radius.circular(
                                                                            25,
                                                                          ),
                                                                    ),
                                                              ),
                                                              builder: (context) =>
                                                                  LegalContentSheet(
                                                                    title:
                                                                        'auth.terms'
                                                                            .tr(),
                                                                    content: bloc
                                                                        .providerTermsKeys,
                                                                  ),
                                                              //   terms: bloc
                                                              //       .providerTermsKeys,
                                                              // ),
                                                            );
                                                          },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (formFieldState.hasError)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                              child: Text(
                                                formFieldState.errorText!,
                                                style: TextStyle(
                                                  color: Theme.of(
                                                    context,
                                                  ).colorScheme.error,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                        ],
                                      );
                                    },
                                  ),

                                  AppSpacing.h16,
                                  ElevatedButton(
                                    style: AppButtons.large,
                                    onPressed: () {
                                      if (bloc.signUpFormKey.currentState!
                                          .validate()) {
                                        bloc.add(SignUpEvent());
                                      }
                                    },
                                    child: Text("auth.signup".tr()),
                                  ),
                                  AppSpacing.h16,
                                  CustomRichText(
                                    normalText: 'auth.have_account'.tr(),
                                    linkText: 'auth.login'.tr(),
                                    onLinkTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProviderLoginScreen(),
                                        ),
                                      );
                                    },
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
 // CustomTextFormField(
                                  //   labelText: "auth.name_ar".tr(),
                                  //   icon: Icon(CupertinoIcons.person),
                                  //   controller: bloc.nameArController,
                                  //   validator: AppValidation.validateNameAr,
                                  // ),
                                  // AppSpacing.h16,

                                  // CustomTextFormField(
                                  //   labelText: "auth.description_ar".tr(),
                                  //   icon: Icon(CupertinoIcons.doc_text),
                                  //   controller: bloc.descriptionArController,
                                  //   validator:
                                  //       AppValidation.validateDescriptionAr,
                                  //   maxLines: 3,
                                  // ),
                                  // AppSpacing.h16,

                                  // CustomTextFormField(
                                  //   labelText: "auth.description_en".tr(),
                                  //   icon: Icon(CupertinoIcons.briefcase),
                                  //   controller: bloc.descriptionEnController,
                                  //   validator:
                                  //       AppValidation.validateDescriptionEn,
                                  //   maxLines: 3,
                                  // ),
                                  // AppSpacing.h16,
                                  // AppSpacing.h16,

                                  // CustomTextFormField(
                                  //   labelText: "auth.iban".tr(),
                                  //   icon: Icon(CupertinoIcons.creditcard),
                                  //   controller: bloc.ibanController,
                                  //   keyboardType: TextInputType.number,
                                  //   validator: AppValidation.validateIban,
                                  // ),