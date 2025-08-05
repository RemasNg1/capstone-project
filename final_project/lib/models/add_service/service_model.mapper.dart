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

  static String _$name(ServiceModel v) => v.name;
  static const Field<ServiceModel, String> _f$name = Field('name', _$name);
  static String _$description(ServiceModel v) => v.description;
  static const Field<ServiceModel, String> _f$description =
      Field('description', _$description);
  static int _$guests(ServiceModel v) => v.guests;
  static const Field<ServiceModel, int> _f$guests = Field('guests', _$guests);
  static List<DateTimeRangeModel> _$dates(ServiceModel v) => v.dates;
  static const Field<ServiceModel, List<DateTimeRangeModel>> _f$dates =
      Field('dates', _$dates);
  static double _$price(ServiceModel v) => v.price;
  static const Field<ServiceModel, double> _f$price = Field('price', _$price);
  static String _$category(ServiceModel v) => v.category;
  static const Field<ServiceModel, String> _f$category =
      Field('category', _$category);
  static String _$categoryAr(ServiceModel v) => v.categoryAr;
  static const Field<ServiceModel, String> _f$categoryAr =
      Field('categoryAr', _$categoryAr);
  static String _$categoryEn(ServiceModel v) => v.categoryEn;
  static const Field<ServiceModel, String> _f$categoryEn =
      Field('categoryEn', _$categoryEn);
  static int _$regionId(ServiceModel v) => v.regionId;
  static const Field<ServiceModel, int> _f$regionId =
      Field('regionId', _$regionId);
  static int _$cityId(ServiceModel v) => v.cityId;
  static const Field<ServiceModel, int> _f$cityId = Field('cityId', _$cityId);
  static double _$latitude(ServiceModel v) => v.latitude;
  static const Field<ServiceModel, double> _f$latitude =
      Field('latitude', _$latitude);
  static double _$longitude(ServiceModel v) => v.longitude;
  static const Field<ServiceModel, double> _f$longitude =
      Field('longitude', _$longitude);
  static List<String> _$imageUrls(ServiceModel v) => v.imageUrls;
  static const Field<ServiceModel, List<String>> _f$imageUrls =
      Field('imageUrls', _$imageUrls);
  static double _$deposit(ServiceModel v) => v.deposit;
  static const Field<ServiceModel, double> _f$deposit =
      Field('deposit', _$deposit);
  static double _$insurance(ServiceModel v) => v.insurance;
  static const Field<ServiceModel, double> _f$insurance =
      Field('insurance', _$insurance);

  @override
  final MappableFields<ServiceModel> fields = const {
    #name: _f$name,
    #description: _f$description,
    #guests: _f$guests,
    #dates: _f$dates,
    #price: _f$price,
    #category: _f$category,
    #categoryAr: _f$categoryAr,
    #categoryEn: _f$categoryEn,
    #regionId: _f$regionId,
    #cityId: _f$cityId,
    #latitude: _f$latitude,
    #longitude: _f$longitude,
    #imageUrls: _f$imageUrls,
    #deposit: _f$deposit,
    #insurance: _f$insurance,
  };

  static ServiceModel _instantiate(DecodingData data) {
    return ServiceModel(
        name: data.dec(_f$name),
        description: data.dec(_f$description),
        guests: data.dec(_f$guests),
        dates: data.dec(_f$dates),
        price: data.dec(_f$price),
        category: data.dec(_f$category),
        categoryAr: data.dec(_f$categoryAr),
        categoryEn: data.dec(_f$categoryEn),
        regionId: data.dec(_f$regionId),
        cityId: data.dec(_f$cityId),
        latitude: data.dec(_f$latitude),
        longitude: data.dec(_f$longitude),
        imageUrls: data.dec(_f$imageUrls),
        deposit: data.dec(_f$deposit),
        insurance: data.dec(_f$insurance));
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
  ListCopyWith<$R, DateTimeRangeModel,
      ObjectCopyWith<$R, DateTimeRangeModel, DateTimeRangeModel>> get dates;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get imageUrls;
  $R call(
      {String? name,
      String? description,
      int? guests,
      List<DateTimeRangeModel>? dates,
      double? price,
      String? category,
      String? categoryAr,
      String? categoryEn,
      int? regionId,
      int? cityId,
      double? latitude,
      double? longitude,
      List<String>? imageUrls,
      double? deposit,
      double? insurance});
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
  ListCopyWith<$R, DateTimeRangeModel,
          ObjectCopyWith<$R, DateTimeRangeModel, DateTimeRangeModel>>
      get dates => ListCopyWith($value.dates,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(dates: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get imageUrls =>
      ListCopyWith($value.imageUrls, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(imageUrls: v));
  @override
  $R call(
          {String? name,
          String? description,
          int? guests,
          List<DateTimeRangeModel>? dates,
          double? price,
          String? category,
          String? categoryAr,
          String? categoryEn,
          int? regionId,
          int? cityId,
          double? latitude,
          double? longitude,
          List<String>? imageUrls,
          double? deposit,
          double? insurance}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (description != null) #description: description,
        if (guests != null) #guests: guests,
        if (dates != null) #dates: dates,
        if (price != null) #price: price,
        if (category != null) #category: category,
        if (categoryAr != null) #categoryAr: categoryAr,
        if (categoryEn != null) #categoryEn: categoryEn,
        if (regionId != null) #regionId: regionId,
        if (cityId != null) #cityId: cityId,
        if (latitude != null) #latitude: latitude,
        if (longitude != null) #longitude: longitude,
        if (imageUrls != null) #imageUrls: imageUrls,
        if (deposit != null) #deposit: deposit,
        if (insurance != null) #insurance: insurance
      }));
  @override
  ServiceModel $make(CopyWithData data) => ServiceModel(
      name: data.get(#name, or: $value.name),
      description: data.get(#description, or: $value.description),
      guests: data.get(#guests, or: $value.guests),
      dates: data.get(#dates, or: $value.dates),
      price: data.get(#price, or: $value.price),
      category: data.get(#category, or: $value.category),
      categoryAr: data.get(#categoryAr, or: $value.categoryAr),
      categoryEn: data.get(#categoryEn, or: $value.categoryEn),
      regionId: data.get(#regionId, or: $value.regionId),
      cityId: data.get(#cityId, or: $value.cityId),
      latitude: data.get(#latitude, or: $value.latitude),
      longitude: data.get(#longitude, or: $value.longitude),
      imageUrls: data.get(#imageUrls, or: $value.imageUrls),
      deposit: data.get(#deposit, or: $value.deposit),
      insurance: data.get(#insurance, or: $value.insurance));

  @override
  ServiceModelCopyWith<$R2, ServiceModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ServiceModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
