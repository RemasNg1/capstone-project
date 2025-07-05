// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'service_rating_model.dart';

class ServiceRatingModelMapper extends ClassMapperBase<ServiceRatingModel> {
  ServiceRatingModelMapper._();

  static ServiceRatingModelMapper? _instance;
  static ServiceRatingModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServiceRatingModelMapper._());
      UserModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ServiceRatingModel';

  static int? _$id(ServiceRatingModel v) => v.id;
  static const Field<ServiceRatingModel, int> _f$id =
      Field('id', _$id, opt: true);
  static int? _$serviceProvidedId(ServiceRatingModel v) => v.serviceProvidedId;
  static const Field<ServiceRatingModel, int> _f$serviceProvidedId = Field(
      'serviceProvidedId', _$serviceProvidedId,
      key: r'service_provided_id', opt: true);
  static int? _$userId(ServiceRatingModel v) => v.userId;
  static const Field<ServiceRatingModel, int> _f$userId =
      Field('userId', _$userId, key: r'user_id', opt: true);
  static DateTime? _$date(ServiceRatingModel v) => v.date;
  static const Field<ServiceRatingModel, DateTime> _f$date =
      Field('date', _$date, opt: true);
  static String? _$content(ServiceRatingModel v) => v.content;
  static const Field<ServiceRatingModel, String> _f$content =
      Field('content', _$content, opt: true);
  static double? _$rating(ServiceRatingModel v) => v.rating;
  static const Field<ServiceRatingModel, double> _f$rating =
      Field('rating', _$rating, opt: true);
  static UserModel? _$client(ServiceRatingModel v) => v.client;
  static const Field<ServiceRatingModel, UserModel> _f$client =
      Field('client', _$client, key: r'user', opt: true);

  @override
  final MappableFields<ServiceRatingModel> fields = const {
    #id: _f$id,
    #serviceProvidedId: _f$serviceProvidedId,
    #userId: _f$userId,
    #date: _f$date,
    #content: _f$content,
    #rating: _f$rating,
    #client: _f$client,
  };

  static ServiceRatingModel _instantiate(DecodingData data) {
    return ServiceRatingModel(
        id: data.dec(_f$id),
        serviceProvidedId: data.dec(_f$serviceProvidedId),
        userId: data.dec(_f$userId),
        date: data.dec(_f$date),
        content: data.dec(_f$content),
        rating: data.dec(_f$rating),
        client: data.dec(_f$client));
  }

  @override
  final Function instantiate = _instantiate;

  static ServiceRatingModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServiceRatingModel>(map);
  }

  static ServiceRatingModel fromJson(String json) {
    return ensureInitialized().decodeJson<ServiceRatingModel>(json);
  }
}

mixin ServiceRatingModelMappable {
  String toJson() {
    return ServiceRatingModelMapper.ensureInitialized()
        .encodeJson<ServiceRatingModel>(this as ServiceRatingModel);
  }

  Map<String, dynamic> toMap() {
    return ServiceRatingModelMapper.ensureInitialized()
        .encodeMap<ServiceRatingModel>(this as ServiceRatingModel);
  }

  ServiceRatingModelCopyWith<ServiceRatingModel, ServiceRatingModel,
          ServiceRatingModel>
      get copyWith => _ServiceRatingModelCopyWithImpl<ServiceRatingModel,
          ServiceRatingModel>(this as ServiceRatingModel, $identity, $identity);
  @override
  String toString() {
    return ServiceRatingModelMapper.ensureInitialized()
        .stringifyValue(this as ServiceRatingModel);
  }

  @override
  bool operator ==(Object other) {
    return ServiceRatingModelMapper.ensureInitialized()
        .equalsValue(this as ServiceRatingModel, other);
  }

  @override
  int get hashCode {
    return ServiceRatingModelMapper.ensureInitialized()
        .hashValue(this as ServiceRatingModel);
  }
}

extension ServiceRatingModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServiceRatingModel, $Out> {
  ServiceRatingModelCopyWith<$R, ServiceRatingModel, $Out>
      get $asServiceRatingModel => $base.as(
          (v, t, t2) => _ServiceRatingModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ServiceRatingModelCopyWith<$R, $In extends ServiceRatingModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  UserModelCopyWith<$R, UserModel, UserModel>? get client;
  $R call(
      {int? id,
      int? serviceProvidedId,
      int? userId,
      DateTime? date,
      String? content,
      double? rating,
      UserModel? client});
  ServiceRatingModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ServiceRatingModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServiceRatingModel, $Out>
    implements ServiceRatingModelCopyWith<$R, ServiceRatingModel, $Out> {
  _ServiceRatingModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServiceRatingModel> $mapper =
      ServiceRatingModelMapper.ensureInitialized();
  @override
  UserModelCopyWith<$R, UserModel, UserModel>? get client =>
      $value.client?.copyWith.$chain((v) => call(client: v));
  @override
  $R call(
          {Object? id = $none,
          Object? serviceProvidedId = $none,
          Object? userId = $none,
          Object? date = $none,
          Object? content = $none,
          Object? rating = $none,
          Object? client = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (serviceProvidedId != $none) #serviceProvidedId: serviceProvidedId,
        if (userId != $none) #userId: userId,
        if (date != $none) #date: date,
        if (content != $none) #content: content,
        if (rating != $none) #rating: rating,
        if (client != $none) #client: client
      }));
  @override
  ServiceRatingModel $make(CopyWithData data) => ServiceRatingModel(
      id: data.get(#id, or: $value.id),
      serviceProvidedId:
          data.get(#serviceProvidedId, or: $value.serviceProvidedId),
      userId: data.get(#userId, or: $value.userId),
      date: data.get(#date, or: $value.date),
      content: data.get(#content, or: $value.content),
      rating: data.get(#rating, or: $value.rating),
      client: data.get(#client, or: $value.client));

  @override
  ServiceRatingModelCopyWith<$R2, ServiceRatingModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ServiceRatingModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
