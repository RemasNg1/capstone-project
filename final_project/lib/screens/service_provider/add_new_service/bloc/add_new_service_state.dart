import 'package:equatable/equatable.dart';
import 'package:final_project/models/add_service/%20region_model.dart';
import 'package:final_project/models/add_service/city_model.dart';
import 'package:final_project/models/add_service/service_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddServiceState extends Equatable {
  // Used when editing a service
  final bool isEditingLoaded;

  // Show loading while fetching service types
  final bool loadingServiceTypes;

  // List of available service types
  final List<Map<String, String>> serviceTypes;

  // Arabic and English names/descriptions
  final String arabicName;
  final String description;
  final String arabicDescription;
  final String category;
  final String name;

  // Guests and price info
  // final String guestCount;
  final String price;

  // Selected location on the map
  final LatLng? location;

  // Picked images from gallery
  final List<XFile> images;

  // Form submission state
  final bool isSubmitting;
  final bool success;
  final String? error;

  // Selected region and city
  final int? cityId;
  final int? regionId;
  final List<RegionModel> regions;
  final List<CityModel> cities;

  // Unavailable date ranges for the service
  final List<DateTimeRangeModel> unavailableDateRanges;

  // Service location ID (used for update)
  final int? serviceLocationId;

  // Selected service type values
  final String? selectedTypeEn;
  final String? selectedTypeAr;

  // Current app language
  final String languageCode;

  const AddServiceState({
    this.isEditingLoaded = false,
    this.loadingServiceTypes = false,
    this.serviceTypes = const [],
    this.arabicName = '',
    this.description = '',
    this.arabicDescription = '',
    this.category = '',
    this.name = '',
    // this.guestCount = '',
    this.price = '',
    this.location,
    this.images = const [],
    this.isSubmitting = false,
    this.success = false,
    this.error,
    this.cityId,
    this.regionId,
    this.regions = const [],
    this.cities = const [],
    this.unavailableDateRanges = const [],
    this.serviceLocationId,
    this.selectedTypeEn,
    this.selectedTypeAr,
    this.languageCode = 'en',
  });

  AddServiceState copyWith({
    bool? isEditingLoaded,
    bool? loadingServiceTypes,
    List<Map<String, String>>? serviceTypes,
    String? arabicName,
    String? description,
    String? arabicDescription,
    String? category,
    String? name,
    String? guestCount,
    String? price,
    LatLng? location,
    List<XFile>? images,
    bool? isSubmitting,
    bool? success,
    String? error,
    int? cityId,
    int? regionId,
    List<RegionModel>? regions,
    List<CityModel>? cities,
    List<DateTimeRangeModel>? unavailableDateRanges,
    int? serviceLocationId,
    String? selectedTypeEn,
    String? selectedTypeAr,
    String? languageCode,
  }) {
    return AddServiceState(
      isEditingLoaded: isEditingLoaded ?? this.isEditingLoaded,
      loadingServiceTypes: loadingServiceTypes ?? this.loadingServiceTypes,
      serviceTypes: serviceTypes ?? this.serviceTypes,
      arabicName: arabicName ?? this.arabicName,
      description: description ?? this.description,
      arabicDescription: arabicDescription ?? this.arabicDescription,
      category: category ?? this.category,
      name: name ?? this.name,
      // guestCount: guestCount ?? this.guestCount,
      price: price ?? this.price,
      location: location ?? this.location,
      images: images ?? this.images,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      success: success ?? this.success,
      error: error ?? this.error,
      cityId: cityId ?? this.cityId,
      regionId: regionId ?? this.regionId,
      regions: regions ?? this.regions,
      cities: cities ?? this.cities,
      unavailableDateRanges:
          unavailableDateRanges ?? this.unavailableDateRanges,
      serviceLocationId: serviceLocationId ?? this.serviceLocationId,
      selectedTypeEn: selectedTypeEn ?? this.selectedTypeEn,
      selectedTypeAr: selectedTypeAr ?? this.selectedTypeAr,
      languageCode: languageCode ?? this.languageCode,
    );
  }

  @override
  List<Object?> get props => [
    isEditingLoaded,
    loadingServiceTypes,
    serviceTypes,
    arabicName,
    description,
    arabicDescription,
    category,
    name,
    // guestCount,
    price,
    location,
    images,
    isSubmitting,
    success,
    error,
    cityId,
    regionId,
    regions,
    cities,
    unavailableDateRanges,
    serviceLocationId,
    selectedTypeEn,
    selectedTypeAr,
    languageCode,
  ];
}
