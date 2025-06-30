import 'package:final_project/repo/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Auth {
  static Future<User> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await SupabaseConnect.supabase!.client.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user == null) throw FormatException("No user returned");

      return response.user!;
    } on AuthException catch (error) {
      throw FormatException(error.message);
    } catch (error) {
      throw FormatException("Unknown error during signup");
    }
  }

  static Future<void> verifyOtp({
    required String email,
    required String otp,
    required OtpType type,
  }) async {
    try {
      final response = await SupabaseConnect.supabase!.client.auth.verifyOTP(
        email: email,
        token: otp,
        type: type,
      );

      if (response.user == null) {
        throw FormatException("Invalid OTP");
      }
    } on AuthException catch (error) {
      throw FormatException(error.message);
    } catch (error) {
      throw FormatException("Unknown error during OTP verification");
    }
  }

  static Future<void> updatePassword(String newPassword) async {
    await SupabaseConnect.supabase!.client.auth.updateUser(
      UserAttributes(password: newPassword),
    );
  }

  Future<void> resendVerificationEmail(String email) async {
    try {
      await SupabaseConnect.supabase!.client.auth.signInWithOtp();
    } catch (e) {
      throw FormatException("Failed to resend verification email");
    }
  }

  static Future<User> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await SupabaseConnect.supabase!.client.auth
          .signInWithPassword(email: email, password: password);
      if (response.user == null) {
        throw FormatException("wrong");
      }
      return response.user!;
    } on AuthApiException catch (error) {
      if (error.code == 'email_not_confirmed') {
        final res = await SupabaseConnect.supabase!.client.auth.resend(
          type: OtpType.signup,
          email: email,
        );
        throw FormatException("not_verified");
      }
      throw FormatException(error.message);
    } on AuthException catch (error) {
      throw FormatException(error.message);
    } catch (error) {
      throw FormatException("wrong");
    }
  }

  static Future<void> resendOtp({required String email}) async {
    try {
      await SupabaseConnect.supabase!.client.auth.resend(
        type: OtpType.signup,
        email: email,
      );
    } on AuthException catch (e) {
      throw FormatException(e.message);
    }
  }

  static Future<User> signInAnonymously() async {
    try {
      final response = await SupabaseConnect.supabase!.client.auth
          .signInAnonymously();
      if (response.user == null) {
        throw FormatException("Failed to sign in anonymously");
      }
      return response.user!;
    } on AuthException catch (error) {
      throw FormatException(error.message);
    } catch (error) {
      throw FormatException("Unknown error during anonymous sign-in");
    }
  }

  static Future<void> signOut() async {
    try {
      await SupabaseConnect.supabase!.client.auth.signOut();
    } on AuthException catch (error) {
      throw FormatException(error.message);
    } catch (error) {
      throw FormatException("Unknown error during sign out");
    }
  }

  static Future<void> sendResetEmail(String email) async {
    try {
      await SupabaseConnect.supabase!.client.auth.resetPasswordForEmail(email);
    } on AuthException catch (error) {
      throw FormatException(error.message);
    } catch (_) {
      throw FormatException("Failed to send reset link");
    }
  }
}
