import 'package:dart_mappable/dart_mappable.dart';

part 'favorite_service_model.mapper.dart';

@MappableClass()
class FavoriteService with FavoriteServiceMappable {
  final int id;
  @MappableField(key: 'servic_provided_id')
  final int? serviceProvidedId;
  @MappableField(key: 'user_auth_id')
  final String? userAuthId;

  FavoriteService({required this.id, this.serviceProvidedId, this.userAuthId});

  mapForAddSupabase() {
    return {
      'service_provided_id': serviceProvidedId,
      'user_auth_id': userAuthId,
    };
  }
}
