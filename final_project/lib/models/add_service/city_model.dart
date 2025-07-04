class CityModel {
  final int id;
  final String nameEn;
  final String nameAr;
  final int regionId;
  final double? latitude;
  final double? longitude;

  CityModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.regionId,
    this.latitude,
    this.longitude,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      nameEn: json['name_en'] ?? '',
      nameAr: json['name_ar'] ?? '',
      regionId: json['region_id'],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'region_id': regionId,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
