import 'package:final_project/models/my_services/my_service_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyServicesRepository {
  final SupabaseClient client;

  MyServicesRepository(this.client);

  // Fetch all services added by the current provider
  Future<List<MyServiceModel>> getMyServices() async {
    final currentUser = client.auth.currentUser;
    if (currentUser == null) throw Exception('User not authenticated');

    // Get provider ID by user ID
    final providerRes = await client
        .from('providers')
        .select('id')
        .eq('auth_id', currentUser.id)
        .maybeSingle();

    if (providerRes == null) throw Exception('Provider not found');

    final providerId = providerRes['id'];

    // Get all services for the provider with related images and location
    final result = await client
        .from('services_provided')
        .select('''
          *,
          servic_image (
            image_url
          ),
          service_locations (
            region_id,
            city_id,
            latitude,
            longitude
          )
        ''')
        .eq('provider_id', providerId);

    return (result as List).map((e) => MyServiceModel.fromMap(e)).toList();
  }

  // Get a specific service by its ID
  Future<MyServiceModel> getServiceById(String id) async {
    final result = await client
        .from('services_provided')
        .select('''
        *,
        servic_image (
          image_url
        ),
        service_locations (
          region_id,
          city_id,
          latitude,
          longitude
        )
      ''')
        .eq('id', id)
        .maybeSingle();

    if (result == null) throw Exception('Service not found');

    return MyServiceModel.fromMap(result);
  }

  // Update a service with new data
  Future<void> updateService(MyServiceModel service) async {
    final client = this.client;

    // 1. Update main service details
    await client
        .from('services_provided')
        .update({
          'title_en': service.nameEn,
          'title_ar': service.nameAr,
          'description_en': service.descriptionEn,
          'description_ar': service.descriptionAr,
          'price': service.price,
          'service_id': service.serviceId,
        })
        .eq('id', service.id);

    // 2. Update location info
    await client
        .from('service_locations')
        .update({
          'region_id': service.regionId,
          'city_id': service.cityId,
          'latitude': service.latitude,
          'longitude': service.longitude,
        })
        .eq('service_provided_id', service.id);

    // 3. Delete old images
    await client
        .from('servic_image')
        .delete()
        .eq('servic_provided_id', service.id);

    // 4. Add new images
    for (final imageUrl in service.imageUrls) {
      await client.from('servic_image').insert({
        'servic_provided_id': service.id,
        'image_url': imageUrl,
      });
    }
  }

  // Delete a service by ID with all its related data
  Future<void> deleteService(String serviceId) async {
    final serviceIdInt = int.tryParse(serviceId);
    if (serviceIdInt == null) throw Exception('Invalid service ID');

    try {
      // 1. Get all location IDs for this service
      final locationResult = await client
          .from('service_locations')
          .select('id')
          .eq('service_provided_id', serviceIdInt);

      final locationIds = locationResult
          .map((row) => row['id'] as int)
          .toList();

      //  2. Delete service_requests linked to those locations
      for (final locationId in locationIds) {
        await client
            .from('service_requests')
            .delete()
            .eq('service_location_id', locationId);
      }

      //  3. Delete disabled_dates for each location
      for (final locationId in locationIds) {
        await client
            .from('disabled_dates')
            .delete()
            .eq('service_location_id', locationId);
      }

      //  4. Delete service_locations
      await client
          .from('service_locations')
          .delete()
          .eq('service_provided_id', serviceIdInt);

      //  5. Delete servic_image
      await client
          .from('servic_image')
          .delete()
          .eq('servic_provided_id', serviceIdInt);

      //  6. Delete service itself
      await client.from('services_provided').delete().eq('id', serviceIdInt);
    } catch (e) {
      throw Exception('فشل حذف الخدمة: $e');
    }
  }
}
