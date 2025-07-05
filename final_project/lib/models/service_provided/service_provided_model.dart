import 'package:dart_mappable/dart_mappable.dart';

part 'service_provided_model.mapper.dart';

@MappableClass()
class ServiceProvidedModel with ServiceProvidedModelMappable {
  final int? id;
  @MappableField(key: 'provider_id')
  final int? providerId;
  @MappableField(key: 'service_id')
  final int? serviceId;
  @MappableField(key: 'title_ar')
  final String? titleAr;
  @MappableField(key: 'title_en')
  final String? titleEn;
  @MappableField(key: 'description_ar')
  final String? descriptionAr;
  @MappableField(key: 'description_en')
  final String? descriptionEn;
  @MappableField(key: 'package_id')
  final int? packageId;

  final double? price;

  ServiceProvidedModel({
    this.id,
    this.providerId,
    this.serviceId,
    this.titleAr,
    this.titleEn,
    this.descriptionAr,
    this.descriptionEn,
    this.packageId,
    this.price,
  });

  mapForAddSupabase() {
    return {
      'provider_id': providerId,
      'service_id': serviceId,
      'package_id': packageId,
      'title_ar': titleAr,
      'title_en': titleEn,
      'description_ar': descriptionAr,
      'description_en': descriptionEn,
      'price': price,
    };
  }
}
