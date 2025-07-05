// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'disabled_date_model.dart';

class DisabledDateModelMapper extends ClassMapperBase<DisabledDateModel> {
  DisabledDateModelMapper._();

  static DisabledDateModelMapper? _instance;
  static DisabledDateModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DisabledDateModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DisabledDateModel';

  static int? _$id(DisabledDateModel v) => v.id;
  static const Field<DisabledDateModel, int> _f$id =
      Field('id', _$id, opt: true);
  static int? _$serviceLocationId(DisabledDateModel v) => v.serviceLocationId;
  static const Field<DisabledDateModel, int> _f$serviceLocationId = Field(
      'serviceLocationId', _$serviceLocationId,
      key: r'service_location_id', opt: true);
  static DateTime? _$startDate(DisabledDateModel v) => v.startDate;
  static const Field<DisabledDateModel, DateTime> _f$startDate =
      Field('startDate', _$startDate, key: r'start_date', opt: true);
  static DateTime? _$endDate(DisabledDateModel v) => v.endDate;
  static const Field<DisabledDateModel, DateTime> _f$endDate =
      Field('endDate', _$endDate, key: r'end_date', opt: true);

  @override
  final MappableFields<DisabledDateModel> fields = const {
    #id: _f$id,
    #serviceLocationId: _f$serviceLocationId,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
  };

  static DisabledDateModel _instantiate(DecodingData data) {
    return DisabledDateModel(
        id: data.dec(_f$id),
        serviceLocationId: data.dec(_f$serviceLocationId),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate));
  }

  @override
  final Function instantiate = _instantiate;

  static DisabledDateModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DisabledDateModel>(map);
  }

  static DisabledDateModel fromJson(String json) {
    return ensureInitialized().decodeJson<DisabledDateModel>(json);
  }
}

mixin DisabledDateModelMappable {
  String toJson() {
    return DisabledDateModelMapper.ensureInitialized()
        .encodeJson<DisabledDateModel>(this as DisabledDateModel);
  }

  Map<String, dynamic> toMap() {
    return DisabledDateModelMapper.ensureInitialized()
        .encodeMap<DisabledDateModel>(this as DisabledDateModel);
  }

  DisabledDateModelCopyWith<DisabledDateModel, DisabledDateModel,
          DisabledDateModel>
      get copyWith =>
          _DisabledDateModelCopyWithImpl<DisabledDateModel, DisabledDateModel>(
              this as DisabledDateModel, $identity, $identity);
  @override
  String toString() {
    return DisabledDateModelMapper.ensureInitialized()
        .stringifyValue(this as DisabledDateModel);
  }

  @override
  bool operator ==(Object other) {
    return DisabledDateModelMapper.ensureInitialized()
        .equalsValue(this as DisabledDateModel, other);
  }

  @override
  int get hashCode {
    return DisabledDateModelMapper.ensureInitialized()
        .hashValue(this as DisabledDateModel);
  }
}

extension DisabledDateModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DisabledDateModel, $Out> {
  DisabledDateModelCopyWith<$R, DisabledDateModel, $Out>
      get $asDisabledDateModel => $base
          .as((v, t, t2) => _DisabledDateModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DisabledDateModelCopyWith<$R, $In extends DisabledDateModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      int? serviceLocationId,
      DateTime? startDate,
      DateTime? endDate});
  DisabledDateModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DisabledDateModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DisabledDateModel, $Out>
    implements DisabledDateModelCopyWith<$R, DisabledDateModel, $Out> {
  _DisabledDateModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DisabledDateModel> $mapper =
      DisabledDateModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? serviceLocationId = $none,
          Object? startDate = $none,
          Object? endDate = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (serviceLocationId != $none) #serviceLocationId: serviceLocationId,
        if (startDate != $none) #startDate: startDate,
        if (endDate != $none) #endDate: endDate
      }));
  @override
  DisabledDateModel $make(CopyWithData data) => DisabledDateModel(
      id: data.get(#id, or: $value.id),
      serviceLocationId:
          data.get(#serviceLocationId, or: $value.serviceLocationId),
      startDate: data.get(#startDate, or: $value.startDate),
      endDate: data.get(#endDate, or: $value.endDate));

  @override
  DisabledDateModelCopyWith<$R2, DisabledDateModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DisabledDateModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
