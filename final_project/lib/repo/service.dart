import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/models/services_models/favorite_service/favorite_service_model.dart';
import 'package:final_project/models/services_models/services_provided/services_provided_model.dart';
import 'package:final_project/models/services_models/service/service_model.dart';
import 'package:final_project/repo/supabase.dart';

class Service {
  // Fetches all provided services along with related data: service info, provider, images, ratings, requests, and locations

  static fetchAllServicesProvided() async {
    final supabase = SupabaseConnect.supabase!.client;

    final List<dynamic> data = await supabase.from('services_provided').select(
      '''
        *,
    services:service_id (*),
        providers:provider_id (*),
        servic_image (*),
        service_ratings (
      *,
      user: user_id ( id, name, avatar ) 
    ),
      service_requests (*),
      service_locations (
      *,
      region:region_id (*),
      city:city_id (*),
      disabled_dates (*)

    )

      ''',
    );

    final servicesProvided = data.map((service) {
      return ServicesProvidedModelMapper.fromMap(service);
    }).toList();
    servicesProvided.sort((a, b) {
      double avgA = 0;
      if (a.ratings != null && a.ratings!.isNotEmpty) {
        avgA =
            a.ratings!.map((r) => r.rating ?? 0).reduce((x, y) => x + y) /
            a.ratings!.length;
      }

      double avgB = 0;
      if (b.ratings != null && b.ratings!.isNotEmpty) {
        avgB =
            b.ratings!.map((r) => r.rating ?? 0).reduce((x, y) => x + y) /
            b.ratings!.length;
      }

      return avgB.compareTo(avgA); //
    });
    print(servicesProvided);
    return servicesProvided;
  }
  // Inserts a new booking request for a service

  static insertBooking({
    required int serviceId,
    required int serviceLocationId,
    required DateTime date,
  }) async {
    final user = SupabaseConnect.supabase!.client.auth.currentUser;

    if (user == null) {
      throw Exception("User not logged in");
    }

    final formattedDate = DateFormat('yyyy-MM-dd').format(date);

    await SupabaseConnect.supabase!.client.from('service_requests').insert({
      'date': formattedDate,
      'service_provided_id': serviceId,
      'service_location_id': serviceLocationId,
      'user_auth_id': user.id,
      'status': 'send',
    });
  }
  // Adds or removes a service from the user's favorites

  static toggleFavorite({required int serviceId}) async {
    final user = SupabaseConnect.supabase!.client.auth.currentUser;
    if (user == null) return;

    final userId = user.id;

    final existing = await SupabaseConnect.supabase!.client
        .from('favorit_services')
        .select()
        .eq('user_auth_id', userId)
        .eq('servic_provided_id', serviceId)
        .maybeSingle();

    if (existing != null) {
      await SupabaseConnect.supabase!.client
          .from('favorit_services')
          .delete()
          .eq('user_auth_id', userId)
          .eq('servic_provided_id', serviceId);
    } else {
      await SupabaseConnect.supabase!.client.from('favorit_services').insert({
        'user_auth_id': userId,
        'servic_provided_id': serviceId,
      });
    }
  }
  // Fetches all base service types (from 'services' table)

  static fetchServices() async {
    final supabase = SupabaseConnect.supabase!.client;

    final data = await supabase.from('services').select();
    return (data as List).map((e) => ServiceModelMapper.fromMap(e)).toList();
  }
  // Fetches only the favorite services saved by the current user

  static fetchFavoriteServices() async {
    final user = SupabaseConnect.supabase!.client.auth.currentUser;
    if (user == null) return [];

    final userId = user.id;

    final result = await SupabaseConnect.supabase!.client
        .from('favorit_services')
        .select()
        .eq('user_auth_id', userId);

    List<FavoriteService> favorites = [];

    if (result.isNotEmpty) {
      favorites = result.map((fav) {
        return FavoriteServiceMapper.fromMap(fav);
      }).toList();
    }
    return favorites;
  }
}
