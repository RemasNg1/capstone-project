import 'package:dart_mappable/dart_mappable.dart';

part 'user_model.mapper.dart';

@MappableClass()
class UserModel with UserModelMappable {
  final String? id;
  final String name;
  final String? avatar;

  @MappableField(key: 'notification_id')
  final String? notificationId;
  const UserModel({
    this.id,
    required this.name,
    this.avatar,
    this.notificationId,
  });
}
