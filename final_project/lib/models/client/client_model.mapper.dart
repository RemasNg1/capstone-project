// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'client_model.dart';

class ClientModelMapper extends ClassMapperBase<ClientModel> {
  ClientModelMapper._();

  static ClientModelMapper? _instance;
  static ClientModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClientModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ClientModel';

  static String? _$id(ClientModel v) => v.id;
  static const Field<ClientModel, String> _f$id = Field('id', _$id, opt: true);
  static String _$name(ClientModel v) => v.name;
  static const Field<ClientModel, String> _f$name = Field('name', _$name);
  static String? _$avatar(ClientModel v) => v.avatar;
  static const Field<ClientModel, String> _f$avatar =
      Field('avatar', _$avatar, opt: true);
  static String? _$email(ClientModel v) => v.email;
  static const Field<ClientModel, String> _f$email =
      Field('email', _$email, opt: true);
  static String _$phoneNumber(ClientModel v) => v.phoneNumber;
  static const Field<ClientModel, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber, key: r'phone_number');
  static String? _$authId(ClientModel v) => v.authId;
  static const Field<ClientModel, String> _f$authId =
      Field('authId', _$authId, key: r'auth_id', opt: true);
  static bool _$isDeleted(ClientModel v) => v.isDeleted;
  static const Field<ClientModel, bool> _f$isDeleted = Field(
      'isDeleted', _$isDeleted,
      key: r'is_deleted', opt: true, def: false);
  static bool _$isVerified(ClientModel v) => v.isVerified;
  static const Field<ClientModel, bool> _f$isVerified = Field(
      'isVerified', _$isVerified,
      key: r'is_verified', opt: true, def: false);
  static DateTime? _$createdAt(ClientModel v) => v.createdAt;
  static const Field<ClientModel, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at', opt: true);
  static DateTime? _$updatedAt(ClientModel v) => v.updatedAt;
  static const Field<ClientModel, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, key: r'updated_at', opt: true);
  static String? _$notificationId(ClientModel v) => v.notificationId;
  static const Field<ClientModel, String> _f$notificationId = Field(
      'notificationId', _$notificationId,
      key: r'notification_id', opt: true, def: '2');

  @override
  final MappableFields<ClientModel> fields = const {
    #id: _f$id,
    #name: _f$name,
    #avatar: _f$avatar,
    #email: _f$email,
    #phoneNumber: _f$phoneNumber,
    #authId: _f$authId,
    #isDeleted: _f$isDeleted,
    #isVerified: _f$isVerified,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #notificationId: _f$notificationId,
  };

  static ClientModel _instantiate(DecodingData data) {
    return ClientModel(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        avatar: data.dec(_f$avatar),
        email: data.dec(_f$email),
        phoneNumber: data.dec(_f$phoneNumber),
        authId: data.dec(_f$authId),
        isDeleted: data.dec(_f$isDeleted),
        isVerified: data.dec(_f$isVerified),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        notificationId: data.dec(_f$notificationId));
  }

  @override
  final Function instantiate = _instantiate;

  static ClientModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ClientModel>(map);
  }

  static ClientModel fromJson(String json) {
    return ensureInitialized().decodeJson<ClientModel>(json);
  }
}

mixin ClientModelMappable {
  String toJson() {
    return ClientModelMapper.ensureInitialized()
        .encodeJson<ClientModel>(this as ClientModel);
  }

  Map<String, dynamic> toMap() {
    return ClientModelMapper.ensureInitialized()
        .encodeMap<ClientModel>(this as ClientModel);
  }

  ClientModelCopyWith<ClientModel, ClientModel, ClientModel> get copyWith =>
      _ClientModelCopyWithImpl<ClientModel, ClientModel>(
          this as ClientModel, $identity, $identity);
  @override
  String toString() {
    return ClientModelMapper.ensureInitialized()
        .stringifyValue(this as ClientModel);
  }

  @override
  bool operator ==(Object other) {
    return ClientModelMapper.ensureInitialized()
        .equalsValue(this as ClientModel, other);
  }

  @override
  int get hashCode {
    return ClientModelMapper.ensureInitialized().hashValue(this as ClientModel);
  }
}

extension ClientModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ClientModel, $Out> {
  ClientModelCopyWith<$R, ClientModel, $Out> get $asClientModel =>
      $base.as((v, t, t2) => _ClientModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ClientModelCopyWith<$R, $In extends ClientModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? name,
      String? avatar,
      String? email,
      String? phoneNumber,
      String? authId,
      bool? isDeleted,
      bool? isVerified,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? notificationId});
  ClientModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ClientModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ClientModel, $Out>
    implements ClientModelCopyWith<$R, ClientModel, $Out> {
  _ClientModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ClientModel> $mapper =
      ClientModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          String? name,
          Object? avatar = $none,
          Object? email = $none,
          String? phoneNumber,
          Object? authId = $none,
          bool? isDeleted,
          bool? isVerified,
          Object? createdAt = $none,
          Object? updatedAt = $none,
          Object? notificationId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (name != null) #name: name,
        if (avatar != $none) #avatar: avatar,
        if (email != $none) #email: email,
        if (phoneNumber != null) #phoneNumber: phoneNumber,
        if (authId != $none) #authId: authId,
        if (isDeleted != null) #isDeleted: isDeleted,
        if (isVerified != null) #isVerified: isVerified,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (notificationId != $none) #notificationId: notificationId
      }));
  @override
  ClientModel $make(CopyWithData data) => ClientModel(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      avatar: data.get(#avatar, or: $value.avatar),
      email: data.get(#email, or: $value.email),
      phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
      authId: data.get(#authId, or: $value.authId),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted),
      isVerified: data.get(#isVerified, or: $value.isVerified),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      notificationId: data.get(#notificationId, or: $value.notificationId));

  @override
  ClientModelCopyWith<$R2, ClientModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ClientModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
