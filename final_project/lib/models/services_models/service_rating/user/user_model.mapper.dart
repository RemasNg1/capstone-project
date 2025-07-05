// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_model.dart';

class UserModelMapper extends ClassMapperBase<UserModel> {
  UserModelMapper._();

  static UserModelMapper? _instance;
  static UserModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserModel';

  static String? _$id(UserModel v) => v.id;
  static const Field<UserModel, String> _f$id = Field('id', _$id, opt: true);
  static String _$name(UserModel v) => v.name;
  static const Field<UserModel, String> _f$name = Field('name', _$name);
  static String? _$avatar(UserModel v) => v.avatar;
  static const Field<UserModel, String> _f$avatar =
      Field('avatar', _$avatar, opt: true);
  static String? _$notificationId(UserModel v) => v.notificationId;
  static const Field<UserModel, String> _f$notificationId = Field(
      'notificationId', _$notificationId,
      key: r'notification_id', opt: true);

  @override
  final MappableFields<UserModel> fields = const {
    #id: _f$id,
    #name: _f$name,
    #avatar: _f$avatar,
    #notificationId: _f$notificationId,
  };

  static UserModel _instantiate(DecodingData data) {
    return UserModel(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        avatar: data.dec(_f$avatar),
        notificationId: data.dec(_f$notificationId));
  }

  @override
  final Function instantiate = _instantiate;

  static UserModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserModel>(map);
  }

  static UserModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserModel>(json);
  }
}

mixin UserModelMappable {
  String toJson() {
    return UserModelMapper.ensureInitialized()
        .encodeJson<UserModel>(this as UserModel);
  }

  Map<String, dynamic> toMap() {
    return UserModelMapper.ensureInitialized()
        .encodeMap<UserModel>(this as UserModel);
  }

  UserModelCopyWith<UserModel, UserModel, UserModel> get copyWith =>
      _UserModelCopyWithImpl<UserModel, UserModel>(
          this as UserModel, $identity, $identity);
  @override
  String toString() {
    return UserModelMapper.ensureInitialized()
        .stringifyValue(this as UserModel);
  }

  @override
  bool operator ==(Object other) {
    return UserModelMapper.ensureInitialized()
        .equalsValue(this as UserModel, other);
  }

  @override
  int get hashCode {
    return UserModelMapper.ensureInitialized().hashValue(this as UserModel);
  }
}

extension UserModelValueCopy<$R, $Out> on ObjectCopyWith<$R, UserModel, $Out> {
  UserModelCopyWith<$R, UserModel, $Out> get $asUserModel =>
      $base.as((v, t, t2) => _UserModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserModelCopyWith<$R, $In extends UserModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? name, String? avatar, String? notificationId});
  UserModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserModel, $Out>
    implements UserModelCopyWith<$R, UserModel, $Out> {
  _UserModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserModel> $mapper =
      UserModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          String? name,
          Object? avatar = $none,
          Object? notificationId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (name != null) #name: name,
        if (avatar != $none) #avatar: avatar,
        if (notificationId != $none) #notificationId: notificationId
      }));
  @override
  UserModel $make(CopyWithData data) => UserModel(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      avatar: data.get(#avatar, or: $value.avatar),
      notificationId: data.get(#notificationId, or: $value.notificationId));

  @override
  UserModelCopyWith<$R2, UserModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
