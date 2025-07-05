// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'services_provided_model.dart';

class ServicesProvidedModelMapper
    extends ClassMapperBase<ServicesProvidedModel> {
  ServicesProvidedModelMapper._();

  static ServicesProvidedModelMapper? _instance;
  static ServicesProvidedModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServicesProvidedModelMapper._());
      ServiceModelMapper.ensureInitialized();
      ProviderModelMapper.ensureInitialized();
      ServiceImageModelMapper.ensureInitialized();
      ServiceRatingModelMapper.ensureInitialized();
      ServiceRequestModelMapper.ensureInitialized();
      ServiceLocationModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ServicesProvidedModel';

  static int? _$id(ServicesProvidedModel v) => v.id;
  static const Field<ServicesProvidedModel, int> _f$id =
      Field('id', _$id, opt: true);
  static String? _$titleAr(ServicesProvidedModel v) => v.titleAr;
  static const Field<ServicesProvidedModel, String> _f$titleAr =
      Field('titleAr', _$titleAr, key: r'title_ar', opt: true);
  static String? _$descriptionAr(ServicesProvidedModel v) => v.descriptionAr;
  static const Field<ServicesProvidedModel, String> _f$descriptionAr = Field(
      'descriptionAr', _$descriptionAr,
      key: r'description_ar', opt: true);
  static double? _$price(ServicesProvidedModel v) => v.price;
  static const Field<ServicesProvidedModel, double> _f$price =
      Field('price', _$price, opt: true);
  static ServiceModel? _$services(ServicesProvidedModel v) => v.services;
  static const Field<ServicesProvidedModel, ServiceModel> _f$services =
      Field('services', _$services, opt: true);
  static ProviderModel? _$provider(ServicesProvidedModel v) => v.provider;
  static const Field<ServicesProvidedModel, ProviderModel> _f$provider =
      Field('provider', _$provider, opt: true);
  static List<ServiceImageModel>? _$servicImage(ServicesProvidedModel v) =>
      v.servicImage;
  static const Field<ServicesProvidedModel, List<ServiceImageModel>>
      _f$servicImage =
      Field('servicImage', _$servicImage, key: r'servic_image', opt: true);
  static List<ServiceRatingModel>? _$ratings(ServicesProvidedModel v) =>
      v.ratings;
  static const Field<ServicesProvidedModel, List<ServiceRatingModel>>
      _f$ratings =
      Field('ratings', _$ratings, key: r'service_ratings', opt: true);
  static List<ServiceRequestModel>? _$serviceRequests(
          ServicesProvidedModel v) =>
      v.serviceRequests;
  static const Field<ServicesProvidedModel, List<ServiceRequestModel>>
      _f$serviceRequests = Field('serviceRequests', _$serviceRequests,
          key: r'service_requests', opt: true);
  static List<ServiceLocationModel>? _$locations(ServicesProvidedModel v) =>
      v.locations;
  static const Field<ServicesProvidedModel, List<ServiceLocationModel>>
      _f$locations =
      Field('locations', _$locations, key: r'service_locations', opt: true);

  @override
  final MappableFields<ServicesProvidedModel> fields = const {
    #id: _f$id,
    #titleAr: _f$titleAr,
    #descriptionAr: _f$descriptionAr,
    #price: _f$price,
    #services: _f$services,
    #provider: _f$provider,
    #servicImage: _f$servicImage,
    #ratings: _f$ratings,
    #serviceRequests: _f$serviceRequests,
    #locations: _f$locations,
  };

  static ServicesProvidedModel _instantiate(DecodingData data) {
    return ServicesProvidedModel(
        id: data.dec(_f$id),
        titleAr: data.dec(_f$titleAr),
        descriptionAr: data.dec(_f$descriptionAr),
        price: data.dec(_f$price),
        services: data.dec(_f$services),
        provider: data.dec(_f$provider),
        servicImage: data.dec(_f$servicImage),
        ratings: data.dec(_f$ratings),
        serviceRequests: data.dec(_f$serviceRequests),
        locations: data.dec(_f$locations));
  }

  @override
  final Function instantiate = _instantiate;

  static ServicesProvidedModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServicesProvidedModel>(map);
  }

  static ServicesProvidedModel fromJson(String json) {
    return ensureInitialized().decodeJson<ServicesProvidedModel>(json);
  }
}

mixin ServicesProvidedModelMappable {
  String toJson() {
    return ServicesProvidedModelMapper.ensureInitialized()
        .encodeJson<ServicesProvidedModel>(this as ServicesProvidedModel);
  }

  Map<String, dynamic> toMap() {
    return ServicesProvidedModelMapper.ensureInitialized()
        .encodeMap<ServicesProvidedModel>(this as ServicesProvidedModel);
  }

  ServicesProvidedModelCopyWith<ServicesProvidedModel, ServicesProvidedModel,
      ServicesProvidedModel> get copyWith => _ServicesProvidedModelCopyWithImpl<
          ServicesProvidedModel, ServicesProvidedModel>(
      this as ServicesProvidedModel, $identity, $identity);
  @override
  String toString() {
    return ServicesProvidedModelMapper.ensureInitialized()
        .stringifyValue(this as ServicesProvidedModel);
  }

  @override
  bool operator ==(Object other) {
    return ServicesProvidedModelMapper.ensureInitialized()
        .equalsValue(this as ServicesProvidedModel, other);
  }

  @override
  int get hashCode {
    return ServicesProvidedModelMapper.ensureInitialized()
        .hashValue(this as ServicesProvidedModel);
  }
}

extension ServicesProvidedModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServicesProvidedModel, $Out> {
  ServicesProvidedModelCopyWith<$R, ServicesProvidedModel, $Out>
      get $asServicesProvidedModel => $base.as(
          (v, t, t2) => _ServicesProvidedModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ServicesProvidedModelCopyWith<
    $R,
    $In extends ServicesProvidedModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ServiceModelCopyWith<$R, ServiceModel, ServiceModel>? get services;
  ProviderModelCopyWith<$R, ProviderModel, ProviderModel>? get provider;
  ListCopyWith<$R, ServiceImageModel,
          ServiceImageModelCopyWith<$R, ServiceImageModel, ServiceImageModel>>?
      get servicImage;
  ListCopyWith<
      $R,
      ServiceRatingModel,
      ServiceRatingModelCopyWith<$R, ServiceRatingModel,
          ServiceRatingModel>>? get ratings;
  ListCopyWith<
      $R,
      ServiceRequestModel,
      ServiceRequestModelCopyWith<$R, ServiceRequestModel,
          ServiceRequestModel>>? get serviceRequests;
  ListCopyWith<
      $R,
      ServiceLocationModel,
      ServiceLocationModelCopyWith<$R, ServiceLocationModel,
          ServiceLocationModel>>? get locations;
  $R call(
      {int? id,
      String? titleAr,
      String? descriptionAr,
      double? price,
      ServiceModel? services,
      ProviderModel? provider,
      List<ServiceImageModel>? servicImage,
      List<ServiceRatingModel>? ratings,
      List<ServiceRequestModel>? serviceRequests,
      List<ServiceLocationModel>? locations});
  ServicesProvidedModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ServicesProvidedModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServicesProvidedModel, $Out>
    implements ServicesProvidedModelCopyWith<$R, ServicesProvidedModel, $Out> {
  _ServicesProvidedModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServicesProvidedModel> $mapper =
      ServicesProvidedModelMapper.ensureInitialized();
  @override
  ServiceModelCopyWith<$R, ServiceModel, ServiceModel>? get services =>
      $value.services?.copyWith.$chain((v) => call(services: v));
  @override
  ProviderModelCopyWith<$R, ProviderModel, ProviderModel>? get provider =>
      $value.provider?.copyWith.$chain((v) => call(provider: v));
  @override
  ListCopyWith<$R, ServiceImageModel,
          ServiceImageModelCopyWith<$R, ServiceImageModel, ServiceImageModel>>?
      get servicImage => $value.servicImage != null
          ? ListCopyWith($value.servicImage!, (v, t) => v.copyWith.$chain(t),
              (v) => call(servicImage: v))
          : null;
  @override
  ListCopyWith<
      $R,
      ServiceRatingModel,
      ServiceRatingModelCopyWith<$R, ServiceRatingModel,
          ServiceRatingModel>>? get ratings => $value.ratings != null
      ? ListCopyWith($value.ratings!, (v, t) => v.copyWith.$chain(t),
          (v) => call(ratings: v))
      : null;
  @override
  ListCopyWith<
      $R,
      ServiceRequestModel,
      ServiceRequestModelCopyWith<$R, ServiceRequestModel,
          ServiceRequestModel>>? get serviceRequests =>
      $value.serviceRequests != null
          ? ListCopyWith($value.serviceRequests!,
              (v, t) => v.copyWith.$chain(t), (v) => call(serviceRequests: v))
          : null;
  @override
  ListCopyWith<
      $R,
      ServiceLocationModel,
      ServiceLocationModelCopyWith<$R, ServiceLocationModel,
          ServiceLocationModel>>? get locations => $value.locations != null
      ? ListCopyWith($value.locations!, (v, t) => v.copyWith.$chain(t),
          (v) => call(locations: v))
      : null;
  @override
  $R call(
          {Object? id = $none,
          Object? titleAr = $none,
          Object? descriptionAr = $none,
          Object? price = $none,
          Object? services = $none,
          Object? provider = $none,
          Object? servicImage = $none,
          Object? ratings = $none,
          Object? serviceRequests = $none,
          Object? locations = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (titleAr != $none) #titleAr: titleAr,
        if (descriptionAr != $none) #descriptionAr: descriptionAr,
        if (price != $none) #price: price,
        if (services != $none) #services: services,
        if (provider != $none) #provider: provider,
        if (servicImage != $none) #servicImage: servicImage,
        if (ratings != $none) #ratings: ratings,
        if (serviceRequests != $none) #serviceRequests: serviceRequests,
        if (locations != $none) #locations: locations
      }));
  @override
  ServicesProvidedModel $make(CopyWithData data) => ServicesProvidedModel(
      id: data.get(#id, or: $value.id),
      titleAr: data.get(#titleAr, or: $value.titleAr),
      descriptionAr: data.get(#descriptionAr, or: $value.descriptionAr),
      price: data.get(#price, or: $value.price),
      services: data.get(#services, or: $value.services),
      provider: data.get(#provider, or: $value.provider),
      servicImage: data.get(#servicImage, or: $value.servicImage),
      ratings: data.get(#ratings, or: $value.ratings),
      serviceRequests: data.get(#serviceRequests, or: $value.serviceRequests),
      locations: data.get(#locations, or: $value.locations));

  @override
  ServicesProvidedModelCopyWith<$R2, ServicesProvidedModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ServicesProvidedModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
