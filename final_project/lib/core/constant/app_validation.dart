import 'package:easy_localization/easy_localization.dart';

class AppValidation {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'auth.name_required'.tr();
    }
    if (value.length < 3) {
      return 'auth.name_min'.tr();
    }
    return null;
  }

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

  static String? validateTermsAgreement(bool? value) {
    if (value != true) {
      return 'auth.terms_required'.tr();
    }
    return null;
  }

  static String? requiredField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'auth.field_required'.tr();
    }
    return null;
  }

  ////////

  static String? validateNameAr(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'auth.name_ar_required'.tr();
    }
    if (value.length < 3) {
      return 'auth.name_min'.tr();
    }

    final regex = RegExp(r'^[\u0600-\u06FF\s\W_]+$');
    if (!regex.hasMatch(value)) {
      return 'auth.name_ar_invalid'.tr();
    }

    return null;
  }

  static String? validateNameEn(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'auth.name_en_required'.tr();
    }
    if (value.length < 3) {
      return 'auth.name_min'.tr();
    }

    final regex = RegExp(r'^[a-zA-Z\s\W_]+$');
    if (!regex.hasMatch(value)) {
      return 'auth.name_en_invalid'.tr();
    }

    return null;
  }

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

  static String? validateCrNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'auth.cr_number_required'.tr();
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'auth.cr_number_invalid'.tr();
    }
    return null;
  }

  static String? validateIban(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'auth.iban_required'.tr();
    }
    if (!RegExp(r'^SA\d{2}[0-9A-Z]{18}$').hasMatch(value)) {
      return 'auth.iban_invalid'.tr();
    }
    return null;
  }
}
