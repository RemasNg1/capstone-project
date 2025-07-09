import 'package:final_project/models/add_service/service_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:equatable/equatable.dart';

abstract class AddServiceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// Called when Arabic name input changes
class ArabicNameChanged extends AddServiceEvent {
  final String arabicName;
  ArabicNameChanged(this.arabicName);

  @override
  List<Object> get props => [arabicName];
}

// Called when English description input changes
class DescriptionChanged extends AddServiceEvent {
  final String description;
  DescriptionChanged(this.description);

  @override
  List<Object> get props => [description];
}

// Called when Arabic description input changes
class ArabicDescriptionChanged extends AddServiceEvent {
  final String arabicDescription;
  ArabicDescriptionChanged(this.arabicDescription);

  @override
  List<Object> get props => [arabicDescription];
}

// Called when category input changes
class CategoryChanged extends AddServiceEvent {
  final String category;
  CategoryChanged(this.category);

  @override
  List<Object> get props => [category];
}

// Called when English name input changes
class NameChanged extends AddServiceEvent {
  final String name;
  NameChanged(this.name);

  @override
  List<Object> get props => [name];
}

// Called when guest count input changes
// class GuestCountChanged extends AddServiceEvent {
//   final String guestCount;
//   GuestCountChanged(this.guestCount);

//   @override
//   List<Object> get props => [guestCount];
// }

// Called when price input changes
class PriceChanged extends AddServiceEvent {
  final String price;
  PriceChanged(this.price);

  @override
  List<Object> get props => [price];
}

// Called when location is selected on the map
class LocationChanged extends AddServiceEvent {
  final LatLng location;
  LocationChanged(this.location);

  @override
  List<Object> get props => [location];
}

// Called to load available service types from database
class LoadServiceTypes extends AddServiceEvent {}

// Called when user picks images from gallery
class ImagesPicked extends AddServiceEvent {
  final List<XFile> images;
  ImagesPicked(this.images);

  @override
  List<Object> get props => [images];
}

// Called when user submits the new service form
class SubmitService extends AddServiceEvent {}

// Called to load available regions and cities
class LoadRegionsAndCities extends AddServiceEvent {}

// Called when region is selected
class RegionChanged extends AddServiceEvent {
  final int regionId;
  RegionChanged(this.regionId);

  @override
  List<Object> get props => [regionId];
}

// Called when city is selected (and optionally location)
class CityChanged extends AddServiceEvent {
  final int cityId;
  final double? lat;
  final double? lng;

  CityChanged(this.cityId, {this.lat, this.lng});

  @override
  List<Object?> get props => [cityId, lat, lng];
}

// Called when unavailable date ranges are selected
class UnavailableRangesChanged extends AddServiceEvent {
  final List<DateTimeRangeModel> ranges;

  UnavailableRangesChanged(this.ranges);

  @override
  List<Object> get props => [ranges];
}

// Called when user selects a service type (English + Arabic)
class ServiceTypeChanged extends AddServiceEvent {
  final String typeEn;
  final String typeAr;

  ServiceTypeChanged({required this.typeEn, required this.typeAr});
}

// Called to update existing service
class UpdateService extends AddServiceEvent {
  final int serviceId;

  UpdateService(this.serviceId);

  @override
  List<Object?> get props => [serviceId];
}

// Called to load existing service details for editing
class LoadServiceForEditing extends AddServiceEvent {
  final int serviceId;

  LoadServiceForEditing(this.serviceId);

  @override
  List<Object?> get props => [serviceId];
}
