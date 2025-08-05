import 'dart:developer';
import 'package:final_project/models/client/client_model.dart';
import 'package:final_project/models/provider/provider_model.dart';
import 'package:final_project/repo/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Auth {
  // Registers a new user using email and password

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
  // Verifies OTP code sent to the user

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
  // Resends OTP for signup verification

  Future<void> resendVerificationEmail(String email) async {
    try {
      await SupabaseConnect.supabase!.client.auth.signInWithOtp();
    } catch (e) {
      throw FormatException("Failed to resend verification email");
    }
  }
  // Logs in a user with email and password

  static Future<User> signInClient({
    required String email,
    required String password,
  }) async {
    try {
      final response = await SupabaseConnect.supabase!.client.auth
          .signInWithPassword(email: email, password: password);

      if (response.user == null) {
        throw FormatException("wrong");
      }

      final authId = response.user!.id;

      final result = await SupabaseConnect.supabase!.client
          .from('user')
          .select('id')
          .eq('auth_id', authId)
          .maybeSingle();

      if (result == null) {
        await SupabaseConnect.supabase!.client.auth.signOut();
        throw FormatException("wrong");
      }

      return response.user!;
    } on AuthApiException catch (error) {
      if (error.code == 'email_not_confirmed') {
        await SupabaseConnect.supabase!.client.auth.resend(
          type: OtpType.signup,
          email: email,
        );
        throw FormatException("not_verified");
      }
      throw FormatException("wrong");
    } on AuthException catch (_) {
      throw FormatException("wrong");
    } catch (_) {
      throw FormatException("wrong");
    }
  }

  static Future<User> signInProvider({
    required String email,
    required String password,
  }) async {
    try {
      final response = await SupabaseConnect.supabase!.client.auth
          .signInWithPassword(email: email, password: password);

      if (response.user == null) {
        throw FormatException("wrong");
      }

      final authId = response.user!.id;

      final result = await SupabaseConnect.supabase!.client
          .from('providers')
          .select('id')
          .eq('auth_id', authId)
          .maybeSingle();

      if (result == null) {
        await SupabaseConnect.supabase!.client.auth.signOut();
        throw FormatException("wrong");
      }

      return response.user!;
    } on AuthApiException catch (error) {
      if (error.code == 'email_not_confirmed') {
        await SupabaseConnect.supabase!.client.auth.resend(
          type: OtpType.signup,
          email: email,
        );
        throw FormatException("not_verified");
      }
      throw FormatException("wrong");
    } on AuthException catch (_) {
      throw FormatException("wrong");
    } catch (_) {
      throw FormatException("wrong");
    }
  }

  // static Future<User> signIn({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     final response = await SupabaseConnect.supabase!.client.auth
  //         .signInWithPassword(email: email, password: password);
  //     if (response.user == null) {
  //       throw FormatException("wrong");
  //     }
  //     return response.user!;
  //   } on AuthApiException catch (error) {
  //     if (error.code == 'email_not_confirmed') {
  //       final res = await SupabaseConnect.supabase!.client.auth.resend(
  //         type: OtpType.signup,
  //         email: email,
  //       );
  //       throw FormatException("not_verified");
  //     }
  //     throw FormatException(error.message);
  //   } on AuthException catch (error) {
  //     throw FormatException(error.message);
  //   } catch (error) {
  //     throw FormatException("wrong");
  //   }
  // }

  // static Future<User> signInClient({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     print('Checking client...');
  //     testClientCheck();
  //     final isClient = await isEmailInClients(email);
  //     print('isClient: $isClient');
  //     if (!isClient) {
  //       throw FormatException("wrong");
  //     }
  //     final response = await SupabaseConnect.supabase!.client.auth
  //         .signInWithPassword(email: email, password: password);
  //     if (response.user == null) {
  //       throw FormatException("wrong");
  //     }
  //     return response.user!;
  //   } on AuthApiException catch (error) {
  //     if (error.code == 'email_not_confirmed') {
  //       final res = await SupabaseConnect.supabase!.client.auth.resend(
  //         type: OtpType.signup,
  //         email: email,
  //       );
  //       throw FormatException("not_verified");
  //     }
  //     throw FormatException(error.message);
  //   } on AuthException catch (error) {
  //     throw FormatException(error.message);
  //   } catch (error) {
  //     throw FormatException("wrong");
  //   }
  // }

  // static void testClientCheck() async {
  //   final email = 'remasnugaithan+15@gmail.com';
  //   print('🔍 Checking if $email is a client');

  //   try {
  //     final client = SupabaseConnect.supabase!.client;

  //     final authUser = await client
  //         .from('auth.users')
  //         .select('id')
  //         .eq('email', email)
  //         .maybeSingle();

  //     print('📥 authUser: $authUser');

  //     if (authUser == null) {
  //       print('❌ لا يوجد مستخدم بهذا البريد في auth.users');
  //       return;
  //     }

  //     final authId = authUser['id'];

  //     final result = await client
  //         .from('user')
  //         .select('id')
  //         .eq('auth_id', authId)
  //         .maybeSingle();

  //     print('✅ نتيجة البحث في user: $result');

  //     final isClient = result != null;
  //     print('🎯 isClient = $isClient');
  //   } catch (e) {
  //     print('🔥 Error checking client: $e');
  //   }
  // }

  // static Future<bool> isEmailInClients(String email) async {
  //   final client = SupabaseConnect.supabase!.client;

  //   final authUser = await client
  //       .from('auth.users')
  //       .select('id')
  //       .eq('email', email)
  //       .maybeSingle();
  //   log(authUser.toString());

  //   if (authUser == null) return false;

  //   final authId = authUser['id'];

  //   final result = await client
  //       .from('user')
  //       .select('id')
  //       .eq('auth_id', authId)
  //       .maybeSingle();

  //   log(result.toString());

  //   return result != null;
  // }
  // Resends OTP for signup verification

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
  // Signs in a user anonymously

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
  // Signs out the currently authenticated user

  static Future<void> signOut() async {
    try {
      await SupabaseConnect.supabase!.client.auth.signOut();
    } on AuthException catch (error) {
      throw FormatException(error.message);
    } catch (error) {
      throw FormatException("Unknown error during sign out");
    }
  }
  // Updates password of the currently signed-in user

  static Future<void> updatePassword(String newPassword) async {
    await SupabaseConnect.supabase!.client.auth.updateUser(
      UserAttributes(password: newPassword),
    );
  }

  // Sends password reset email
  static Future<void> sendResetEmail(String email) async {
    try {
      await SupabaseConnect.supabase!.client.auth.resetPasswordForEmail(email);
    } on AuthException catch (error) {
      throw FormatException(error.message);
    } catch (_) {
      throw FormatException("Failed to send reset OTP");
    }
  }
  // Checks if the current user is a client (from 'user' table)

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
  // Checks if the current user is a provider (from 'providers' table)

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
  // Fetches the current client's full info (name, avatar, etc.)

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
  // Fetches the current provider's full info

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
  // Updates client (user table) name and phone number

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
  // Updates provider info such as names, phone, CR number, IBAN

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
  // Gets current user raw map data from 'user' table

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

  static Future<ClientModel> updateUserAvatar(String avatarUrl) async {
    final userId = Supabase.instance.client.auth.currentUser?.id;

    if (userId == null) throw Exception("User not logged in");

    final response = await Supabase.instance.client
        .from('user')
        .update({'avatar': avatarUrl})
        .eq('auth_id', userId)
        .select()
        .single();
    return ClientModelMapper.fromMap(response);
  }
}

  // static Future<ClientModel> updateUserAvatar(File file) async {
  //   final supabase = Supabase.instance.client;
  //   final userId = supabase.auth.currentUser!.id;
  //   final fileName = 'avatar_$userId.jpg';
  //   final filePath = 'avatars/$fileName';

  //   try {
  //     await supabase.storage
  //         .from('avatars')
  //         .upload(filePath, file, fileOptions: const FileOptions(upsert: true));

  //     final publicUrl = supabase.storage.from('avatars').getPublicUrl(filePath);

  //     final updateResponse = await supabase
  //         .from('user')
  //         .update({'avatar': publicUrl})
  //         .eq('auth_id', userId)
  //         .select('name, phone_number, avatar')
  //         .single();

  //     return ClientModelMapper.fromMap(updateResponse);
  //   } catch (e) {
  //     log('Error updating avatar: $e');
  //     throw Exception('Error updating avatar: $e');
  //   }
  // }

