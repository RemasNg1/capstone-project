// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'favorite_service_model.dart';

class FavoriteServiceMapper extends ClassMapperBase<FavoriteService> {
  FavoriteServiceMapper._();

  static FavoriteServiceMapper? _instance;
  static FavoriteServiceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FavoriteServiceMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FavoriteService';

  static int _$id(FavoriteService v) => v.id;
  static const Field<FavoriteService, int> _f$id = Field('id', _$id);
  static int? _$serviceProvidedId(FavoriteService v) => v.serviceProvidedId;
  static const Field<FavoriteService, int> _f$serviceProvidedId = Field(
      'serviceProvidedId', _$serviceProvidedId,
      key: r'servic_provided_id', opt: true);
  static String? _$userAuthId(FavoriteService v) => v.userAuthId;
  static const Field<FavoriteService, String> _f$userAuthId =
      Field('userAuthId', _$userAuthId, key: r'user_auth_id', opt: true);

  @override
  final MappableFields<FavoriteService> fields = const {
    #id: _f$id,
    #serviceProvidedId: _f$serviceProvidedId,
    #userAuthId: _f$userAuthId,
  };

  static FavoriteService _instantiate(DecodingData data) {
    return FavoriteService(
        id: data.dec(_f$id),
        serviceProvidedId: data.dec(_f$serviceProvidedId),
        userAuthId: data.dec(_f$userAuthId));
  }

  @override
  final Function instantiate = _instantiate;

  static FavoriteService fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FavoriteService>(map);
  }

  static FavoriteService fromJson(String json) {
    return ensureInitialized().decodeJson<FavoriteService>(json);
  }
}

mixin FavoriteServiceMappable {
  String toJson() {
    return FavoriteServiceMapper.ensureInitialized()
        .encodeJson<FavoriteService>(this as FavoriteService);
  }

  Map<String, dynamic> toMap() {
    return FavoriteServiceMapper.ensureInitialized()
        .encodeMap<FavoriteService>(this as FavoriteService);
  }

  FavoriteServiceCopyWith<FavoriteService, FavoriteService, FavoriteService>
      get copyWith =>
          _FavoriteServiceCopyWithImpl<FavoriteService, FavoriteService>(
              this as FavoriteService, $identity, $identity);
  @override
  String toString() {
    return FavoriteServiceMapper.ensureInitialized()
        .stringifyValue(this as FavoriteService);
  }

  @override
  bool operator ==(Object other) {
    return FavoriteServiceMapper.ensureInitialized()
        .equalsValue(this as FavoriteService, other);
  }

  @override
  int get hashCode {
    return FavoriteServiceMapper.ensureInitialized()
        .hashValue(this as FavoriteService);
  }
}

extension FavoriteServiceValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FavoriteService, $Out> {
  FavoriteServiceCopyWith<$R, FavoriteService, $Out> get $asFavoriteService =>
      $base.as((v, t, t2) => _FavoriteServiceCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FavoriteServiceCopyWith<$R, $In extends FavoriteService, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, int? serviceProvidedId, String? userAuthId});
  FavoriteServiceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FavoriteServiceCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FavoriteService, $Out>
    implements FavoriteServiceCopyWith<$R, FavoriteService, $Out> {
  _FavoriteServiceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FavoriteService> $mapper =
      FavoriteServiceMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          Object? serviceProvidedId = $none,
          Object? userAuthId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (serviceProvidedId != $none) #serviceProvidedId: serviceProvidedId,
        if (userAuthId != $none) #userAuthId: userAuthId
      }));
  @override
  FavoriteService $make(CopyWithData data) => FavoriteService(
      id: data.get(#id, or: $value.id),
      serviceProvidedId:
          data.get(#serviceProvidedId, or: $value.serviceProvidedId),
      userAuthId: data.get(#userAuthId, or: $value.userAuthId));

  @override
  FavoriteServiceCopyWith<$R2, FavoriteService, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FavoriteServiceCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
