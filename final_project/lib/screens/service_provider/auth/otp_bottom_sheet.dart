import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/screens/service_provider/auth/bloc/auth_bloc.dart';
import 'package:final_project/screens/service_provider/auth/custom_rich_text.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:final_project/widgets/localized_aligned_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:slide_countdown/slide_countdown.dart';

class OtpBottomSheet extends StatelessWidget {
  final void Function(String) onCompleted;
  final bool isSignUp;

  const OtpBottomSheet({
    super.key,
    required this.onCompleted,
    this.isSignUp = true,
  });
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();

    return Container(
      height: context.getHeight(factor: 0.4),
      padding: MediaQuery.of(context).viewInsets.add(const EdgeInsets.all(24)),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LocalizedAlignedText(
            text: "auth.enter_otp".tr(),
            style: AppTextStyles.interSize26(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          AppSpacing.h4,
          LocalizedAlignedText(
            text: "auth.enter_otp_description".tr(),
            style: AppTextStyles.interSize14(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          AppSpacing.h16,
          AppSpacing.h16,
          Pinput(length: 6, onCompleted: onCompleted),
          AppSpacing.h24,
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Column(
                children: [
                  SlideCountdownSeparated(
                    key: ValueKey(bloc.resendOtpCounter),
                    decoration: BoxDecoration(),
                    duration: Duration(seconds: 60),
                    separatorType: SeparatorType.symbol,
                    separator: ":",
                    slideDirection: SlideDirection.none,
                    style: AppTextStyles.interSize16(
                      context,
                    ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                    onDone: () {
                      bloc.add(EnableResendOtpEvent());
                    },
                  ),

                  AppSpacing.h8,

                  CustomRichText(
                    normalText: 'auth.did_not_receive_otp'.tr(),
                    linkText: 'auth.resend'.tr(),
                    onLinkTap: bloc.canResendOtp
                        ? () {
                            bloc.add(
                              ResendOtpEvent(
                                email: bloc.emailController.text,
                                isSignUp: isSignUp,
                              ),
                            );
                          }
                        : null,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
