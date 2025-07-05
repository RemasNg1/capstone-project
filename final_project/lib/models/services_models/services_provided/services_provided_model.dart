// import 'package:dart_mappable/dart_mappable.dart';

// part 'services_provided_model.mapper.dart';

// @MappableClass()
// class ServicesProvidedModel with ServicesProvidedModelMappable {
//   final int? id;

//   @MappableField(key: 'title_ar')
//   final String? titleAr;

//   @MappableField(key: 'description_ar')
//   final String? descriptionAr;

//   final double? price;

//   /// Nested field: service.name_ar
//   @MappableField(key: 'name_ar')
//   final String? serviceName;

//   /// Nested field: provider.avatar
//   @MappableField(key: 'avatar')
//   final String? avatar;

//   /// Images list
//   final List<String>? images;

//   /// Ratings list
//   final List<double>? ratings;

//   /// Nested field: service_locations.region.name
//   @MappableField(key: 'service_locations.region.name')
//   final String? regionName;

//   /// Nested field: service_locations.city.name
//   @MappableField(key: 'service_locations.city.name')
//   final String? cityName;

//   const ServicesProvidedModel({
//     this.id,
//     this.titleAr,
//     this.descriptionAr,
//     this.price,
//     this.serviceName,
//     this.avatar,
//     this.images,
//     this.ratings,
//     this.regionName,
//     this.cityName,
//   });
// }

// import 'package:dart_mappable/dart_mappable.dart';
// import 'package:final_project/models/provider/provider_model.dart';
// import 'package:final_project/models/service_image/service_image_model.dart';
// import 'package:final_project/models/test_all_models/service/service_model.dart';
// import 'package:final_project/models/test_all_models/service_location/service_location_model.dart';
// import 'package:final_project/models/test_all_models/service_rating/service_rating_model.dart';

// part 'services_provided_model.mapper.dart';

// @MappableClass()
// class ServicesProvidedModel with ServicesProvidedModelMappable {
//   final int? id;

//   @MappableField(key: 'title_ar')
//   final String? titleAr;

//   @MappableField(key: 'description_ar')
//   final String? descriptionAr;

//   final double? price;
//   final ServiceModel? service;
//   final ProviderModel? provider;
//   @MappableField(key: 'servic_image')
//   final List<ServiceImageModel>? servicImage;
//   @MappableField(key: 'service_ratings')
//   final List<ServiceRatingModel>? ratings;
//   @MappableField(key: 'service_locations')
//   final ServiceLocationModel? location;
//   const ServicesProvidedModel({
//     this.id,
//     this.titleAr,
//     this.descriptionAr,
//     this.price,
//     this.service,
//     this.provider,
//     this.servicImage,
//     this.ratings,
//     this.location,
//   });
// }

import 'package:dart_mappable/dart_mappable.dart';
import 'package:final_project/models/provider/provider_model.dart';
import 'package:final_project/models/services_models/service_image/service_image_model.dart';
import 'package:final_project/models/services_models/service/service_model.dart';
import 'package:final_project/models/services_models/service_location/service_location_model.dart';
import 'package:final_project/models/services_models/service_rating/service_rating_model.dart';
import 'package:final_project/models/services_models/service_request/service_request_model.dart';

part 'services_provided_model.mapper.dart';

@MappableClass()
class ServicesProvidedModel with ServicesProvidedModelMappable {
  final int? id;

  @MappableField(key: 'title_ar')
  final String? titleAr;

  @MappableField(key: 'description_ar')
  final String? descriptionAr;

  final double? price;
  final ServiceModel? services;
  final ProviderModel? provider;

  @MappableField(key: 'servic_image')
  final List<ServiceImageModel>? servicImage;

  @MappableField(key: 'service_ratings')
  final List<ServiceRatingModel>? ratings;

  @MappableField(key: 'service_requests')
  final List<ServiceRequestModel>? serviceRequests;

  @MappableField(key: 'service_locations')
  final List<ServiceLocationModel>? locations;

  const ServicesProvidedModel({
    this.id,
    this.titleAr,
    this.descriptionAr,
    this.price,
    this.services,
    this.provider,
    this.servicImage,
    this.ratings,
    this.serviceRequests,
    this.locations,
  });
}
