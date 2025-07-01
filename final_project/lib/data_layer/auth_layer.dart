import 'package:final_project/core/enum/types.dart';
import 'package:final_project/models/client/client_model.dart';
import 'package:final_project/models/provider/provider_model.dart';
import 'package:final_project/repo/auth.dart';
import 'package:final_project/repo/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthLayer {
  String? idUser;

  Future<void> clientSignUpMethod({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      final user = await Auth.signUp(email: email, password: password);
      idUser = user.id;
      await insertUserToUsersTable(name: name, phoneNumber: phone);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> providerSignUpMethod({
    required String email,
    required String password,
    // required String nameAr,
    required String nameEn,
    // required String descriptionAr,
    // required String descriptionEn,
    // required String iban,
    required String phoneNumber,
    String? commercialRegistrationNumber,
  }) async {
    try {
      final user = await Auth.signUp(email: email, password: password);
      idUser = user.id;
      await insertUserToProvidersTable(
        // nameAr: nameAr,
        nameEn: nameEn,
        // descriptionAr: descriptionAr,
        // descriptionEn: descriptionEn,
        // iban: iban,
        phoneNumber: phoneNumber,
        commercialRegistrationNumber: commercialRegistrationNumber,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> loginMethod({
    required String email,
    required String password,
  }) async {
    final user = await Auth.signIn(email: email, password: password);
    idUser = user.id;
  }

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

  Future<void> resetPassword(String newPassword) async {
    try {
      await Auth.updatePassword(newPassword);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> insertUserToUsersTable({
    required String name,
    required String phoneNumber,
  }) async {
    final user = ClientModel(
      name: name,
      phoneNumber: phoneNumber,
      status: EnumUserStatus.online,
      authId: idUser,
      avatar: null,
      isVerified: false,
    );

    await SupabaseConnect.supabase!.client
        .from('user')
        .insert(user.mapForAddSupabase());
  }

  Future<void> insertUserToProvidersTable({
    // required String nameAr,
    required String nameEn,
    // required String descriptionAr,
    // required String descriptionEn,
    // required String iban,
    required String phoneNumber,
    String? commercialRegistrationNumber,
  }) async {
    final user = ProviderModel(
      nameAr: null,
      nameEn: nameEn,
      descriptionAr: null,
      descriptionEn: null,
      phoneNumber: phoneNumber,
      iban: null,
      commercialRegistrationNumber: commercialRegistrationNumber,
      status: EnumUserStatus.online,
      authId: idUser,
      avatar: null,
      isVerified: false,
    );

    await SupabaseConnect.supabase!.client
        .from('providers')
        .insert(user.mapForAddSupabase());
  }

  Future<void> signInAnonymouslyMethod() async {
    try {
      final user = await Auth.signInAnonymously();
      idUser = user.id;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logoutMethod() async {
    try {
      await Auth.signOut();
      idUser = null;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> forgotPasswordOtpMethod(String email) async {
    try {
      await Auth.sendResetEmail(email);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resendForgotPasswordOtpMethod(String email) async {
    try {
      await Auth.sendResetEmail(email);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isClient() async {
    return await Auth.isClient();
  }

  Future<bool> isProvider() async {
    return await Auth.isProvider();
  }
}
