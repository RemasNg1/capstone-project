import 'package:final_project/models/booking_model/service_request.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookingRepository {
  final SupabaseClient client;

  BookingRepository(this.client);
  Future<int?> getProviderIdFromAuthId(String authId) async {
    final result = await client
        .from('providers')
        .select('id')
        .eq('auth_id', authId)
        .maybeSingle();

    if (result != null && result['id'] != null) {
      return result['id'] as int;
    }
    return null;
  }

  Future<List<ServiceRequest>> fetchProviderBookings() async {
    final user = client.auth.currentUser;
    if (user == null) throw Exception("User not authenticated");

    final providerId = await getProviderIdFromAuthId(user.id);
    if (providerId == null) throw Exception("Provider not found");
    final response = await client
        .from('services_provided')
        .select('''
      id,
      title_en,
      servic_image (
        image_url
      ),
      service_requests (
        id,
        date,
        status
      )
    ''')
        .eq('provider_id', providerId);

    final results = response as List;

    List<ServiceRequest> bookings = [];

    for (final item in results) {
      final serviceTitle = item['title_en'] ?? '';
      final imageList = item['servic_image'] as List?;
      final imageUrl = (imageList != null && imageList.isNotEmpty)
          ? imageList.first['image_url'] as String
          : '';

      final requests = item['service_requests'] as List?;
      if (requests == null) continue;

      for (final req in requests) {
        bookings.add(
          ServiceRequest(
            id: req['id'],
            date: DateTime.parse(req['date']),
            status: req['status'],
            serviceTitle: serviceTitle,
            imageUrl: imageUrl,
          ),
        );
      }
    }

    return bookings;
  }

  Future<void> updateStatus(int id, String newStatus) async {
    await client
        .from('service_requests')
        .update({'status': newStatus})
        .eq('id', id);
  }
}
