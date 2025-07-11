part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignUpEvent extends AuthEvent {}

class LogInEvent extends AuthEvent {}

class VerifyOTPEvent extends AuthEvent {
  final String otpCode;
  VerifyOTPEvent(this.otpCode);
}

class SignInAnonymouslyEvent extends AuthEvent {}

class SendResetPasswordOTPEvent extends AuthEvent {}

class VerifyResetPasswordOTPEvent extends AuthEvent {
  final String email;
  final String otp;
  VerifyResetPasswordOTPEvent({required this.email, required this.otp});
}

class ResetPasswordEvent extends AuthEvent {
  final String newPassword;
  ResetPasswordEvent(this.newPassword);
}

class ResendOtpEvent extends AuthEvent {
  final String email;
  final bool isSignUp;

  ResendOtpEvent({required this.email, this.isSignUp = true});
}

class TogglePasswordVisibility extends AuthEvent {}

class ToggleAgreeToTermsEvent extends AuthEvent {}

class PasswordChangedEvent extends AuthEvent {
  final String password;

  PasswordChangedEvent(this.password);
}

class EnableResendOtpEvent extends AuthEvent {}

class DisableResendOtpEvent extends AuthEvent {}
