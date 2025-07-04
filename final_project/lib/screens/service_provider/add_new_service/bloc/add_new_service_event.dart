import 'package:image_picker/image_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:equatable/equatable.dart';

abstract class AddServiceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ArabicNameChanged extends AddServiceEvent {
  final String arabicName;
  ArabicNameChanged(this.arabicName);

  @override
  List<Object> get props => [arabicName];
}

class DescriptionChanged extends AddServiceEvent {
  final String description;
  DescriptionChanged(this.description);

  @override
  List<Object> get props => [description];
}

class ArabicDescriptionChanged extends AddServiceEvent {
  final String arabicDescription;
  ArabicDescriptionChanged(this.arabicDescription);

  @override
  List<Object> get props => [arabicDescription];
}

class CategoryChanged extends AddServiceEvent {
  final String category;
  CategoryChanged(this.category);

  @override
  List<Object> get props => [category];
}

class NameChanged extends AddServiceEvent {
  final String name;
  NameChanged(this.name);

  @override
  List<Object> get props => [name];
}

class GuestCountChanged extends AddServiceEvent {
  final String guestCount;
  GuestCountChanged(this.guestCount);

  @override
  List<Object> get props => [guestCount];
}

class DateChanged extends AddServiceEvent {
  final String date;
  DateChanged(this.date);

  @override
  List<Object> get props => [date];
}

class PriceChanged extends AddServiceEvent {
  final String price;
  PriceChanged(this.price);

  @override
  List<Object> get props => [price];
}

class LocationChanged extends AddServiceEvent {
  final LatLng location;
  LocationChanged(this.location);

  @override
  List<Object> get props => [location];
}

class LoadServiceTypes extends AddServiceEvent {}

class ImagesPicked extends AddServiceEvent {
  final List<XFile> images;
  ImagesPicked(this.images);

  @override
  List<Object> get props => [images];
}

class SubmitService extends AddServiceEvent {}

class LoadRegionsAndCities extends AddServiceEvent {}

class RegionChanged extends AddServiceEvent {
  final int regionId;
  RegionChanged(this.regionId);

  @override
  List<Object> get props => [regionId];
}

class CityChanged extends AddServiceEvent {
  final int cityId;
  final double? lat;
  final double? lng;

  CityChanged(this.cityId, {this.lat, this.lng});

  @override
  List<Object?> get props => [cityId, lat, lng];
}
