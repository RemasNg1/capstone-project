import 'package:dart_mappable/dart_mappable.dart';
import 'package:final_project/core/enum/types.dart';

part 'provider_model.mapper.dart';

@MappableClass()
class ProviderModel with ProviderModelMappable {
  final String? id;

  @MappableField(key: 'name_ar')
  final String? nameAr;

  @MappableField(key: 'name_en')
  final String? nameEn;

  @MappableField(key: 'description_ar')
  final String? descriptionAr;

  @MappableField(key: 'description_en')
  final String? descriptionEn;

  final String? avatar;
  final String? iban;

  @MappableField(key: 'commercial_registration_number')
  final String? commercialRegistrationNumber;

  final EnumUserStatus? status;

  @MappableField(key: 'phone_number')
  final String? phoneNumber;

  @MappableField(key: 'auth_id')
  final String? authId;

  @MappableField(key: 'is_deleted')
  final bool? isDeleted;

  @MappableField(key: 'is_verified')
  final bool? isVerified;

  @MappableField(key: 'created_at')
  final DateTime? createdAt;

  @MappableField(key: 'updated_at')
  final DateTime? updatedAt;

  @MappableField(key: 'notification_id')
  final String? notificationId;

  const ProviderModel({
    this.id,
    required this.nameAr,
    required this.nameEn,
    required this.descriptionAr,
    required this.descriptionEn,
    this.avatar,
    required this.iban,
    this.commercialRegistrationNumber,
    this.status,
    required this.phoneNumber,
    this.authId,
    this.isDeleted = false,
    this.isVerified = false,
    this.createdAt,
    this.updatedAt,
    this.notificationId = '2',
  });

  mapForAddSupabase() {
    return {
      'name_ar': nameAr,
      'name_en': nameEn,
      'description_ar': descriptionAr,
      'description_en': descriptionEn,
      'avatar': avatar,
      'iban': iban,
      'commercial_registration_certificate': commercialRegistrationNumber,
      'status': status?.name,
      'phone_number': phoneNumber,
      'auth_id': authId,
      'is_deleted': isDeleted,
      'is_verified': isVerified,
      'notification_id': notificationId,
    };
  }
}
