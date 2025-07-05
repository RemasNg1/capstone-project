// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'service_location_model.dart';

class ServiceLocationModelMapper extends ClassMapperBase<ServiceLocationModel> {
  ServiceLocationModelMapper._();

  static ServiceLocationModelMapper? _instance;
  static ServiceLocationModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServiceLocationModelMapper._());
      DisabledDateModelMapper.ensureInitialized();
      RegionModelMapper.ensureInitialized();
      CityModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ServiceLocationModel';

  static int? _$id(ServiceLocationModel v) => v.id;
  static const Field<ServiceLocationModel, int> _f$id =
      Field('id', _$id, opt: true);
  static List<DisabledDateModel>? _$disabledDates(ServiceLocationModel v) =>
      v.disabledDates;
  static const Field<ServiceLocationModel, List<DisabledDateModel>>
      _f$disabledDates = Field('disabledDates', _$disabledDates,
          key: r'disabled_dates', opt: true);
  static RegionModel? _$region(ServiceLocationModel v) => v.region;
  static const Field<ServiceLocationModel, RegionModel> _f$region =
      Field('region', _$region, opt: true);
  static CityModel? _$city(ServiceLocationModel v) => v.city;
  static const Field<ServiceLocationModel, CityModel> _f$city =
      Field('city', _$city, opt: true);
  static double? _$latitude(ServiceLocationModel v) => v.latitude;
  static const Field<ServiceLocationModel, double> _f$latitude =
      Field('latitude', _$latitude, opt: true);
  static double? _$longitude(ServiceLocationModel v) => v.longitude;
  static const Field<ServiceLocationModel, double> _f$longitude =
      Field('longitude', _$longitude, opt: true);
  static int? _$serviceProvidedId(ServiceLocationModel v) =>
      v.serviceProvidedId;
  static const Field<ServiceLocationModel, int> _f$serviceProvidedId = Field(
      'serviceProvidedId', _$serviceProvidedId,
      key: r'service_provided_id', opt: true);

  @override
  final MappableFields<ServiceLocationModel> fields = const {
    #id: _f$id,
    #disabledDates: _f$disabledDates,
    #region: _f$region,
    #city: _f$city,
    #latitude: _f$latitude,
    #longitude: _f$longitude,
    #serviceProvidedId: _f$serviceProvidedId,
  };

  static ServiceLocationModel _instantiate(DecodingData data) {
    return ServiceLocationModel(
        id: data.dec(_f$id),
        disabledDates: data.dec(_f$disabledDates),
        region: data.dec(_f$region),
        city: data.dec(_f$city),
        latitude: data.dec(_f$latitude),
        longitude: data.dec(_f$longitude),
        serviceProvidedId: data.dec(_f$serviceProvidedId));
  }

  @override
  final Function instantiate = _instantiate;

  static ServiceLocationModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServiceLocationModel>(map);
  }

  static ServiceLocationModel fromJson(String json) {
    return ensureInitialized().decodeJson<ServiceLocationModel>(json);
  }
}

mixin ServiceLocationModelMappable {
  String toJson() {
    return ServiceLocationModelMapper.ensureInitialized()
        .encodeJson<ServiceLocationModel>(this as ServiceLocationModel);
  }

  Map<String, dynamic> toMap() {
    return ServiceLocationModelMapper.ensureInitialized()
        .encodeMap<ServiceLocationModel>(this as ServiceLocationModel);
  }

  ServiceLocationModelCopyWith<ServiceLocationModel, ServiceLocationModel,
      ServiceLocationModel> get copyWith => _ServiceLocationModelCopyWithImpl<
          ServiceLocationModel, ServiceLocationModel>(
      this as ServiceLocationModel, $identity, $identity);
  @override
  String toString() {
    return ServiceLocationModelMapper.ensureInitialized()
        .stringifyValue(this as ServiceLocationModel);
  }

  @override
  bool operator ==(Object other) {
    return ServiceLocationModelMapper.ensureInitialized()
        .equalsValue(this as ServiceLocationModel, other);
  }

  @override
  int get hashCode {
    return ServiceLocationModelMapper.ensureInitialized()
        .hashValue(this as ServiceLocationModel);
  }
}

extension ServiceLocationModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServiceLocationModel, $Out> {
  ServiceLocationModelCopyWith<$R, ServiceLocationModel, $Out>
      get $asServiceLocationModel => $base.as(
          (v, t, t2) => _ServiceLocationModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ServiceLocationModelCopyWith<
    $R,
    $In extends ServiceLocationModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, DisabledDateModel,
          DisabledDateModelCopyWith<$R, DisabledDateModel, DisabledDateModel>>?
      get disabledDates;
  RegionModelCopyWith<$R, RegionModel, RegionModel>? get region;
  CityModelCopyWith<$R, CityModel, CityModel>? get city;
  $R call(
      {int? id,
      List<DisabledDateModel>? disabledDates,
      RegionModel? region,
      CityModel? city,
      double? latitude,
      double? longitude,
      int? serviceProvidedId});
  ServiceLocationModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ServiceLocationModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServiceLocationModel, $Out>
    implements ServiceLocationModelCopyWith<$R, ServiceLocationModel, $Out> {
  _ServiceLocationModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServiceLocationModel> $mapper =
      ServiceLocationModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, DisabledDateModel,
          DisabledDateModelCopyWith<$R, DisabledDateModel, DisabledDateModel>>?
      get disabledDates => $value.disabledDates != null
          ? ListCopyWith($value.disabledDates!, (v, t) => v.copyWith.$chain(t),
              (v) => call(disabledDates: v))
          : null;
  @override
  RegionModelCopyWith<$R, RegionModel, RegionModel>? get region =>
      $value.region?.copyWith.$chain((v) => call(region: v));
  @override
  CityModelCopyWith<$R, CityModel, CityModel>? get city =>
      $value.city?.copyWith.$chain((v) => call(city: v));
  @override
  $R call(
          {Object? id = $none,
          Object? disabledDates = $none,
          Object? region = $none,
          Object? city = $none,
          Object? latitude = $none,
          Object? longitude = $none,
          Object? serviceProvidedId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (disabledDates != $none) #disabledDates: disabledDates,
        if (region != $none) #region: region,
        if (city != $none) #city: city,
        if (latitude != $none) #latitude: latitude,
        if (longitude != $none) #longitude: longitude,
        if (serviceProvidedId != $none) #serviceProvidedId: serviceProvidedId
      }));
  @override
  ServiceLocationModel $make(CopyWithData data) => ServiceLocationModel(
      id: data.get(#id, or: $value.id),
      disabledDates: data.get(#disabledDates, or: $value.disabledDates),
      region: data.get(#region, or: $value.region),
      city: data.get(#city, or: $value.city),
      latitude: data.get(#latitude, or: $value.latitude),
      longitude: data.get(#longitude, or: $value.longitude),
      serviceProvidedId:
          data.get(#serviceProvidedId, or: $value.serviceProvidedId));

  @override
  ServiceLocationModelCopyWith<$R2, ServiceLocationModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ServiceLocationModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
