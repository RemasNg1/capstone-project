class RegionModel {
  final int id;
  final String nameEn;
  final String nameAr;

  RegionModel({required this.id, required this.nameEn, required this.nameAr});

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(
      id: json['id'],
      nameEn: json['name_en'] ?? '',
      nameAr: json['name_ar'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name_en': nameEn, 'name_ar': nameAr};
  }
}
