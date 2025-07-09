import 'package:dart_mappable/dart_mappable.dart';
import 'package:final_project/core/enum/types.dart';

part 'client_model.mapper.dart';

@MappableClass()
class ClientModel with ClientModelMappable {
  final String? id;
  final String name;
  final String? avatar;

  final EnumUserStatus? status;

  @MappableField(key: 'phone_number')
  final String phoneNumber;

  final String? email;

  @MappableField(key: 'auth_id')
  final String? authId;

  @MappableField(key: 'is_deleted')
  final bool isDeleted;

  @MappableField(key: 'is_verified')
  final bool isVerified;

  @MappableField(key: 'created_at')
  final DateTime? createdAt;

  @MappableField(key: 'updated_at')
  final DateTime? updatedAt;

  @MappableField(key: 'notification_id')
  final String? notificationId;

  const ClientModel({
    this.id,
    required this.name,
    this.avatar,
    this.email,
    required this.status,
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
      'name': name,
      'avatar': avatar,
      'status': status!.name,
      'phone_number': phoneNumber,
      'auth_id': authId,
      'is_deleted': isDeleted,
      'is_verified': isVerified,
      'notification_id': notificationId,
    };
  }
}
