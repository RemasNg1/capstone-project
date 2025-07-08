class ServiceRequest {
  final int id;
  final DateTime date;
  final String status; // , Accepted, Done, Canceled
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
    return ServiceRequest(
      id: json['id'],
      date: DateTime.parse(json['date']),
      status: json['status'],
      serviceTitle: json['title_en'] ?? '',
      imageUrl: json['image_url'] ?? '',
    );
  }
}
