import 'package:dart_mappable/dart_mappable.dart';
import 'package:final_project/models/services_models/service_rating/user/user_model.dart';

part 'service_rating_model.mapper.dart';

@MappableClass()
class ServiceRatingModel with ServiceRatingModelMappable {
  final int? id;

  @MappableField(key: 'service_provided_id')
  final int? serviceProvidedId;

  @MappableField(key: 'user_id')
  final int? userId;
  final DateTime? date;

  final String? content;
  final double? rating;
  @MappableField(key: 'user')
  final UserModel? client;

  ServiceRatingModel({
    this.id,
    this.serviceProvidedId,
    this.userId,
    this.date,
    this.content,
    this.rating,
    this.client,
  });

  mapForAddSupabase() {
    return {
      'service_provided_id': serviceProvidedId,
      'user_id': userId,
      'content': content,
      'rating': rating,
    };
  }
}
