part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SuccessState extends AuthState {}

class PasswordVisibilityState extends AuthState {}

class ToggleAgreeToTermsState extends AuthState {}

final class FailureState extends AuthState {
  final String? error;
  FailureState({this.error});
}

class OTPSentState extends AuthState {}

class OTPVerifiedState extends AuthState {}

class OTPResentState extends AuthState {}

class OTPFailureState extends AuthState {
  final String error;
  OTPFailureState({required this.error});
}

class EnableResendOtpState extends AuthState {}

class DisableResendOtpState extends AuthState {}

class ResetPasswordOTPVerifiedState extends AuthState {}

class ResetPasswordOTPFailureState extends AuthState {
  final String error;
  ResetPasswordOTPFailureState({required this.error});
}
