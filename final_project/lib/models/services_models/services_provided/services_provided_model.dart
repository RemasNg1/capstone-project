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

  @MappableField(key: 'title_en')
  final String? titleEn;

  @MappableField(key: 'description_ar')
  final String? descriptionAr;

  @MappableField(key: 'description_en')
  final String? descriptionEn;

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
  final bool? isFavorite;

  @MappableField(key: 'provider_auth_id')
  final String? providerAuthId;

  const ServicesProvidedModel({
    this.id,
    this.titleAr,
    this.titleEn,
    this.descriptionAr,
    this.descriptionEn,
    this.price,
    this.services,
    this.provider,
    this.servicImage,
    this.ratings,
    this.serviceRequests,
    this.locations,
    this.isFavorite,
    this.providerAuthId,
  });
}
