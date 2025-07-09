import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_project/data_layer/auth_layer.dart';
import 'package:final_project/repo/auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Map<String, String> clientTermsKeys = {
    "client_terms.title_1": "client_terms.body_1",
    "client_terms.title_2": "client_terms.body_2",
    "client_terms.title_3": "client_terms.body_3",
    "client_terms.title_4": "client_terms.body_4",
    "client_terms.title_5": "client_terms.body_5",
    "client_terms.title_6": "client_terms.body_6",
    "client_terms.title_7": "client_terms.body_7",
    "client_terms.title_8": "client_terms.body_8",
    "client_terms.title_9": "client_terms.body_9",
  };

  // final formKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  final signUpFormKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();
  final resetPasswordFormKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authGetit = GetIt.I.get<AuthLayer>();
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;
  bool isAgreedToTerms = false;
  bool canResendOtp = false;
  int resendOtpCounter = 0;

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
    on<ToggleAgreeToTermsEvent>(toggleAgreeToTermsMethod);
    on<EnableResendOtpEvent>(enableResendOtpMethod);
    on<DisableResendOtpEvent>(disableResendOtpMethod);
  }
  FutureOr<void> signupMethod(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await authGetit.clientSignUpMethod(
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
      await authGetit.clientVerifyOtpMethod(
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
      await authGetit.forgotPasswordOtpMethod(emailController.text);
      emit(OTPSentState());
    } catch (e) {
      emit(FailureState(error: "Failed to send reset email"));
    }
  }

  // Future<void> resendResetPassword(
  //   SendResetPasswordOTPEvent event,
  //   Emitter<AuthState> emit,
  // ) async {
  //   try {
  //     await authGetit.resendForgotPasswordOtpMethod(emailController.text);
  //     emit(OTPSentState());
  //   } catch (e) {
  //     emit(FailureState(error: "Failed to send reset email"));
  //   }
  // }

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
      if (event.isSignUp) {
        await Auth.resendOtp(email: event.email);
      } else {
        await authGetit.forgotPasswordOtpMethod(emailController.text);
      }
      resendOtpCounter++;
      emit(OTPResentState());
      add(DisableResendOtpEvent());
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

  FutureOr<void> toggleAgreeToTermsMethod(
    ToggleAgreeToTermsEvent event,
    Emitter<AuthState> emit,
  ) {
    isAgreedToTerms = !isAgreedToTerms;
    emit(ToggleAgreeToTermsState());
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

  FutureOr<void> enableResendOtpMethod(
    EnableResendOtpEvent event,
    Emitter<AuthState> emit,
  ) {
    canResendOtp = true;
    emit(EnableResendOtpState());
  }

  FutureOr<void> disableResendOtpMethod(
    DisableResendOtpEvent event,
    Emitter<AuthState> emit,
  ) {
    canResendOtp = false;
    emit(DisableResendOtpState());
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
