import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_project/data_layer/auth_layer.dart';
import 'package:final_project/repo/auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';
// remasnugaithan+22@gmail.com

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authGetit = GetIt.I.get<AuthLayer>();
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>(signupMethod);
    on<LogInEvent>(loginMethod);
    on<VerifyOTPEvent>(verifyOtpMethod);
    on<SendResetPasswordOTPEvent>(sendResetPassword);
    on<VerifyResetPasswordOTPEvent>(verifyResetPasswordOtpMethod);
    on<ResetPasswordEvent>(resetPasswordMethod);
    on<ResendOtpEvent>(onResendOtp);
    on<TogglePasswordVisibility>(togglePasswordVisibilityMethod);
    on<SignInAnonymouslyEvent>(signInAnonymouslyMethod);
  }
  FutureOr<void> signupMethod(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await authGetit.signUpMethod(
        name: usernameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
      );
      emit(OTPSentState());
    } catch (e) {
      print("Email: ${emailController.text}");
      print("Password: ${passwordController.text}");
      print("Phone: ${phoneController.text}");

      print("Signup error: $e");
      emit(FailureState());
    }
  }

  FutureOr<void> loginMethod(LogInEvent event, Emitter<AuthState> emit) async {
    try {
      await authGetit.loginMethod(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(SuccessState());
    } catch (e) {
      if (e is FormatException && e.message == "not_verified") {
        emit(OTPSentState());
      } else {
        emit(FailureState(error: "Wrong email or password. Please try again."));
      }
    }
  }

  FutureOr<void> verifyOtpMethod(
    VerifyOTPEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await authGetit.verifyOtpMethod(
        email: emailController.text,

        otp: event.otpCode,
      );

      emit(OTPVerifiedState());
    } catch (e) {
      emit(OTPFailureState(error: e.toString()));
    }
  }

  Future<void> sendResetPassword(
    SendResetPasswordOTPEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await authGetit.forgotPasswordMethod(emailController.text);
      emit(OTPSentState());
    } catch (e) {
      emit(FailureState(error: "Failed to send reset email"));
    }
  }

  FutureOr<void> verifyResetPasswordOtpMethod(
    VerifyResetPasswordOTPEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await authGetit.verifyOtpPasswordMethod(
        email: emailController.text,
        otp: event.otp,
      );
      emit(ResetPasswordOTPVerifiedState());
    } catch (e) {
      emit(ResetPasswordOTPFailureState(error: e.toString()));
    }
  }

  FutureOr<void> resetPasswordMethod(
    ResetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await authGetit.resetPassword(event.newPassword);
      emit(SuccessState());
    } catch (e) {
      emit(FailureState(error: e.toString()));
    }
  }

  Future<void> onResendOtp(
    ResendOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await Auth.resendOtp(email: event.email);
      emit(OTPResentState());
    } catch (e) {
      emit(FailureState(error: e.toString()));
    }
  }

  FutureOr<void> togglePasswordVisibilityMethod(
    TogglePasswordVisibility event,
    Emitter<AuthState> emit,
  ) {
    isPasswordHidden = !isPasswordHidden;
    emit(PasswordVisibilityState());
  }

  FutureOr<void> signInAnonymouslyMethod(
    SignInAnonymouslyEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await authGetit.signInAnonymouslyMethod();
      emit(SuccessState());
    } catch (e) {
      emit(FailureState(error: e.toString()));
    }
  }

  // on<PasswordChangedEvent>((event, emit) {
  //   final pwd = event.password;
  //   final bool hasMinLength = pwd.length >= 6;
  //   final bool hasNumber = RegExp(r'\d').hasMatch(pwd);
  //   final bool hasUppercase = RegExp(r'[A-Z]').hasMatch(pwd);
  //   final bool hasSpecialChar = RegExp(
  //     r'[!@#$%^&*(),.?":{}|<>_]',
  //   ).hasMatch(pwd);

  //   emit(
  //     SuccessStatePass(
  //       password: pwd,
  //       hasMinLength: hasMinLength,
  //       hasNumber: hasNumber,
  //       hasUppercase: hasUppercase,
  //       hasSpecialChar: hasSpecialChar,
  //     ),
  //   );
  // });

  // on<ToggleConfirmPasswordVisibility>((event, emit) {
  //   isConfirmPasswordHidden = !isConfirmPasswordHidden;
  //   emit(ConfirmPasswordVisibilityState());
  // });
  // on<TogglePasswordVisibility>((event, emit) {
  //     isPasswordHidden = !isPasswordHidden;
  //     emit(PasswordVisibilityState());
  //   });

  //   on<SignInAnonymouslyEvent>((event, emit) async {
  //     try {
  //       await authGetit.signInAnonymouslyMethod();
  //       emit(SuccessState());
  //     } catch (e) {
  //       emit(FailureState(error: e.toString()));
  //     }
  //   });
}
