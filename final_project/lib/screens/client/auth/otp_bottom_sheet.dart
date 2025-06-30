import 'package:final_project/screens/client/auth/bloc/auth_bloc.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:slide_countdown/slide_countdown.dart';

class OtpBottomSheet extends StatelessWidget {
  final void Function(String) onCompleted;

  const OtpBottomSheet({super.key, required this.onCompleted});
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();

    return Container(
      padding: MediaQuery.of(context).viewInsets.add(const EdgeInsets.all(24)),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Enter OTP", style: Theme.of(context).textTheme.titleLarge),
          AppSpacing.h16,
          Pinput(
            length: 6,

            // onCompleted: (code) {
            onCompleted: onCompleted,
            // bloc.add(VerifyOTPEvent(code));
            // bloc.add(
            //   VerifyResetPasswordOTPEvent(
            //     email: bloc.emailController.text,
            //     otp: code,
            //   ),
            // );
            // },
          ),
          AppSpacing.h24,

          SlideCountdownSeparated(
            decoration: BoxDecoration(),
            duration: Duration(seconds: 59),
            separatorType: SeparatorType.symbol,
            slideDirection: SlideDirection.none,
            style: TextStyle(fontSize: 16, color: Colors.black),
            onDone: () {},
          ),
          AppSpacing.h8,

          TextButton(
            onPressed: () {
              bloc.add(ResendOtpEvent(bloc.emailController.text));
            },
            child: Text("Resend"),
          ),
        ],
        // ),
      ),
    );
  }
}
