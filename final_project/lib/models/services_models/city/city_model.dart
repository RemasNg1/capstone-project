import 'package:dart_mappable/dart_mappable.dart';

part 'city_model.mapper.dart';

@MappableClass()
class CityModel with CityModelMappable {
  final int? id;
  @MappableField(key: 'name_ar')
  final String? nameAr;
  @MappableField(key: 'name_en')
  final String? nameEn;
  @MappableField(key: 'region_id')
  final int? regionId;

  const CityModel({this.id, this.nameAr, this.nameEn, this.regionId});
}
