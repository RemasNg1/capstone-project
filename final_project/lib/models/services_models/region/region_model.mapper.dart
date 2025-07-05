// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'region_model.dart';

class RegionModelMapper extends ClassMapperBase<RegionModel> {
  RegionModelMapper._();

  static RegionModelMapper? _instance;
  static RegionModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RegionModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RegionModel';

  static int? _$id(RegionModel v) => v.id;
  static const Field<RegionModel, int> _f$id = Field('id', _$id, opt: true);
  static String? _$nameAr(RegionModel v) => v.nameAr;
  static const Field<RegionModel, String> _f$nameAr = Field(
    'nameAr',
    _$nameAr,
    key: r'name_ar',
    opt: true,
  );
  static String? _$nameEn(RegionModel v) => v.nameEn;
  static const Field<RegionModel, String> _f$nameEn = Field(
    'nameEn',
    _$nameEn,
    key: r'name_en',
    opt: true,
  );

  @override
  final MappableFields<RegionModel> fields = const {
    #id: _f$id,
    #nameAr: _f$nameAr,
    #nameEn: _f$nameEn,
  };

  static RegionModel _instantiate(DecodingData data) {
    return RegionModel(
      id: data.dec(_f$id),
      nameAr: data.dec(_f$nameAr),
      nameEn: data.dec(_f$nameEn),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RegionModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RegionModel>(map);
  }

  static RegionModel fromJson(String json) {
    return ensureInitialized().decodeJson<RegionModel>(json);
  }
}

mixin RegionModelMappable {
  String toJson() {
    return RegionModelMapper.ensureInitialized().encodeJson<RegionModel>(
      this as RegionModel,
    );
  }

  Map<String, dynamic> toMap() {
    return RegionModelMapper.ensureInitialized().encodeMap<RegionModel>(
      this as RegionModel,
    );
  }

  RegionModelCopyWith<RegionModel, RegionModel, RegionModel> get copyWith =>
      _RegionModelCopyWithImpl<RegionModel, RegionModel>(
        this as RegionModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RegionModelMapper.ensureInitialized().stringifyValue(
      this as RegionModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return RegionModelMapper.ensureInitialized().equalsValue(
      this as RegionModel,
      other,
    );
  }

  @override
  int get hashCode {
    return RegionModelMapper.ensureInitialized().hashValue(this as RegionModel);
  }
}

extension RegionModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RegionModel, $Out> {
  RegionModelCopyWith<$R, RegionModel, $Out> get $asRegionModel =>
      $base.as((v, t, t2) => _RegionModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RegionModelCopyWith<$R, $In extends RegionModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? nameAr, String? nameEn});
  RegionModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RegionModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RegionModel, $Out>
    implements RegionModelCopyWith<$R, RegionModel, $Out> {
  _RegionModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RegionModel> $mapper =
      RegionModelMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    Object? nameAr = $none,
    Object? nameEn = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (nameAr != $none) #nameAr: nameAr,
      if (nameEn != $none) #nameEn: nameEn,
    }),
  );
  @override
  RegionModel $make(CopyWithData data) => RegionModel(
    id: data.get(#id, or: $value.id),
    nameAr: data.get(#nameAr, or: $value.nameAr),
    nameEn: data.get(#nameEn, or: $value.nameEn),
  );

  @override
  RegionModelCopyWith<$R2, RegionModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RegionModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
