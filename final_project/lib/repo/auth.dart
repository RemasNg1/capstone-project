import 'dart:developer';
import 'dart:io';

import 'package:final_project/models/client/client_model.dart';
import 'package:final_project/models/provider/provider_model.dart';
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

  static Future<void> updatePassword(String newPassword) async {
    await SupabaseConnect.supabase!.client.auth.updateUser(
      UserAttributes(password: newPassword),
    );
  }

  //remasnugaithan+15@gmail.com
  static Future<void> sendResetEmail(String email) async {
    try {
      await SupabaseConnect.supabase!.client.auth.resetPasswordForEmail(email);
    } on AuthException catch (error) {
      throw FormatException(error.message);
    } catch (_) {
      throw FormatException("Failed to send reset OTP");
    }
  }

  static Future<bool> isClient() async {
    final client = SupabaseConnect.supabase!.client;
    final currentUser = client.auth.currentUser;

    if (currentUser == null) return false;

    final response = await client
        .from('user')
        .select('id')
        .eq('auth_id', currentUser.id)
        .maybeSingle();

    return response != null;
  }

  static Future<bool> isProvider() async {
    final client = SupabaseConnect.supabase!.client;
    final currentUser = client.auth.currentUser;

    if (currentUser == null) return false;

    final response = await client
        .from('providers')
        .select('id')
        .eq('auth_id', currentUser.id)
        .maybeSingle();

    return response != null;
  }

  // static fetchCurrentUser() async {
  //   try {
  //     final authId = Supabase.instance.client.auth.currentUser?.id;

  //     if (authId == null) {
  //       return null;
  //     }

  //     // final userInfo = await Supabase.instance.client
  //     //     .from('user')
  //     //     .select()
  //     //     .eq('auth_id', authId)
  //     //     .single();

  //     final userInfo = await Supabase.instance.client
  //         .from('user')
  //         .select('name, phone_number')
  //         .eq('auth_id', authId)
  //         .single();

  //     return ClientModelMapper.fromMap(userInfo);
  //   } catch (e) {
  //     print('Error fetching user info: $e');
  //     return null;
  //   }
  // }

  // static Future<ClientModel?> fetchCurrentUser() async {
  //   try {
  //     final authId = Supabase.instance.client.auth.currentUser?.id;

  //     if (authId == null) return null;

  //     final userInfo = await Supabase.instance.client
  //         .from('user')
  //         .select('name, phone_number')
  //         .eq('auth_id', authId)
  //         .single();

  //     userInfo['auth_id'] = authId;

  //     return ClientModelMapper.fromMap(userInfo);
  //   } catch (e) {
  //     print('Error fetching user info: $e');
  //     return null;
  //   }
  // }
  static Future<ClientModel?> fetchCurrentUser() async {
    try {
      final user = Supabase.instance.client.auth.currentUser;

      if (user == null) return null;

      final authId = user.id;
      final email = user.email;

      final userInfo = await Supabase.instance.client
          .from('user')
          .select('name, avatar, phone_number')
          .eq('auth_id', authId)
          .single();

      userInfo['auth_id'] = authId;
      userInfo['email'] = email;

      return ClientModelMapper.fromMap(userInfo);
    } catch (e) {
      print('Error fetching user info: $e');
      return null;
    }
  }

  static Future<ProviderModel?> fetchCurrentProvider() async {
    try {
      final user = Supabase.instance.client.auth.currentUser;

      if (user == null) return null;

      final authId = user.id;
      final email = user.email;

      final providerInfo = await Supabase.instance.client
          .from('providers')
          .select(
            'name_ar,name_en,iban,commercial_registration_number, avatar, phone_number',
          )
          .eq('auth_id', authId)
          .single();

      providerInfo['auth_id'] = authId;
      providerInfo['email'] = email;
      log(providerInfo.toString());
      log(ProviderModelMapper.fromMap(providerInfo).toString());

      return ProviderModelMapper.fromMap(providerInfo);
    } catch (e) {
      print('Error fetching user info: $e');
      return null;
    }
  }

  static updateClientInfo({String? name, String? phoneNumber}) async {
    try {
      final client = SupabaseConnect.supabase!.client;
      final user = client.auth.currentUser;

      if (user == null) {
        throw FormatException("User not logged in");
      }

      final updates = <String, dynamic>{};

      if (name != null) updates['name'] = name;
      if (phoneNumber != null) updates['phone_number'] = phoneNumber;

      if (updates.isEmpty) return;

      await client.from('user').update(updates).eq('auth_id', user.id);
    } catch (e) {
      print('Error updating client info: $e');
      throw FormatException("Failed to update client information");
    }
  }

  static updateProviderInfo({
    String? nameAr,
    String? nameEn,
    String? phoneNumber,
    String? crNumber,
    String? iban,
  }) async {
    try {
      final client = SupabaseConnect.supabase!.client;
      final user = client.auth.currentUser;

      if (user == null) {
        throw FormatException("User not logged in");
      }

      final updates = <String, dynamic>{};

      if (nameAr != null) updates['name_ar'] = nameAr;
      if (nameEn != null) updates['name_en'] = nameEn;
      if (phoneNumber != null) updates['phone_number'] = phoneNumber;
      if (crNumber != null) {
        updates['commercial_registration_number'] = crNumber;
      }

      if (iban != null) updates['iban'] = iban;

      if (updates.isEmpty) return;

      await client.from('providers').update(updates).eq('auth_id', user.id);
    } catch (e) {
      print('Error updating client info: $e');
      throw FormatException("Failed to update client information");
    }
  }

  static getUser() async {
    try {
      final user = Supabase.instance.client.auth.currentUser;

      if (user == null) return null;

      final authId = user.id;
      final email = user.email;

      final userInfo = await Supabase.instance.client
          .from('user')
          .select('name,avatar , phone_number')
          .eq('auth_id', authId)
          .single();

      userInfo['auth_id'] = authId;
      userInfo['email'] = email;

      return userInfo;
    } catch (e) {
      print('Error fetching user info: $e');
      return null;
    }
  }

  // static updateUserAvatar(File file) async {
  //   try {
  //     final supabase = Supabase.instance.client;
  //     final userId = Supabase.instance.client.auth.currentUser!.id;

  //     final fileName = 'avatar_$userId.jpg';
  //     final filePath = 'avatars/$fileName';

  //     final response = await supabase.storage
  //         .from('avatars')
  //         .upload(filePath, file);

  //     final publicUrl = supabase.storage.from('avatars').getPublicUrl(filePath);

  //     final updateResponse = await supabase
  //         .from('user')
  //         .update({'avatar': publicUrl})
  //         .eq('auth_id', userId);

  //     if (updateResponse.error != null) {
  //       print('Update DB error: ${updateResponse.error!.message}');
  //       return;
  //     }

  //     print('Avatar updated successfully!');
  //   } catch (e) {
  //     print('Exception: $e');
  //   }
  // }

  static Future<ClientModel> updateUserAvatar(File file) async {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser!.id;
    final fileName = 'avatar_$userId.jpg';
    final filePath = 'avatars/$fileName';

    try {
      await supabase.storage
          .from('avatars')
          .upload(filePath, file, fileOptions: const FileOptions(upsert: true));

      final publicUrl = supabase.storage.from('avatars').getPublicUrl(filePath);

      final updateResponse = await supabase
          .from('user')
          .update({'avatar': publicUrl})
          .eq('auth_id', userId)
          .select('name, phone_number, avatar')
          .single();

      return ClientModelMapper.fromMap(updateResponse);
    } catch (e) {
      log('Error updating avatar: $e');
      throw Exception('Error updating avatar: $e');
    }
  }
}
