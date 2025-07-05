// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'service_request_model.dart';

class ServiceRequestModelMapper extends ClassMapperBase<ServiceRequestModel> {
  ServiceRequestModelMapper._();

  static ServiceRequestModelMapper? _instance;
  static ServiceRequestModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServiceRequestModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ServiceRequestModel';

  static int? _$id(ServiceRequestModel v) => v.id;
  static const Field<ServiceRequestModel, int> _f$id =
      Field('id', _$id, opt: true);
  static String? _$userAuthId(ServiceRequestModel v) => v.userAuthId;
  static const Field<ServiceRequestModel, String> _f$userAuthId =
      Field('userAuthId', _$userAuthId, key: r'user_auth_id', opt: true);
  static DateTime? _$date(ServiceRequestModel v) => v.date;
  static const Field<ServiceRequestModel, DateTime> _f$date =
      Field('date', _$date, opt: true);
  static int? _$serviceProvidedId(ServiceRequestModel v) => v.serviceProvidedId;
  static const Field<ServiceRequestModel, int> _f$serviceProvidedId = Field(
      'serviceProvidedId', _$serviceProvidedId,
      key: r'service_provided_id', opt: true);
  static int? _$serviceLocationId(ServiceRequestModel v) => v.serviceLocationId;
  static const Field<ServiceRequestModel, int> _f$serviceLocationId = Field(
      'serviceLocationId', _$serviceLocationId,
      key: r'service_location_id', opt: true);
  static String? _$status(ServiceRequestModel v) => v.status;
  static const Field<ServiceRequestModel, String> _f$status =
      Field('status', _$status, opt: true);

  @override
  final MappableFields<ServiceRequestModel> fields = const {
    #id: _f$id,
    #userAuthId: _f$userAuthId,
    #date: _f$date,
    #serviceProvidedId: _f$serviceProvidedId,
    #serviceLocationId: _f$serviceLocationId,
    #status: _f$status,
  };

  static ServiceRequestModel _instantiate(DecodingData data) {
    return ServiceRequestModel(
        id: data.dec(_f$id),
        userAuthId: data.dec(_f$userAuthId),
        date: data.dec(_f$date),
        serviceProvidedId: data.dec(_f$serviceProvidedId),
        serviceLocationId: data.dec(_f$serviceLocationId),
        status: data.dec(_f$status));
  }

  @override
  final Function instantiate = _instantiate;

  static ServiceRequestModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServiceRequestModel>(map);
  }

  static ServiceRequestModel fromJson(String json) {
    return ensureInitialized().decodeJson<ServiceRequestModel>(json);
  }
}

mixin ServiceRequestModelMappable {
  String toJson() {
    return ServiceRequestModelMapper.ensureInitialized()
        .encodeJson<ServiceRequestModel>(this as ServiceRequestModel);
  }

  Map<String, dynamic> toMap() {
    return ServiceRequestModelMapper.ensureInitialized()
        .encodeMap<ServiceRequestModel>(this as ServiceRequestModel);
  }

  ServiceRequestModelCopyWith<ServiceRequestModel, ServiceRequestModel,
      ServiceRequestModel> get copyWith => _ServiceRequestModelCopyWithImpl<
          ServiceRequestModel, ServiceRequestModel>(
      this as ServiceRequestModel, $identity, $identity);
  @override
  String toString() {
    return ServiceRequestModelMapper.ensureInitialized()
        .stringifyValue(this as ServiceRequestModel);
  }

  @override
  bool operator ==(Object other) {
    return ServiceRequestModelMapper.ensureInitialized()
        .equalsValue(this as ServiceRequestModel, other);
  }

  @override
  int get hashCode {
    return ServiceRequestModelMapper.ensureInitialized()
        .hashValue(this as ServiceRequestModel);
  }
}

extension ServiceRequestModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServiceRequestModel, $Out> {
  ServiceRequestModelCopyWith<$R, ServiceRequestModel, $Out>
      get $asServiceRequestModel => $base.as(
          (v, t, t2) => _ServiceRequestModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ServiceRequestModelCopyWith<$R, $In extends ServiceRequestModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? userAuthId,
      DateTime? date,
      int? serviceProvidedId,
      int? serviceLocationId,
      String? status});
  ServiceRequestModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ServiceRequestModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServiceRequestModel, $Out>
    implements ServiceRequestModelCopyWith<$R, ServiceRequestModel, $Out> {
  _ServiceRequestModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServiceRequestModel> $mapper =
      ServiceRequestModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? userAuthId = $none,
          Object? date = $none,
          Object? serviceProvidedId = $none,
          Object? serviceLocationId = $none,
          Object? status = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (userAuthId != $none) #userAuthId: userAuthId,
        if (date != $none) #date: date,
        if (serviceProvidedId != $none) #serviceProvidedId: serviceProvidedId,
        if (serviceLocationId != $none) #serviceLocationId: serviceLocationId,
        if (status != $none) #status: status
      }));
  @override
  ServiceRequestModel $make(CopyWithData data) => ServiceRequestModel(
      id: data.get(#id, or: $value.id),
      userAuthId: data.get(#userAuthId, or: $value.userAuthId),
      date: data.get(#date, or: $value.date),
      serviceProvidedId:
          data.get(#serviceProvidedId, or: $value.serviceProvidedId),
      serviceLocationId:
          data.get(#serviceLocationId, or: $value.serviceLocationId),
      status: data.get(#status, or: $value.status));

  @override
  ServiceRequestModelCopyWith<$R2, ServiceRequestModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ServiceRequestModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
