import 'package:final_project/core/enum/types.dart';
import 'package:final_project/models/client/client_model.dart';
import 'package:final_project/models/provider/provider_model.dart';
import 'package:final_project/repo/auth.dart';
import 'package:final_project/repo/supabase.dart';
import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthLayer {
  String? idUser;
  static final box = Hive.box('userInfo');
  late EnumUserType? userType;

  // Sign up method for client users
  Future<void> clientSignUpMethod({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      final user = await Auth.signUp(email: email, password: password);
      idUser = user.id;
      userType = EnumUserType.customer;
      box.put('userType', userType!.name);

      await insertUserToUsersTable(name: name, phoneNumber: phone);
    } catch (e) {
      rethrow;
    }
  }
  // Sign up method for provider users

  Future<void> providerSignUpMethod({
    required String email,
    required String password,
    required String nameAr,
    required String nameEn,
    required String iban,
    required String phoneNumber,
    String? commercialRegistrationNumber,
  }) async {
    try {
      final user = await Auth.signUp(email: email, password: password);
      idUser = user.id;
      await insertUserToProvidersTable(
        nameAr: nameAr,
        nameEn: nameEn,
        iban: iban,
        phoneNumber: phoneNumber,
        commercialRegistrationNumber: commercialRegistrationNumber,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Sign in method using email and password

  Future<void> clientLoginMethod({
    required String email,
    required String password,
  }) async {
    final user = await Auth.signInClient(email: email, password: password);
    idUser = user.id;
    userType = EnumUserType.customer;
    box.put('userType', userType!.name);
    box.put('authId', "${user.id}");
  }

  Future<void> providerLoginMethod({
    required String email,
    required String password,
  }) async {
    final user = await Auth.signInProvider(email: email, password: password);
    idUser = user.id;
    box.put('authId', "${user.id}");
  }

  // OTP verification for client after sign-up

  Future<void> clientVerifyOtpMethod({
    required String email,
    required String otp,
    OtpType? type,
  }) async {
    try {
      await Auth.verifyOtp(email: email, otp: otp, type: OtpType.email);
      final user = SupabaseConnect.supabase!.client.auth.currentUser;
      if (user == null) throw FormatException("User not found");

      await SupabaseConnect.supabase!.client
          .from('user')
          .update({'is_verified': true})
          .eq('auth_id', user.id);
    } catch (e) {
      rethrow;
    }
  }
  // Future<void> loginMethod({
  //   required String email,
  //   required String password,
  // }) async {
  //   final user = await Auth.signIn(email: email, password: password);
  //   idUser = user.id;
  //   box.put('authId', "${user.id}");
  // }
  // // OTP verification for client after sign-up

  // Future<void> clientVerifyOtpMethod({
  //   required String email,
  //   required String otp,
  //   OtpType? type,
  // }) async {
  //   try {
  //     await Auth.verifyOtp(email: email, otp: otp, type: OtpType.email);
  //     final user = SupabaseConnect.supabase!.client.auth.currentUser;
  //     if (user == null) throw FormatException("User not found");

  //     await SupabaseConnect.supabase!.client
  //         .from('user')
  //         .update({'is_verified': true})
  //         .eq('auth_id', user.id);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  // OTP verification for provider after sign-up

  Future<void> providerVerifyOtpMethod({
    required String email,
    required String otp,
    OtpType? type,
  }) async {
    try {
      await Auth.verifyOtp(email: email, otp: otp, type: OtpType.email);
      final user = SupabaseConnect.supabase!.client.auth.currentUser;
      if (user == null) throw FormatException("User not found");

      await SupabaseConnect.supabase!.client
          .from('providers')
          .update({'is_verified': true})
          .eq('auth_id', user.id);
    } catch (e) {
      rethrow;
    }
  }
  // OTP verification for password recovery

  Future<void> verifyOtpPasswordMethod({
    required String email,
    required String otp,
    OtpType? type,
  }) async {
    try {
      await Auth.verifyOtp(email: email, otp: otp, type: OtpType.recovery);
      final user = SupabaseConnect.supabase!.client.auth.currentUser;
      if (user == null) throw FormatException("User not found");
    } catch (e) {
      rethrow;
    }
  }
  // Reset user's password

  Future<void> resetPassword(String newPassword) async {
    try {
      await Auth.updatePassword(newPassword);
    } catch (e) {
      rethrow;
    }
  }
  // Insert client user data into the database

  Future<void> insertUserToUsersTable({
    required String name,
    required String phoneNumber,
  }) async {
    final user = ClientModel(
      name: name,
      phoneNumber: phoneNumber,
      // status: EnumUserStatus.online,
      authId: idUser,
      avatar: null,
      isVerified: false,
    );

    await SupabaseConnect.supabase!.client
        .from('user')
        .insert(user.mapForAddSupabase());
  }
  // Insert provider user data into the database

  Future<void> insertUserToProvidersTable({
    required String nameAr,
    required String nameEn,
    required String iban,
    required String phoneNumber,
    String? commercialRegistrationNumber,
  }) async {
    final user = ProviderModel(
      nameAr: nameAr,
      nameEn: nameEn,
      descriptionAr: null,
      descriptionEn: null,
      phoneNumber: phoneNumber,
      iban: iban,
      commercialRegistrationNumber: commercialRegistrationNumber,
      status: EnumUserStatus.online,
      authId: idUser,
      avatar: 'https://i.imgur.com/ZDM3MLB.png',
      isVerified: false,
    );

    await SupabaseConnect.supabase!.client
        .from('providers')
        .insert(user.mapForAddSupabase());
  }

  // Sign in anonymously (for guests)
  Future<void> signInAnonymouslyMethod() async {
    try {
      final user = await Auth.signInAnonymously();
      idUser = user.id;
    } catch (e) {
      rethrow;
    }
  }
  // Logout the currently signed-in user

  Future<void> logoutMethod() async {
    try {
      await Auth.signOut();
      idUser = null;
    } catch (e) {
      rethrow;
    }
  }
  // Send OTP for password reset

  Future<void> forgotPasswordOtpMethod(String email) async {
    try {
      await Auth.sendResetEmail(email);
    } catch (e) {
      rethrow;
    }
  }
  // Resend OTP for password reset

  Future<void> resendForgotPasswordOtpMethod(String email) async {
    try {
      await Auth.sendResetEmail(email);
    } catch (e) {
      rethrow;
    }
  }

  // Check if the current user is a client

  Future<bool> isClient() async {
    return await Auth.isClient();
  }
  // Check if the current user is a provider

  Future<bool> isProvider() async {
    return await Auth.isProvider();
  }
}
