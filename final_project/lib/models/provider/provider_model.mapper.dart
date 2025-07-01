// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'provider_model.dart';

class ProviderModelMapper extends ClassMapperBase<ProviderModel> {
  ProviderModelMapper._();

  static ProviderModelMapper? _instance;
  static ProviderModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProviderModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProviderModel';

  static String? _$id(ProviderModel v) => v.id;
  static const Field<ProviderModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$nameAr(ProviderModel v) => v.nameAr;
  static const Field<ProviderModel, String> _f$nameAr =
      Field('nameAr', _$nameAr, key: r'name_ar');
  static String _$nameEn(ProviderModel v) => v.nameEn;
  static const Field<ProviderModel, String> _f$nameEn =
      Field('nameEn', _$nameEn, key: r'name_en');
  static String? _$descriptionAr(ProviderModel v) => v.descriptionAr;
  static const Field<ProviderModel, String> _f$descriptionAr =
      Field('descriptionAr', _$descriptionAr, key: r'description_ar');
  static String? _$descriptionEn(ProviderModel v) => v.descriptionEn;
  static const Field<ProviderModel, String> _f$descriptionEn =
      Field('descriptionEn', _$descriptionEn, key: r'description_en');
  static String? _$avatar(ProviderModel v) => v.avatar;
  static const Field<ProviderModel, String> _f$avatar =
      Field('avatar', _$avatar, opt: true);
  static String? _$iban(ProviderModel v) => v.iban;
  static const Field<ProviderModel, String> _f$iban = Field('iban', _$iban);
  static String? _$commercialRegistrationNumber(ProviderModel v) =>
      v.commercialRegistrationNumber;
  static const Field<ProviderModel, String> _f$commercialRegistrationNumber =
      Field('commercialRegistrationNumber', _$commercialRegistrationNumber,
          key: r'commercial_registration_number', opt: true);
  static EnumUserStatus _$status(ProviderModel v) => v.status;
  static const Field<ProviderModel, EnumUserStatus> _f$status =
      Field('status', _$status);
  static String _$phoneNumber(ProviderModel v) => v.phoneNumber;
  static const Field<ProviderModel, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber, key: r'phone_number');
  static String? _$authId(ProviderModel v) => v.authId;
  static const Field<ProviderModel, String> _f$authId =
      Field('authId', _$authId, key: r'auth_id', opt: true);
  static bool _$isDeleted(ProviderModel v) => v.isDeleted;
  static const Field<ProviderModel, bool> _f$isDeleted = Field(
      'isDeleted', _$isDeleted,
      key: r'is_deleted', opt: true, def: false);
  static bool _$isVerified(ProviderModel v) => v.isVerified;
  static const Field<ProviderModel, bool> _f$isVerified =
      Field('isVerified', _$isVerified, key: r'is_verified');
  static DateTime? _$createdAt(ProviderModel v) => v.createdAt;
  static const Field<ProviderModel, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at', opt: true);
  static DateTime? _$updatedAt(ProviderModel v) => v.updatedAt;
  static const Field<ProviderModel, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, key: r'updated_at', opt: true);
  static String? _$notificationId(ProviderModel v) => v.notificationId;
  static const Field<ProviderModel, String> _f$notificationId = Field(
      'notificationId', _$notificationId,
      key: r'notification_id', opt: true, def: '2');

  @override
  final MappableFields<ProviderModel> fields = const {
    #id: _f$id,
    #nameAr: _f$nameAr,
    #nameEn: _f$nameEn,
    #descriptionAr: _f$descriptionAr,
    #descriptionEn: _f$descriptionEn,
    #avatar: _f$avatar,
    #iban: _f$iban,
    #commercialRegistrationNumber: _f$commercialRegistrationNumber,
    #status: _f$status,
    #phoneNumber: _f$phoneNumber,
    #authId: _f$authId,
    #isDeleted: _f$isDeleted,
    #isVerified: _f$isVerified,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #notificationId: _f$notificationId,
  };

  static ProviderModel _instantiate(DecodingData data) {
    return ProviderModel(
        id: data.dec(_f$id),
        nameAr: data.dec(_f$nameAr),
        nameEn: data.dec(_f$nameEn),
        descriptionAr: data.dec(_f$descriptionAr),
        descriptionEn: data.dec(_f$descriptionEn),
        avatar: data.dec(_f$avatar),
        iban: data.dec(_f$iban),
        commercialRegistrationNumber: data.dec(_f$commercialRegistrationNumber),
        status: data.dec(_f$status),
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

  static ProviderModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProviderModel>(map);
  }

  static ProviderModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProviderModel>(json);
  }
}

mixin ProviderModelMappable {
  String toJson() {
    return ProviderModelMapper.ensureInitialized()
        .encodeJson<ProviderModel>(this as ProviderModel);
  }

  Map<String, dynamic> toMap() {
    return ProviderModelMapper.ensureInitialized()
        .encodeMap<ProviderModel>(this as ProviderModel);
  }

  ProviderModelCopyWith<ProviderModel, ProviderModel, ProviderModel>
      get copyWith => _ProviderModelCopyWithImpl<ProviderModel, ProviderModel>(
          this as ProviderModel, $identity, $identity);
  @override
  String toString() {
    return ProviderModelMapper.ensureInitialized()
        .stringifyValue(this as ProviderModel);
  }

  @override
  bool operator ==(Object other) {
    return ProviderModelMapper.ensureInitialized()
        .equalsValue(this as ProviderModel, other);
  }

  @override
  int get hashCode {
    return ProviderModelMapper.ensureInitialized()
        .hashValue(this as ProviderModel);
  }
}

extension ProviderModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProviderModel, $Out> {
  ProviderModelCopyWith<$R, ProviderModel, $Out> get $asProviderModel =>
      $base.as((v, t, t2) => _ProviderModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ProviderModelCopyWith<$R, $In extends ProviderModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? nameAr,
      String? nameEn,
      String? descriptionAr,
      String? descriptionEn,
      String? avatar,
      String? iban,
      String? commercialRegistrationNumber,
      EnumUserStatus? status,
      String? phoneNumber,
      String? authId,
      bool? isDeleted,
      bool? isVerified,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? notificationId});
  ProviderModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProviderModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProviderModel, $Out>
    implements ProviderModelCopyWith<$R, ProviderModel, $Out> {
  _ProviderModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProviderModel> $mapper =
      ProviderModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? nameAr = $none,
          String? nameEn,
          Object? descriptionAr = $none,
          Object? descriptionEn = $none,
          Object? avatar = $none,
          Object? iban = $none,
          Object? commercialRegistrationNumber = $none,
          EnumUserStatus? status,
          String? phoneNumber,
          Object? authId = $none,
          bool? isDeleted,
          bool? isVerified,
          Object? createdAt = $none,
          Object? updatedAt = $none,
          Object? notificationId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (nameAr != $none) #nameAr: nameAr,
        if (nameEn != null) #nameEn: nameEn,
        if (descriptionAr != $none) #descriptionAr: descriptionAr,
        if (descriptionEn != $none) #descriptionEn: descriptionEn,
        if (avatar != $none) #avatar: avatar,
        if (iban != $none) #iban: iban,
        if (commercialRegistrationNumber != $none)
          #commercialRegistrationNumber: commercialRegistrationNumber,
        if (status != null) #status: status,
        if (phoneNumber != null) #phoneNumber: phoneNumber,
        if (authId != $none) #authId: authId,
        if (isDeleted != null) #isDeleted: isDeleted,
        if (isVerified != null) #isVerified: isVerified,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (notificationId != $none) #notificationId: notificationId
      }));
  @override
  ProviderModel $make(CopyWithData data) => ProviderModel(
      id: data.get(#id, or: $value.id),
      nameAr: data.get(#nameAr, or: $value.nameAr),
      nameEn: data.get(#nameEn, or: $value.nameEn),
      descriptionAr: data.get(#descriptionAr, or: $value.descriptionAr),
      descriptionEn: data.get(#descriptionEn, or: $value.descriptionEn),
      avatar: data.get(#avatar, or: $value.avatar),
      iban: data.get(#iban, or: $value.iban),
      commercialRegistrationNumber: data.get(#commercialRegistrationNumber,
          or: $value.commercialRegistrationNumber),
      status: data.get(#status, or: $value.status),
      phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
      authId: data.get(#authId, or: $value.authId),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted),
      isVerified: data.get(#isVerified, or: $value.isVerified),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      notificationId: data.get(#notificationId, or: $value.notificationId));

  @override
  ProviderModelCopyWith<$R2, ProviderModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProviderModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
