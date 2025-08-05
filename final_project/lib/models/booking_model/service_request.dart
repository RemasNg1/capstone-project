import 'package:final_project/data_layer/auth_layer.dart';

class ServiceRequest {
  final int id;
  final DateTime date;
  final String status;
  final String serviceTitle;
  final String imageUrl;

  ServiceRequest({
    required this.id,
    required this.date,
    required this.status,
    required this.serviceTitle,
    required this.imageUrl,
  });

  factory ServiceRequest.fromJson(Map<String, dynamic> json) {
    final isArabic = AuthLayer.box.get('lang') == 'ar';
    final serviceTitle = isArabic
        ? (json['title_ar'] ?? '')
        : (json['title_en'] ?? '');

    return ServiceRequest(
      id: json['id'],
      date: DateTime.parse(json['date']),
      status: json['status'],
      serviceTitle: serviceTitle,
      imageUrl: json['image_url'] ?? '',
    );
  }

  ServiceRequest copyWith({
    int? id,
    DateTime? date,
    String? status,
    String? serviceTitle,
    String? imageUrl,
  }) {
    return ServiceRequest(
      id: id ?? this.id,
      date: date ?? this.date,
      status: status ?? this.status,
      serviceTitle: serviceTitle ?? this.serviceTitle,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
