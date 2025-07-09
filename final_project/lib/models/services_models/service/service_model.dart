// class ServiceModel {
//   final int? id;
//   final String? nameAr;
//   final String? nameEn;
//   final String? descriptionAr;
//   final String? descriptionEn;
//   final String? type;
//   final bool? isDeleted;

//   ServiceModel({
//     this.id,
//     this.nameAr,
//     this.nameEn,
//     this.descriptionAr,
//     this.descriptionEn,
//     this.type,
//     this.isDeleted,
//   });
// }
import 'package:dart_mappable/dart_mappable.dart';

part 'service_model.mapper.dart';

@MappableClass()
class ServiceModel with ServiceModelMappable {
  final int? id;
  @MappableField(key: 'name_ar')
  final String? nameAr;
  @MappableField(key: 'name_en')
  final String? nameEn;
  @MappableField(key: 'description_ar')
  final String? descriptionAr;
  final String? descriptionEn;
  final String? type;
  @MappableField(key: 'type_ar')
  final String? typeAr;
  @MappableField(key: 'type_en')
  final String? typeEn;
  @MappableField(key: 'description_en')
  @MappableField(key: 'description_en')
  @MappableField(key: 'is_deleted')
  final bool? isDeleted;

  ServiceModel({
    this.id,
    this.nameAr,
    this.nameEn,
    this.descriptionAr,
    this.descriptionEn,
    this.type,
    this.typeAr,
    this.typeEn,
    this.isDeleted,
  });
  mapForAddSupabase() {
    return {
      'name_ar': nameAr,
      'name_en': nameEn,
      'description_ar': descriptionAr,
      'description_en': descriptionEn,
      'type': type,
      'is_deleted': isDeleted,
    };
  }
}
