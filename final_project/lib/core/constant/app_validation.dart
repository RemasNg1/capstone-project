import 'package:easy_localization/easy_localization.dart';

class AppValidation {
  // Validates name: must not be empty and at least 3 characters long
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'auth.name_required'.tr();
    }
    if (value.length < 3) {
      return 'auth.name_min'.tr();
    }
    return null;
  }

  // Validates email: must not be empty and match email format

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'auth.email_required'.tr();
    }
    final emailRegex = RegExp(r'^[\w.+-]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'auth.email_invalid'.tr();
    }
    return null;
  }
  // Validates phone number: must not be empty and match Saudi format (starts with 05 + 8 digits)

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'auth.phone_required'.tr();
    }
    final regex = RegExp(r'^05[0-9]{8}$');
    if (!regex.hasMatch(value)) {
      return 'auth.phone_invalid'.tr();
    }
    return null;
  }
  // Validates password: must not be empty, at least 6 characters, with one uppercase and one special character

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'auth.password_required'.tr();
    }
    if (value.length < 6) {
      return 'auth.password_min'.tr();
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'auth.password_uppercase'.tr();
    }
    if (!RegExp(r'[!@#$%^&*(),.?_":{}|<>]').hasMatch(value)) {
      return 'auth.password_special'.tr();
    }
    return null;
  }
  // Validates if the user agreed to the terms (must be true)

  static String? validateTermsAgreement(bool? value) {
    if (value != true) {
      return 'auth.terms_required'.tr();
    }
    return null;
  }
  // Validates required field: must not be empty

  static String? requiredField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'auth.field_required'.tr();
    }
    return null;
  }

  // Validates Arabic name: not empty, at least 3 characters, only Arabic letters/symbols
  static String? validateNameAr(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'auth.name_ar_required'.tr();
    }
    if (value.length < 3) {
      return 'auth.name_min'.tr();
    }
    final regex = RegExp(r'^[\u0600-\u06FF0-9\s\W_]+$');

    if (!regex.hasMatch(value)) {
      return 'auth.name_ar_invalid'.tr();
    }

    return null;
  }

  // Validates English name: not empty, at least 3 characters, only English letters/symbols
  static String? validateNameEn(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'auth.name_en_required'.tr();
    }
    if (value.length < 3) {
      return 'auth.name_min'.tr();
    }
    final regex = RegExp(r'^[a-zA-Z0-9\s\W_]+$');
    if (!regex.hasMatch(value)) {
      return 'auth.name_en_invalid'.tr();
    }

    return null;
  }

  // Validates Arabic description: not empty and must match Arabic characters/symbols
  static String? validateDescriptionAr(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'auth.description_ar_required'.tr();
    }

    final regex = RegExp(r'^[\u0600-\u06FF0-9\s\W_.,؛،?!()"\-]+$');
    if (!regex.hasMatch(value)) {
      return 'auth.description_ar_invalid'.tr();
    }

    return null;
  }

  // Validates English description: not empty and must match English characters/symbols

  static String? validateDescriptionEn(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'auth.description_en_required'.tr();
    }

    final regex = RegExp(r'^[a-zA-Z0-9\s\W_.,?!()"\-]+$');
    if (!regex.hasMatch(value)) {
      return 'auth.description_en_invalid'.tr();
    }

    return null;
  }

  // Validates CR (Commercial Registration) number: must be 10 digits
  static String? validateCrNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'auth.cr_number_required'.tr();
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'auth.cr_number_invalid'.tr();
    }
    return null;
  }
  // Validates IBAN: must follow Saudi IBAN format (starts with SA and 22 digits)

  static String? validateIban(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'auth.iban_required'.tr();
    }
    if (!RegExp(r'^SA\d{22}$').hasMatch(value)) {
      return 'auth.iban_invalid'.tr();
    }
    return null;
  }
}
