class MyServiceModel {
  // Basic fields for the service
  final String id;
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final String descriptionAr;
  final double price;
  final int regionId;
  final int cityId;
  final double latitude;
  final double longitude;
  final int serviceId;
  final List<String> imageUrls;

  MyServiceModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.price,
    required this.regionId,
    required this.cityId,
    required this.latitude,
    required this.longitude,
    required this.serviceId,
    required this.imageUrls,
  });

  // Factory constructor to create a model from a map (Supabase response)
  factory MyServiceModel.fromMap(Map<String, dynamic> map) {
    // Get the first location if available
    final location = (map['service_locations'] as List?)?.isNotEmpty == true
        ? map['service_locations'][0]
        : null;

    return MyServiceModel(
      id: map['id'].toString(),
      nameEn: map['title_en'] ?? '',
      nameAr: map['title_ar'] ?? '',
      descriptionEn: map['description_en'] ?? '',
      descriptionAr: map['description_ar'] ?? '',
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      serviceId: map['service_id'] ?? 0,
      regionId: location?['region_id'] ?? 0,
      cityId: location?['city_id'] ?? 0,
      latitude: (location?['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (location?['longitude'] as num?)?.toDouble() ?? 0.0,
      imageUrls:
          (map['servic_image'] as List?)
              ?.map<String>((img) => img['image_url'].toString())
              .toList() ??
          [],
    );
  }
}
