import 'package:dart_mappable/dart_mappable.dart';
import 'package:final_project/models/services_models/disabled_dates/disabled_date_model.dart';
import 'package:final_project/models/services_models/city/city_model.dart';
import 'package:final_project/models/services_models/region/region_model.dart';

part 'service_location_model.mapper.dart';

@MappableClass()
class ServiceLocationModel with ServiceLocationModelMappable {
  final int? id;
  @MappableField(key: 'disabled_dates')
  final List<DisabledDateModel>? disabledDates;

  final RegionModel? region;
  final CityModel? city;
  final double? latitude;
  final double? longitude;
  @MappableField(key: 'service_provided_id')
  final int? serviceProvidedId;

  ServiceLocationModel({
    this.id,
    this.disabledDates,
    this.region,
    this.city,
    this.latitude,
    this.longitude,
    this.serviceProvidedId,
  });
}
