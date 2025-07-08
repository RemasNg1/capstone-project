// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'service_model.dart';

class ServiceModelMapper extends ClassMapperBase<ServiceModel> {
  ServiceModelMapper._();

  static ServiceModelMapper? _instance;
  static ServiceModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServiceModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ServiceModel';

  static int? _$id(ServiceModel v) => v.id;
  static const Field<ServiceModel, int> _f$id = Field('id', _$id, opt: true);
  static String? _$nameAr(ServiceModel v) => v.nameAr;
  static const Field<ServiceModel, String> _f$nameAr =
      Field('nameAr', _$nameAr, key: r'name_ar', opt: true);
  static String? _$nameEn(ServiceModel v) => v.nameEn;
  static const Field<ServiceModel, String> _f$nameEn =
      Field('nameEn', _$nameEn, key: r'name_en', opt: true);
  static String? _$descriptionAr(ServiceModel v) => v.descriptionAr;
  static const Field<ServiceModel, String> _f$descriptionAr = Field(
      'descriptionAr', _$descriptionAr,
      key: r'description_ar', opt: true);
  static String? _$descriptionEn(ServiceModel v) => v.descriptionEn;
  static const Field<ServiceModel, String> _f$descriptionEn =
      Field('descriptionEn', _$descriptionEn, opt: true);
  static String? _$type(ServiceModel v) => v.type;
  static const Field<ServiceModel, String> _f$type =
      Field('type', _$type, opt: true);
  static String? _$typeAr(ServiceModel v) => v.typeAr;
  static const Field<ServiceModel, String> _f$typeAr =
      Field('typeAr', _$typeAr, key: r'type_ar', opt: true);
  static String? _$typeEn(ServiceModel v) => v.typeEn;
  static const Field<ServiceModel, String> _f$typeEn =
      Field('typeEn', _$typeEn, key: r'type_en', opt: true);
  static bool? _$isDeleted(ServiceModel v) => v.isDeleted;
  static const Field<ServiceModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, key: r'description_en', opt: true);

  @override
  final MappableFields<ServiceModel> fields = const {
    #id: _f$id,
    #nameAr: _f$nameAr,
    #nameEn: _f$nameEn,
    #descriptionAr: _f$descriptionAr,
    #descriptionEn: _f$descriptionEn,
    #type: _f$type,
    #typeAr: _f$typeAr,
    #typeEn: _f$typeEn,
    #isDeleted: _f$isDeleted,
  };

  static ServiceModel _instantiate(DecodingData data) {
    return ServiceModel(
        id: data.dec(_f$id),
        nameAr: data.dec(_f$nameAr),
        nameEn: data.dec(_f$nameEn),
        descriptionAr: data.dec(_f$descriptionAr),
        descriptionEn: data.dec(_f$descriptionEn),
        type: data.dec(_f$type),
        typeAr: data.dec(_f$typeAr),
        typeEn: data.dec(_f$typeEn),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static ServiceModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServiceModel>(map);
  }

  static ServiceModel fromJson(String json) {
    return ensureInitialized().decodeJson<ServiceModel>(json);
  }
}

mixin ServiceModelMappable {
  String toJson() {
    return ServiceModelMapper.ensureInitialized()
        .encodeJson<ServiceModel>(this as ServiceModel);
  }

  Map<String, dynamic> toMap() {
    return ServiceModelMapper.ensureInitialized()
        .encodeMap<ServiceModel>(this as ServiceModel);
  }

  ServiceModelCopyWith<ServiceModel, ServiceModel, ServiceModel> get copyWith =>
      _ServiceModelCopyWithImpl<ServiceModel, ServiceModel>(
          this as ServiceModel, $identity, $identity);
  @override
  String toString() {
    return ServiceModelMapper.ensureInitialized()
        .stringifyValue(this as ServiceModel);
  }

  @override
  bool operator ==(Object other) {
    return ServiceModelMapper.ensureInitialized()
        .equalsValue(this as ServiceModel, other);
  }

  @override
  int get hashCode {
    return ServiceModelMapper.ensureInitialized()
        .hashValue(this as ServiceModel);
  }
}

extension ServiceModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServiceModel, $Out> {
  ServiceModelCopyWith<$R, ServiceModel, $Out> get $asServiceModel =>
      $base.as((v, t, t2) => _ServiceModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ServiceModelCopyWith<$R, $In extends ServiceModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? nameAr,
      String? nameEn,
      String? descriptionAr,
      String? descriptionEn,
      String? type,
      String? typeAr,
      String? typeEn,
      bool? isDeleted});
  ServiceModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ServiceModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServiceModel, $Out>
    implements ServiceModelCopyWith<$R, ServiceModel, $Out> {
  _ServiceModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServiceModel> $mapper =
      ServiceModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? nameAr = $none,
          Object? nameEn = $none,
          Object? descriptionAr = $none,
          Object? descriptionEn = $none,
          Object? type = $none,
          Object? typeAr = $none,
          Object? typeEn = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (nameAr != $none) #nameAr: nameAr,
        if (nameEn != $none) #nameEn: nameEn,
        if (descriptionAr != $none) #descriptionAr: descriptionAr,
        if (descriptionEn != $none) #descriptionEn: descriptionEn,
        if (type != $none) #type: type,
        if (typeAr != $none) #typeAr: typeAr,
        if (typeEn != $none) #typeEn: typeEn,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  ServiceModel $make(CopyWithData data) => ServiceModel(
      id: data.get(#id, or: $value.id),
      nameAr: data.get(#nameAr, or: $value.nameAr),
      nameEn: data.get(#nameEn, or: $value.nameEn),
      descriptionAr: data.get(#descriptionAr, or: $value.descriptionAr),
      descriptionEn: data.get(#descriptionEn, or: $value.descriptionEn),
      type: data.get(#type, or: $value.type),
      typeAr: data.get(#typeAr, or: $value.typeAr),
      typeEn: data.get(#typeEn, or: $value.typeEn),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  ServiceModelCopyWith<$R2, ServiceModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ServiceModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
