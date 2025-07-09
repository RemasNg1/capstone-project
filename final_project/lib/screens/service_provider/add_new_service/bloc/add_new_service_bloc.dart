import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/models/add_service/%20region_model.dart';
import 'package:final_project/models/add_service/city_model.dart';
import 'package:final_project/models/add_service/service_model.dart';
import 'package:final_project/screens/service_provider/add_new_service/bloc/add_new_service_event.dart';
import 'package:final_project/screens/service_provider/add_new_service/bloc/add_new_service_state.dart';
import 'package:final_project/utils/upload_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddServiceBloc extends Bloc<AddServiceEvent, AddServiceState> {
  final SupabaseClient supabase;

  AddServiceBloc(this.supabase) : super(const AddServiceState()) {
    // Handle input field changes
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

    on<PriceChanged>((event, emit) {
      emit(state.copyWith(price: event.price));
    });

    on<LocationChanged>((event, emit) {
      emit(state.copyWith(location: event.location));
    });

    on<CityChanged>(_onCityChanged);

    on<ImagesPicked>((event, emit) {
      emit(state.copyWith(images: event.images));
    });

    on<UpdateService>(_onUpdateService);

    // Handle service type selection
    on<ServiceTypeChanged>((event, emit) {
      emit(
        state.copyWith(
          selectedTypeEn: event.typeEn.trim(),
          selectedTypeAr: event.typeAr.trim(),
          category: Intl.getCurrentLocale() == 'ar'
              ? event.typeAr.trim()
              : event.typeEn.trim(),
        ),
      );
    });

    // Handle unavailable date ranges
    on<UnavailableRangesChanged>((event, emit) {
      emit(state.copyWith(unavailableDateRanges: event.ranges));
    });

    // Load available service types from Supabase
    on<LoadServiceTypes>((event, emit) async {
      emit(state.copyWith(loadingServiceTypes: true));
      try {
        final response = await Supabase.instance.client
            .from('services')
            .select('type_en, type_ar');

        final types = response
            .map<Map<String, String>?>((item) {
              final en = item['type_en']?.toString().trim();
              final ar = item['type_ar']?.toString().trim();
              if (en == null || en.isEmpty || ar == null || ar.isEmpty) {
                return null;
              }
              return {'en': en, 'ar': ar};
            })
            .whereType<Map<String, String>>() // remove null
            .toSet() //remove dubliecte
            .toList(); // return as list

        emit(state.copyWith(serviceTypes: types, loadingServiceTypes: false));
      } catch (e) {
        emit(state.copyWith(loadingServiceTypes: false, error: e.toString()));
      }
    });

    // Load regions and cities from Supabase
    on<LoadRegionsAndCities>((event, emit) async {
      try {
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

    // Update region and reset city
    on<RegionChanged>((event, emit) {
      emit(state.copyWith(regionId: event.regionId, cityId: null));
    });

    // Load existing service data for editing
    on<LoadServiceForEditing>(_onLoadServiceForEditing);

    // Submit new service
    on<SubmitService>(_onSubmitService);
  }

  // Load existing service data from Supabase to edit it
  Future<void> _onLoadServiceForEditing(
    LoadServiceForEditing event,
    Emitter<AddServiceState> emit,
  ) async {
    emit(state.copyWith(isSubmitting: true));

    try {
      final client = Supabase.instance.client;

      final service = await client
          .from('services_provided')
          .select('*')
          .eq('id', event.serviceId)
          .maybeSingle();

      if (service == null) {
        emit(state.copyWith(isSubmitting: false, error: 'Error'));
        return;
      }

      // Load location info
      final locationData = await client
          .from('service_locations')
          .select('*')
          .eq('service_provided_id', event.serviceId)
          .maybeSingle();

      LatLng? latLng;
      int? regionId;
      int? cityId;
      int? locationId;

      if (locationData != null) {
        latLng = LatLng(
          double.tryParse(locationData['latitude'].toString()) ?? 0.0,
          double.tryParse(locationData['longitude'].toString()) ?? 0.0,
        );
        regionId = locationData['region_id'];
        cityId = locationData['city_id'];
        locationId = locationData['id'];
      }

      // Load image list
      final imageList = await client
          .from('servic_image')
          .select('image_url')
          .eq('servic_provided_id', event.serviceId);

      final images = imageList.map<XFile>((img) {
        return XFile(img['image_url']);
      }).toList();

      // Load unavailable dates
      final dates = await client
          .from('disabled_dates')
          .select()
          .eq('service_location_id', locationId ?? -1);

      final unavailableDates = dates.map<DateTimeRangeModel>((d) {
        return DateTimeRangeModel(
          start: DateTime.parse(d['start_date']),
          end: DateTime.parse(d['end_date']),
        );
      }).toList();

      // Load type info
      final serviceInfo = await client
          .from('services')
          .select('type_en, type_ar')
          .eq('id', service['service_id'])
          .maybeSingle();

      final selectedTypeEn = serviceInfo?['type_en']?.toString();
      final selectedTypeAr = serviceInfo?['type_ar']?.toString();

      // Emit state with loaded values
      emit(
        state.copyWith(
          name: service['title_en'] ?? '',
          arabicName: service['title_ar'] ?? '',
          description: service['description_en'] ?? '',
          arabicDescription: service['description_ar'] ?? '',
          guestCount: service['guest_count']?.toString() ?? '',
          price: service['price']?.toString() ?? '',
          category: service['title_en'] ?? '',
          selectedTypeEn: selectedTypeEn,
          selectedTypeAr: selectedTypeAr,
          regionId: regionId,
          cityId: cityId,
          location: latLng,
          images: images,
          unavailableDateRanges: unavailableDates,
          serviceLocationId: locationId,
          isEditingLoaded: true,
          isSubmitting: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, error: ' Error $e'));
    }
  }

  // When a city is selected, update cityId and location if available
  Future<void> _onCityChanged(
    CityChanged event,
    Emitter<AddServiceState> emit,
  ) async {
    emit(
      state.copyWith(
        cityId: event.cityId,
        location: (event.lat != null && event.lng != null)
            ? LatLng(event.lat!, event.lng!)
            : state.location,
      ),
    );
  }

  // Update an existing service
  Future<void> _onUpdateService(
    UpdateService event,
    Emitter<AddServiceState> emit,
  ) async {
    emit(state.copyWith(isSubmitting: true, success: false, error: null));
    print(' updating service...');

    try {
      final isArabic = Intl.getCurrentLocale() == 'ar';
      final column = isArabic ? 'type_ar' : 'type_en';
      final value = isArabic
          ? state.selectedTypeAr?.trim() ?? ''
          : state.selectedTypeEn?.trim() ?? '';

      final existingService = await supabase
          .from('services')
          .select('id')
          .eq(column, value)
          .maybeSingle();

      if (existingService == null || existingService['id'] == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            success: false,
            error: 'Service type not found',
          ),
        );
        return;
      }

      final serviceId = existingService['id'];

      // Update service data
      await supabase
          .from('services_provided')
          .update({
            'title_en': state.name,
            'title_ar': state.arabicName,
            'description_en': state.description,
            'description_ar': state.arabicDescription,
            'price': double.tryParse(state.price) ?? 0.0,
            'service_id': serviceId,
          })
          .eq('id', event.serviceId);

      // Update location if available
      if (state.location != null &&
          state.cityId != null &&
          state.regionId != null) {
        final existingLocation = await supabase
            .from('service_locations')
            .select('id')
            .eq('service_provided_id', event.serviceId)
            .maybeSingle();

        if (existingLocation != null) {
          await supabase
              .from('service_locations')
              .update({
                'region_id': state.regionId,
                'city_id': state.cityId,
                'latitude': state.location!.latitude,
                'longitude': state.location!.longitude,
              })
              .eq('id', existingLocation['id']);
        }
      }

      emit(state.copyWith(isSubmitting: false, success: true));
      print(' service updated successfully');
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, error: e.toString()));
      print(' Error updating service: $e');
    }
  }

  // Submit a new service to Supabase
  Future<void> _onSubmitService(
    SubmitService event,
    Emitter<AddServiceState> emit,
  ) async {
    debugPrint('[SubmitService] Triggered');

    // Check for required fields
    if (state.name.trim().isEmpty ||
        state.arabicName.trim().isEmpty ||
        state.description.trim().isEmpty ||
        state.arabicDescription.trim().isEmpty ||
        state.category.trim().isEmpty ||
        state.price.trim().isEmpty ||
        state.guestCount.trim().isEmpty ||
        state.location == null ||
        state.images.isEmpty) {
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
      // Upload images to storage
      final imageUrls = await uploadImages(state.images);

      final client = Supabase.instance.client;
      final currentUser = client.auth.currentUser;

      if (currentUser == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            success: false,
            error: 'User not authenticated',
          ),
        );
        return;
      }

      // Get provider ID
      final providerResult = await client
          .from('providers')
          .select('id')
          .eq('auth_id', currentUser.id)
          .maybeSingle();

      if (providerResult == null || providerResult['id'] == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            success: false,
            error: 'Provider not found for this user',
          ),
        );
        return;
      }

      final providerId = providerResult['id'];

      // Get service ID
      final isArabic = Intl.getCurrentLocale() == 'ar';
      final column = isArabic ? 'type_ar' : 'type_en';
      final value = isArabic
          ? state.selectedTypeAr?.trim() ?? ''
          : state.selectedTypeEn?.trim() ?? '';

      final existingService = await client
          .from('services')
          .select('id')
          .eq(column, value)
          .maybeSingle();

      if (existingService == null || existingService['id'] == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            success: false,
            error: 'Service type not found',
          ),
        );
        return;
      }

      final serviceId = existingService['id'];

      // Insert new service
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
            'provider_auth_id': currentUser.id,
          })
          .select()
          .single();

      final serviceProvidedId = serviceProvidedInsert['id'];

      // Insert location
      await client.from('service_locations').insert({
        'region_id': state.regionId,
        'city_id': state.cityId,
        'latitude': state.location!.latitude,
        'longitude': state.location!.longitude,
        'service_provided_id': serviceProvidedId,
      });

      final serviceLocationResult = await client
          .from('service_locations')
          .select('id')
          .eq('service_provided_id', serviceProvidedId)
          .maybeSingle();

      final serviceLocationId = serviceLocationResult?['id'];

      // Insert unavailable date ranges
      for (final range in state.unavailableDateRanges) {
        await client
            .from('disabled_dates')
            .insert(
              DateTimeRangeModel(
                start: range.start,
                end: range.end,
              ).toMap(serviceLocationId),
            );
      }

      // Insert images
      for (final url in imageUrls) {
        await client.from('servic_image').insert({
          'servic_provided_id': serviceProvidedId,
          'image_url': url,
        });
      }

      emit(state.copyWith(isSubmitting: false, success: true));
    } catch (e) {
      emit(
        state.copyWith(
          isSubmitting: false,
          success: false,
          error: e.toString(),
        ),
      );
    }
  }
}
