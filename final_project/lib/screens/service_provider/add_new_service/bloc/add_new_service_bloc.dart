import 'package:final_project/models/add_service/%20region_model.dart';
import 'package:final_project/models/add_service/city_model.dart';
import 'package:final_project/screens/service_provider/add_new_service/bloc/add_new_service_event.dart';
import 'package:final_project/screens/service_provider/add_new_service/bloc/add_new_service_state.dart';
import 'package:final_project/utils/upload_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddServiceBloc extends Bloc<AddServiceEvent, AddServiceState> {
  final SupabaseClient supabase;

  AddServiceBloc(this.supabase) : super(const AddServiceState()) {
    on<CategoryChanged>((event, emit) {
      emit(state.copyWith(category: event.category));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<ArabicNameChanged>((event, emit) {
      emit(state.copyWith(arabicName: event.arabicName));
    });

    on<DescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });

    on<ArabicDescriptionChanged>((event, emit) {
      emit(state.copyWith(arabicDescription: event.arabicDescription));
    });

    on<GuestCountChanged>((event, emit) {
      emit(state.copyWith(guestCount: event.guestCount));
    });

    on<DateChanged>((event, emit) {
      emit(state.copyWith(date: event.date));
    });

    on<PriceChanged>((event, emit) {
      emit(state.copyWith(price: event.price));
    });

    on<LocationChanged>((event, emit) {
      emit(state.copyWith(location: event.location));
    });

    on<ImagesPicked>((event, emit) {
      emit(state.copyWith(images: event.images));
    });

    //load Types cotagry from supapase
    on<LoadServiceTypes>((event, emit) async {
      emit(state.copyWith(loadingServiceTypes: true));

      try {
        final response = await Supabase.instance.client
            .from('services')
            .select('type');

        final types = response
            .where((item) => item['type'] != null)
            .map<String>((item) => item['type'].toString())
            .toSet()
            .toList();

        emit(state.copyWith(serviceTypes: types, loadingServiceTypes: false));
      } catch (e) {
        emit(state.copyWith(loadingServiceTypes: false, error: e.toString()));
      }
    });
    on<LoadRegionsAndCities>((event, emit) async {
      try {
        final supabase = Supabase.instance.client;

        final regionResponse = await supabase.from('regions').select();
        final cityResponse = await supabase.from('cities').select();

        final regions = regionResponse
            .map<RegionModel>((e) => RegionModel.fromJson(e))
            .toList();
        final cities = cityResponse
            .map<CityModel>((e) => CityModel.fromJson(e))
            .toList();

        emit(state.copyWith(regions: regions, cities: cities));
      } catch (e) {
        emit(state.copyWith(error: e.toString()));
      }
    });

    on<RegionChanged>((event, emit) {
      emit(state.copyWith(regionId: event.regionId, cityId: null));
    });

    on<CityChanged>((event, emit) {
      final selectedCity = state.cities.firstWhere(
        (city) => city.id == event.cityId,
        orElse: () => CityModel(id: 0, nameEn: '', nameAr: '', regionId: 0),
      );

      final lat = selectedCity.latitude;
      final lng = selectedCity.longitude;

      if (lat != null && lng != null) {
        emit(state.copyWith(cityId: event.cityId, location: LatLng(lat, lng)));
      } else {
        emit(state.copyWith(cityId: event.cityId));
      }
    });

    on<SubmitService>((event, emit) async {
      debugPrint('[SubmitService] Triggered');

      if (state.name.trim().isEmpty ||
          state.arabicName.trim().isEmpty ||
          state.description.trim().isEmpty ||
          state.arabicDescription.trim().isEmpty ||
          state.category.trim().isEmpty ||
          state.price.trim().isEmpty ||
          state.guestCount.trim().isEmpty ||
          state.location == null ||
          state.images.isEmpty) {
        debugPrint('[Validation Error] Missing required fields');
        emit(
          state.copyWith(
            error: 'Please fill out all required fields',
            isSubmitting: false,
            success: false,
          ),
        );
        return;
      }

      emit(state.copyWith(isSubmitting: true, error: null));

      try {
        //upload image
        final imageUrls = await uploadImages(state.images);
        debugPrint('[Upload] Uploaded ${imageUrls.length} images');

        final providerId = 1; // مؤقت
        final client = Supabase.instance.client;

        // add general services
        final serviceInsert = await client
            .from('services')
            .insert({
              'name_en': state.name,
              'name_ar': state.arabicName,
              'description_en': state.description,
              'description_ar': state.arabicDescription,
              'type': state.category,
              'is_deleted': false,
            })
            .select()
            .single();

        final serviceId = serviceInsert['id'];

        // add services_provided
        final serviceProvidedInsert = await client
            .from('services_provided')
            .insert({
              'provider_id': providerId,
              'service_id': serviceId,
              'price': double.tryParse(state.price) ?? 0,
              'title_ar': state.arabicName,
              'title_en': state.name,
              'description_ar': state.arabicDescription,
              'description_en': state.description,
            })
            .select()
            .single();

        final serviceProvidedId = serviceProvidedInsert['id'];
        debugPrint('[DB] services_provided.id = $serviceProvidedId');

        //add service_locations
        await client.from('service_locations').insert({
          'region_id': state.regionId,
          'city_id': state.cityId,
          'latitude': state.location!.latitude,
          'longitude': state.location!.longitude,
          'service_provided_id': serviceProvidedId,
        });

        //add servic_image
        for (final url in imageUrls) {
          await client.from('servic_image').insert({
            'servic_provided_id': serviceProvidedId,
            'image_url': url,
          });
        }

        emit(state.copyWith(isSubmitting: false, success: true));
        debugPrint('[SubmitService] Service created successfully.');
      } catch (e) {
        debugPrint('[Error] Failed to submit service: $e');
        emit(
          state.copyWith(
            isSubmitting: false,
            success: false,
            error: e.toString(),
          ),
        );
      }
    });
  }
}
