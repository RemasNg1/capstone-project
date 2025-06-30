part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SuccessState extends AuthState {}

class PasswordVisibilityState extends AuthState {}

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

// class SuccessStatePass extends AuthState {
//   final String password;
//   final bool hasMinLength;
//   final bool hasNumber;
//   final bool hasSpecialChar;
//   final bool hasUppercase;

//   SuccessStatePass({
//     this.password = '',
//     this.hasMinLength = false,
//     this.hasNumber = false,
//     this.hasSpecialChar = false,
//     this.hasUppercase = false,
//   });
// }

// class ResetPasswordSentState extends AuthState {}

// class ResetPasswordOTPSentState extends AuthState {}

class ResetPasswordOTPVerifiedState extends AuthState {}

class ResetPasswordOTPFailureState extends AuthState {
  final String error;
  ResetPasswordOTPFailureState({required this.error});
}
