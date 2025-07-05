import 'package:dart_mappable/dart_mappable.dart';

part 'region_model.mapper.dart';

@MappableClass()
class RegionModel with RegionModelMappable {
  final int? id;
  @MappableField(key: 'name_ar')
  final String? nameAr;
  @MappableField(key: 'name_en')
  final String? nameEn;

  const RegionModel({this.id, this.nameAr, this.nameEn});

  mapForAddSupabase() {
    return {'name_ar': nameAr, 'name_en': nameEn};
  }
}
