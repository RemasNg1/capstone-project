// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'service_image_model.dart';

class ServiceImageModelMapper extends ClassMapperBase<ServiceImageModel> {
  ServiceImageModelMapper._();

  static ServiceImageModelMapper? _instance;
  static ServiceImageModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServiceImageModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ServiceImageModel';

  static int _$id(ServiceImageModel v) => v.id;
  static const Field<ServiceImageModel, int> _f$id = Field('id', _$id);
  static int? _$servicProvidedId(ServiceImageModel v) => v.servicProvidedId;
  static const Field<ServiceImageModel, int> _f$servicProvidedId = Field(
      'servicProvidedId', _$servicProvidedId,
      key: r'servic_provided_id', opt: true);
  static String? _$imageUrl(ServiceImageModel v) => v.imageUrl;
  static const Field<ServiceImageModel, String> _f$imageUrl =
      Field('imageUrl', _$imageUrl, key: r'image_url', opt: true);

  @override
  final MappableFields<ServiceImageModel> fields = const {
    #id: _f$id,
    #servicProvidedId: _f$servicProvidedId,
    #imageUrl: _f$imageUrl,
  };

  static ServiceImageModel _instantiate(DecodingData data) {
    return ServiceImageModel(
        id: data.dec(_f$id),
        servicProvidedId: data.dec(_f$servicProvidedId),
        imageUrl: data.dec(_f$imageUrl));
  }

  @override
  final Function instantiate = _instantiate;

  static ServiceImageModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServiceImageModel>(map);
  }

  static ServiceImageModel fromJson(String json) {
    return ensureInitialized().decodeJson<ServiceImageModel>(json);
  }
}

mixin ServiceImageModelMappable {
  String toJson() {
    return ServiceImageModelMapper.ensureInitialized()
        .encodeJson<ServiceImageModel>(this as ServiceImageModel);
  }

  Map<String, dynamic> toMap() {
    return ServiceImageModelMapper.ensureInitialized()
        .encodeMap<ServiceImageModel>(this as ServiceImageModel);
  }

  ServiceImageModelCopyWith<ServiceImageModel, ServiceImageModel,
          ServiceImageModel>
      get copyWith =>
          _ServiceImageModelCopyWithImpl<ServiceImageModel, ServiceImageModel>(
              this as ServiceImageModel, $identity, $identity);
  @override
  String toString() {
    return ServiceImageModelMapper.ensureInitialized()
        .stringifyValue(this as ServiceImageModel);
  }

  @override
  bool operator ==(Object other) {
    return ServiceImageModelMapper.ensureInitialized()
        .equalsValue(this as ServiceImageModel, other);
  }

  @override
  int get hashCode {
    return ServiceImageModelMapper.ensureInitialized()
        .hashValue(this as ServiceImageModel);
  }
}

extension ServiceImageModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServiceImageModel, $Out> {
  ServiceImageModelCopyWith<$R, ServiceImageModel, $Out>
      get $asServiceImageModel => $base
          .as((v, t, t2) => _ServiceImageModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ServiceImageModelCopyWith<$R, $In extends ServiceImageModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, int? servicProvidedId, String? imageUrl});
  ServiceImageModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ServiceImageModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServiceImageModel, $Out>
    implements ServiceImageModelCopyWith<$R, ServiceImageModel, $Out> {
  _ServiceImageModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServiceImageModel> $mapper =
      ServiceImageModelMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          Object? servicProvidedId = $none,
          Object? imageUrl = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (servicProvidedId != $none) #servicProvidedId: servicProvidedId,
        if (imageUrl != $none) #imageUrl: imageUrl
      }));
  @override
  ServiceImageModel $make(CopyWithData data) => ServiceImageModel(
      id: data.get(#id, or: $value.id),
      servicProvidedId:
          data.get(#servicProvidedId, or: $value.servicProvidedId),
      imageUrl: data.get(#imageUrl, or: $value.imageUrl));

  @override
  ServiceImageModelCopyWith<$R2, ServiceImageModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ServiceImageModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
