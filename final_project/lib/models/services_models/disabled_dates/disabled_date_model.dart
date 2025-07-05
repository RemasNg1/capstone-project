import 'package:dart_mappable/dart_mappable.dart';

part 'disabled_date_model.mapper.dart';

@MappableClass()
class DisabledDateModel with DisabledDateModelMappable {
  final int? id;
  @MappableField(key: 'service_location_id')
  final int? serviceLocationId;
  @MappableField(key: 'start_date')
  final DateTime? startDate;

  @MappableField(key: 'end_date')
  final DateTime? endDate;

  DisabledDateModel({
    this.id,
    this.serviceLocationId,
    this.startDate,
    this.endDate,
  });
}
