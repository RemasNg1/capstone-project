import 'package:equatable/equatable.dart';
import 'package:final_project/models/add_service/%20region_model.dart';
import 'package:final_project/models/add_service/city_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddServiceState extends Equatable {
  //final int? serviceLocationId;
  final bool loadingServiceTypes;
  final List<String> serviceTypes;
  final String arabicName;
  final String description;
  final String arabicDescription;
  final String category;
  final String name;
  final String guestCount;
  final String date;
  final String price;
  final LatLng? location;
  final List<XFile> images;
  final bool isSubmitting;
  final bool success;
  final String? error;
  final int? cityId;
  final int? regionId;
  final List<RegionModel> regions;
  final List<CityModel> cities;

  const AddServiceState({
    //this.serviceLocationId,
    this.cityId,
    this.regionId,
    this.name = '',
    this.arabicName = '',
    this.description = '',
    this.arabicDescription = '',
    this.category = '',
    this.price = '',
    this.date = '',
    this.guestCount = '',
    this.images = const [],
    this.location,
    this.error,
    this.success = false,
    this.isSubmitting = false,
    this.loadingServiceTypes = false,
    this.serviceTypes = const [],
    this.regions = const [],
    this.cities = const [],
  });

  AddServiceState copyWith({
    String? name,
    String? arabicName,
    String? description,
    String? arabicDescription,
    String? category,
    String? price,
    String? date,
    String? guestCount,
    List<XFile>? images,
    LatLng? location,
    bool? isSubmitting,
    bool? success,
    String? error,
    bool? loadingServiceTypes,
    List<String>? serviceTypes,
    int? cityId,
    int? regionId,
    List<RegionModel>? regions,
    List<CityModel>? cities,
    int? serviceLocationId,
  }) {
    return AddServiceState(
      //serviceLocationId: serviceLocationId ?? this.serviceLocationId,
      name: name ?? this.name,
      arabicName: arabicName ?? this.arabicName,
      description: description ?? this.description,
      arabicDescription: arabicDescription ?? this.arabicDescription,
      category: category ?? this.category,
      price: price ?? this.price,
      date: date ?? this.date,
      guestCount: guestCount ?? this.guestCount,
      images: images ?? this.images,
      location: location ?? this.location,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      success: success ?? this.success,
      error: error ?? this.error,
      loadingServiceTypes: loadingServiceTypes ?? this.loadingServiceTypes,
      serviceTypes: serviceTypes ?? this.serviceTypes,
      cityId: cityId ?? this.cityId,
      regionId: regionId ?? this.regionId,
      regions: regions ?? this.regions,
      cities: cities ?? this.cities,
    );
  }

  @override
  List<Object?> get props => [
    category,
    name,
    arabicName,
    description,
    arabicDescription,
    guestCount,
    date,
    price,
    location,
    images,
    isSubmitting,
    success,
    error,
    loadingServiceTypes,
    serviceTypes,
    cityId,
    regionId,
    regions,
    cities,
    // serviceLocationId,
  ];
}
