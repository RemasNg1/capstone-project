// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'service_provided_model.dart';

class ServiceProvidedModelMapper extends ClassMapperBase<ServiceProvidedModel> {
  ServiceProvidedModelMapper._();

  static ServiceProvidedModelMapper? _instance;
  static ServiceProvidedModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServiceProvidedModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ServiceProvidedModel';

  static int? _$id(ServiceProvidedModel v) => v.id;
  static const Field<ServiceProvidedModel, int> _f$id =
      Field('id', _$id, opt: true);
  static int? _$providerId(ServiceProvidedModel v) => v.providerId;
  static const Field<ServiceProvidedModel, int> _f$providerId =
      Field('providerId', _$providerId, key: r'provider_id', opt: true);
  static int? _$serviceId(ServiceProvidedModel v) => v.serviceId;
  static const Field<ServiceProvidedModel, int> _f$serviceId =
      Field('serviceId', _$serviceId, key: r'service_id', opt: true);
  static String? _$titleAr(ServiceProvidedModel v) => v.titleAr;
  static const Field<ServiceProvidedModel, String> _f$titleAr =
      Field('titleAr', _$titleAr, key: r'title_ar', opt: true);
  static String? _$titleEn(ServiceProvidedModel v) => v.titleEn;
  static const Field<ServiceProvidedModel, String> _f$titleEn =
      Field('titleEn', _$titleEn, key: r'title_en', opt: true);
  static String? _$descriptionAr(ServiceProvidedModel v) => v.descriptionAr;
  static const Field<ServiceProvidedModel, String> _f$descriptionAr = Field(
      'descriptionAr', _$descriptionAr,
      key: r'description_ar', opt: true);
  static String? _$descriptionEn(ServiceProvidedModel v) => v.descriptionEn;
  static const Field<ServiceProvidedModel, String> _f$descriptionEn = Field(
      'descriptionEn', _$descriptionEn,
      key: r'description_en', opt: true);
  static int? _$packageId(ServiceProvidedModel v) => v.packageId;
  static const Field<ServiceProvidedModel, int> _f$packageId =
      Field('packageId', _$packageId, key: r'package_id', opt: true);
  static double? _$price(ServiceProvidedModel v) => v.price;
  static const Field<ServiceProvidedModel, double> _f$price =
      Field('price', _$price, opt: true);

  @override
  final MappableFields<ServiceProvidedModel> fields = const {
    #id: _f$id,
    #providerId: _f$providerId,
    #serviceId: _f$serviceId,
    #titleAr: _f$titleAr,
    #titleEn: _f$titleEn,
    #descriptionAr: _f$descriptionAr,
    #descriptionEn: _f$descriptionEn,
    #packageId: _f$packageId,
    #price: _f$price,
  };

  static ServiceProvidedModel _instantiate(DecodingData data) {
    return ServiceProvidedModel(
        id: data.dec(_f$id),
        providerId: data.dec(_f$providerId),
        serviceId: data.dec(_f$serviceId),
        titleAr: data.dec(_f$titleAr),
        titleEn: data.dec(_f$titleEn),
        descriptionAr: data.dec(_f$descriptionAr),
        descriptionEn: data.dec(_f$descriptionEn),
        packageId: data.dec(_f$packageId),
        price: data.dec(_f$price));
  }

  @override
  final Function instantiate = _instantiate;

  static ServiceProvidedModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServiceProvidedModel>(map);
  }

  static ServiceProvidedModel fromJson(String json) {
    return ensureInitialized().decodeJson<ServiceProvidedModel>(json);
  }
}

mixin ServiceProvidedModelMappable {
  String toJson() {
    return ServiceProvidedModelMapper.ensureInitialized()
        .encodeJson<ServiceProvidedModel>(this as ServiceProvidedModel);
  }

  Map<String, dynamic> toMap() {
    return ServiceProvidedModelMapper.ensureInitialized()
        .encodeMap<ServiceProvidedModel>(this as ServiceProvidedModel);
  }

  ServiceProvidedModelCopyWith<ServiceProvidedModel, ServiceProvidedModel,
      ServiceProvidedModel> get copyWith => _ServiceProvidedModelCopyWithImpl<
          ServiceProvidedModel, ServiceProvidedModel>(
      this as ServiceProvidedModel, $identity, $identity);
  @override
  String toString() {
    return ServiceProvidedModelMapper.ensureInitialized()
        .stringifyValue(this as ServiceProvidedModel);
  }

  @override
  bool operator ==(Object other) {
    return ServiceProvidedModelMapper.ensureInitialized()
        .equalsValue(this as ServiceProvidedModel, other);
  }

  @override
  int get hashCode {
    return ServiceProvidedModelMapper.ensureInitialized()
        .hashValue(this as ServiceProvidedModel);
  }
}

extension ServiceProvidedModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServiceProvidedModel, $Out> {
  ServiceProvidedModelCopyWith<$R, ServiceProvidedModel, $Out>
      get $asServiceProvidedModel => $base.as(
          (v, t, t2) => _ServiceProvidedModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ServiceProvidedModelCopyWith<
    $R,
    $In extends ServiceProvidedModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      int? providerId,
      int? serviceId,
      String? titleAr,
      String? titleEn,
      String? descriptionAr,
      String? descriptionEn,
      int? packageId,
      double? price});
  ServiceProvidedModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ServiceProvidedModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServiceProvidedModel, $Out>
    implements ServiceProvidedModelCopyWith<$R, ServiceProvidedModel, $Out> {
  _ServiceProvidedModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServiceProvidedModel> $mapper =
      ServiceProvidedModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? providerId = $none,
          Object? serviceId = $none,
          Object? titleAr = $none,
          Object? titleEn = $none,
          Object? descriptionAr = $none,
          Object? descriptionEn = $none,
          Object? packageId = $none,
          Object? price = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (providerId != $none) #providerId: providerId,
        if (serviceId != $none) #serviceId: serviceId,
        if (titleAr != $none) #titleAr: titleAr,
        if (titleEn != $none) #titleEn: titleEn,
        if (descriptionAr != $none) #descriptionAr: descriptionAr,
        if (descriptionEn != $none) #descriptionEn: descriptionEn,
        if (packageId != $none) #packageId: packageId,
        if (price != $none) #price: price
      }));
  @override
  ServiceProvidedModel $make(CopyWithData data) => ServiceProvidedModel(
      id: data.get(#id, or: $value.id),
      providerId: data.get(#providerId, or: $value.providerId),
      serviceId: data.get(#serviceId, or: $value.serviceId),
      titleAr: data.get(#titleAr, or: $value.titleAr),
      titleEn: data.get(#titleEn, or: $value.titleEn),
      descriptionAr: data.get(#descriptionAr, or: $value.descriptionAr),
      descriptionEn: data.get(#descriptionEn, or: $value.descriptionEn),
      packageId: data.get(#packageId, or: $value.packageId),
      price: data.get(#price, or: $value.price));

  @override
  ServiceProvidedModelCopyWith<$R2, ServiceProvidedModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ServiceProvidedModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
