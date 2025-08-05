import 'package:dart_mappable/dart_mappable.dart';

part 'service_model.mapper.dart';

@MappableClass()
class ServiceModel with ServiceModelMappable {
  final String name;
  final String description;
  final int guests;
  final List<DateTimeRangeModel> dates;
  final double price;
  final String category;
  final String categoryAr;
  final String categoryEn;
  final int regionId;
  final int cityId;
  final double latitude;
  final double longitude;
  final List<String> imageUrls;

  final double deposit;
  final double insurance;

  const ServiceModel({
    required this.name,
    required this.description,
    required this.guests,
    required this.dates,
    required this.price,
    required this.category,
    required this.categoryAr,
    required this.categoryEn,
    required this.regionId,
    required this.cityId,
    required this.latitude,
    required this.longitude,
    required this.imageUrls,

    required this.deposit,
    required this.insurance,
  });
}

class DateTimeRangeModel {
  final DateTime start;
  final DateTime end;

  DateTimeRangeModel({required this.start, required this.end});

  Map<String, dynamic> toMap(int serviceLocationId) => {
    'service_location_id': serviceLocationId,
    'start_date': start.toIso8601String(),
    'end_date': end.toIso8601String(),
  };
}
