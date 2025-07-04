import 'package:final_project/models/services/service_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dartz/dartz.dart';

class ServiceRepository {
  final SupabaseClient client;

  ServiceRepository(this.client);

  Future<Either<String, void>> submitService(ServiceModel service) async {
    try {
      // 1. Get service ID from name_en (category)
      final serviceRes = await client
          .from('services')
          .select('id')
          .eq('type', service.category)
          .maybeSingle();

      if (serviceRes == null || serviceRes['id'] == null) {
        return Left('Service category not found');
      }

      final serviceId = serviceRes['id'];

      // 2. Get current user
      final currentUser = client.auth.currentUser;
      if (currentUser == null) {
        return Left('User not authenticated');
      }

      // 3. Get provider ID
      final List providerResult = await client
          .from('providers')
          .select('id')
          .eq('auth_id', currentUser.id);

      if (providerResult.isEmpty || providerResult.first['id'] == null) {
        return Left('Provider not found');
      }

      final providerId = providerResult.first['id'];

      // 4. Insert into services_provided and get ID
      final serviceProvidedRes = await client
          .from('services_provided')
          .insert({
            'title_ar': service.name,
            'title_en': service.name,
            'description_ar': service.description,
            'description_en': service.description,
            'provider_id': providerId,
            'service_id': serviceId,
            'price': service.price,
            'category_ar': service.categoryAr,
            'category_en': service.categoryEn,
          })
          .select()
          .single();

      final serviceProvidedId = serviceProvidedRes['id'];

      // 5. Insert into service_locations and get location ID
      final locationRes = await client
          .from('service_locations')
          .insert({
            'region_id': service.regionId,
            'city_id': service.cityId,
            'latitude': service.latitude,
            'longitude': service.longitude,
            'service_provided_id': serviceProvidedId,
          })
          .select()
          .single();

      final locationId = locationRes['id'];

      // 6. Insert images
      for (final imageUrl in service.imageUrls) {
        await client.from('servic_image').insert({
          'servic_provided_id': serviceProvidedId,
          'image_url': imageUrl,
        });
      }

      // 7. Insert disabled_dates (if any)
      for (final dateStr in service.dates) {
        final parsedDate = DateTime.tryParse(dateStr);
        if (parsedDate != null) {
          await client.from('disabled_dates').insert({
            'service_location_id': locationId,
            'start_date': parsedDate.toIso8601String(),
            'end_date': parsedDate.toIso8601String(),
          });
        }
      }

      return const Right(null);
    } catch (e) {
      return Left('Error submitting service: $e');
    }
  }
}
