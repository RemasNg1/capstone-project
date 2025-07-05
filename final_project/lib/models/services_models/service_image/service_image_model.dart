import 'package:dart_mappable/dart_mappable.dart';

part 'service_image_model.mapper.dart';

@MappableClass()
class ServiceImageModel with ServiceImageModelMappable {
  final int id;
  @MappableField(key: 'servic_provided_id')
  final int? servicProvidedId;

  @MappableField(key: 'image_url')
  final String? imageUrl;

  const ServiceImageModel({
    required this.id,
    this.servicProvidedId,
    this.imageUrl,
  });
}
