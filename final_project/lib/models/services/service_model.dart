import 'package:dart_mappable/dart_mappable.dart';

part 'service_model.mapper.dart';

@MappableClass()
class ServiceModel with ServiceModelMappable {
  final String name;
  final String description;
  final int guests;
  final List<String> dates;
  final double price;
  final String category;
  final String categoryAr;
  final String categoryEn;
  final int regionId;
  final int cityId;
  final double latitude;
  final double longitude;
  final List<String> imageUrls;
  // final List<ServicePackage> packages;

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
    // required this.packages,
  });
}
