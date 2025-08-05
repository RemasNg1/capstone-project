import 'package:equatable/equatable.dart';
import 'package:final_project/models/add_service/%20region_model.dart';
import 'package:final_project/models/add_service/city_model.dart';
import 'package:final_project/models/add_service/service_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddServiceState extends Equatable {
  final List<String> deletedNetworkImages;
  final bool isEditingLoaded;
  final bool loadingServiceTypes;
  final int? selectedServiceId;

  final List<Map<String, dynamic>>? serviceTypes;

  final String arabicName;
  final String description;
  final String arabicDescription;
  final String category;
  final String name;
  final String price;
  final String deposit;
  final String insurance;

  final LatLng? location;
  final List<XFile> images;

  final bool isSubmitting;
  final bool success;
  final String? error;

  final int? cityId;
  final int? regionId;
  final List<RegionModel> regions;
  final List<CityModel> cities;

  final List<DateTimeRangeModel> unavailableDateRanges;
  final int? serviceLocationId;

  final String? selectedTypeEn;
  final String? selectedTypeAr;

  final String languageCode;

  const AddServiceState(
    this.deletedNetworkImages, {
    this.deposit = '',
    this.insurance = '',
    this.selectedServiceId,
    this.isEditingLoaded = false,
    this.loadingServiceTypes = false,
    this.serviceTypes = const [],
    this.arabicName = '',
    this.description = '',
    this.arabicDescription = '',
    this.category = '',
    this.name = '',
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
    List<String>? deletedNetworkImages,
    bool? isEditingLoaded,
    bool? loadingServiceTypes,
    List<Map<String, dynamic>>? serviceTypes,
    String? arabicName,
    String? description,
    String? arabicDescription,
    String? category,
    String? name,
    String? price,
    String? deposit,
    String? insurance,
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
    int? selectedServiceId,
  }) {
    return AddServiceState(
      deletedNetworkImages ?? this.deletedNetworkImages,
      deposit: deposit ?? this.deposit,
      insurance: insurance ?? this.insurance,
      selectedServiceId: selectedServiceId ?? this.selectedServiceId,
      isEditingLoaded: isEditingLoaded ?? this.isEditingLoaded,
      loadingServiceTypes: loadingServiceTypes ?? this.loadingServiceTypes,
      serviceTypes: serviceTypes ?? this.serviceTypes,
      arabicName: arabicName ?? this.arabicName,
      description: description ?? this.description,
      arabicDescription: arabicDescription ?? this.arabicDescription,
      category: category ?? this.category,
      name: name ?? this.name,
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
    deletedNetworkImages,
    isEditingLoaded,
    loadingServiceTypes,
    serviceTypes,
    arabicName,
    description,
    arabicDescription,
    category,
    name,
    price,
    deposit,
    insurance,
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
    selectedServiceId,
  ];
}
