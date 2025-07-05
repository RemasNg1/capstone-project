import 'package:dart_mappable/dart_mappable.dart';

part 'service_request_model.mapper.dart';

@MappableClass()
class ServiceRequestModel with ServiceRequestModelMappable {
  final int? id;

  @MappableField(key: 'user_auth_id')
  final String? userAuthId;

  final DateTime? date;

  @MappableField(key: 'service_provided_id')
  final int? serviceProvidedId;

  @MappableField(key: 'service_location_id')
  final int? serviceLocationId;

  final String? status;

  ServiceRequestModel({
    this.id,
    this.userAuthId,
    this.date,
    this.serviceProvidedId,
    this.serviceLocationId,
    this.status,
  });

  mapForAddSupabase() {
    return {
      'user_id': userAuthId,
      'date': date?.toIso8601String(),
      'service_provided_id': serviceProvidedId,
      'service_location_id': serviceLocationId,
      'status': status,
    };
  }
}
