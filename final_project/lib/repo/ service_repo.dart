import 'package:final_project/models/add_service/service_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dartz/dartz.dart';

class ServiceRepository {
  final SupabaseClient client;

  ServiceRepository(this.client);

  // Submit a new service to the Supabase database
  Future<Either<String, void>> submitService(ServiceModel service) async {
    try {
      // 1. Get the service type ID using category name (English & Arabic)
      final serviceRes = await client
          .from('services')
          .select('id')
          .eq('type_en', service.categoryEn)
          .eq('type_ar', service.categoryAr)
          .maybeSingle();

      if (serviceRes == null || serviceRes['id'] == null) {
        return Left('Service category not found');
      }

      final serviceId = serviceRes['id'];

      // 2. Get the currently authenticated user
      final currentUser = client.auth.currentUser;
      if (currentUser == null) {
        return Left('User not authenticated');
      }

      // 3. Get provider ID for the authenticated user
      final List providerResult = await client
          .from('providers')
          .select('id')
          .eq('auth_id', currentUser.id);

      if (providerResult.isEmpty || providerResult.first['id'] == null) {
        return Left('Provider not found');
      }

      final providerId = providerResult.first['id'];

      // 4. Insert the service data into 'services_provided' and get the new ID
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
            'deposit': service.deposit,
            'insurance': service.insurance,
          })
          .select()
          .single();

      final serviceProvidedId = serviceProvidedRes['id'];

      // 5. Insert service location and get the location ID
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

      // 6. Upload all service images
      for (final imageUrl in service.imageUrls) {
        await client.from('servic_image').insert({
          'servic_provided_id': serviceProvidedId,
          'image_url': imageUrl,
        });
      }

      // 7. Insert unavailable date ranges if provided
      for (final range in service.dates) {
        await client.from('disabled_dates').insert(range.toMap(locationId));
      }

      return const Right(null); // success
    } catch (e) {
      return Left('Error submitting service: $e'); // failure
    }
  }
}
