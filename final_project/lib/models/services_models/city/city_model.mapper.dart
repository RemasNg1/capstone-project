// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'city_model.dart';

class CityModelMapper extends ClassMapperBase<CityModel> {
  CityModelMapper._();

  static CityModelMapper? _instance;
  static CityModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CityModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CityModel';

  static int? _$id(CityModel v) => v.id;
  static const Field<CityModel, int> _f$id = Field('id', _$id, opt: true);
  static String? _$nameAr(CityModel v) => v.nameAr;
  static const Field<CityModel, String> _f$nameAr = Field(
    'nameAr',
    _$nameAr,
    key: r'name_ar',
    opt: true,
  );
  static String? _$nameEn(CityModel v) => v.nameEn;
  static const Field<CityModel, String> _f$nameEn = Field(
    'nameEn',
    _$nameEn,
    key: r'name_en',
    opt: true,
  );
  static int? _$regionId(CityModel v) => v.regionId;
  static const Field<CityModel, int> _f$regionId = Field(
    'regionId',
    _$regionId,
    key: r'region_id',
    opt: true,
  );

  @override
  final MappableFields<CityModel> fields = const {
    #id: _f$id,
    #nameAr: _f$nameAr,
    #nameEn: _f$nameEn,
    #regionId: _f$regionId,
  };

  static CityModel _instantiate(DecodingData data) {
    return CityModel(
      id: data.dec(_f$id),
      nameAr: data.dec(_f$nameAr),
      nameEn: data.dec(_f$nameEn),
      regionId: data.dec(_f$regionId),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CityModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CityModel>(map);
  }

  static CityModel fromJson(String json) {
    return ensureInitialized().decodeJson<CityModel>(json);
  }
}

mixin CityModelMappable {
  String toJson() {
    return CityModelMapper.ensureInitialized().encodeJson<CityModel>(
      this as CityModel,
    );
  }

  Map<String, dynamic> toMap() {
    return CityModelMapper.ensureInitialized().encodeMap<CityModel>(
      this as CityModel,
    );
  }

  CityModelCopyWith<CityModel, CityModel, CityModel> get copyWith =>
      _CityModelCopyWithImpl<CityModel, CityModel>(
        this as CityModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CityModelMapper.ensureInitialized().stringifyValue(
      this as CityModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return CityModelMapper.ensureInitialized().equalsValue(
      this as CityModel,
      other,
    );
  }

  @override
  int get hashCode {
    return CityModelMapper.ensureInitialized().hashValue(this as CityModel);
  }
}

extension CityModelValueCopy<$R, $Out> on ObjectCopyWith<$R, CityModel, $Out> {
  CityModelCopyWith<$R, CityModel, $Out> get $asCityModel =>
      $base.as((v, t, t2) => _CityModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CityModelCopyWith<$R, $In extends CityModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? nameAr, String? nameEn, int? regionId});
  CityModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CityModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CityModel, $Out>
    implements CityModelCopyWith<$R, CityModel, $Out> {
  _CityModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CityModel> $mapper =
      CityModelMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    Object? nameAr = $none,
    Object? nameEn = $none,
    Object? regionId = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (nameAr != $none) #nameAr: nameAr,
      if (nameEn != $none) #nameEn: nameEn,
      if (regionId != $none) #regionId: regionId,
    }),
  );
  @override
  CityModel $make(CopyWithData data) => CityModel(
    id: data.get(#id, or: $value.id),
    nameAr: data.get(#nameAr, or: $value.nameAr),
    nameEn: data.get(#nameEn, or: $value.nameEn),
    regionId: data.get(#regionId, or: $value.regionId),
  );

  @override
  CityModelCopyWith<$R2, CityModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CityModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
