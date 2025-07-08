// class ModelBooking {
//   int? id;
//   String? date;
//   String? status;
//   String? userAuthId;
//   int? serviceProvidedId;
//   int? serviceLocationId;
//   ServicesProvided? servicesProvided;
//   ServiceLocations? serviceLocations;

//   ModelBooking({
//     this.id,
//     this.date,
//     this.serviceProvidedId,
//     this.serviceLocationId,
//     this.status,
//     this.userAuthId,
//     this.servicesProvided,
//     this.serviceLocations,
//   });
//   ModelBooking.fromJson(Map<String, dynamic> json) {
//     id = json['id'] as int?;
//     date = json['date']?.toString();
//     status = json['status']?.toString();
//     userAuthId = json['user_auth_id']?.toString();
//     serviceProvidedId = json['service_provided_id'] as int?;
//     serviceLocationId = json['service_location_id'] as int?;

//     servicesProvided = json['services_provided'] != null
//         ? ServicesProvided.fromJson(json['services_provided'])
//         : null;

//     serviceLocations = json['service_locations'] != null
//         ? ServiceLocations.fromJson(json['service_locations'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['date'] = this.date;
//     data['service_provided_id'] = this.serviceProvidedId;
//     data['service_location_id'] = this.serviceLocationId;
//     data['status'] = this.status;
//     data['user_auth_id'] = this.userAuthId;
//     if (this.servicesProvided != null) {
//       data['services_provided'] = this.servicesProvided!.toJson();
//     }
//     if (this.serviceLocations != null) {
//       data['service_locations'] = this.serviceLocations!.toJson();
//     }
//     return data;
//   }
// }

// class ServicesProvided {
//   int? id;
//   int? price;
//   String? titleAr;
//   String? titleEn;
//   int? packageId;
//   int? serviceId;
//   int? providerId;
//   String? descriptionAr;
//   String? descriptionEn;

//   ServicesProvided({
//     this.id,
//     this.price,
//     this.titleAr,
//     this.titleEn,
//     this.packageId,
//     this.serviceId,
//     this.providerId,
//     this.descriptionAr,
//     this.descriptionEn,
//   });

//   ServicesProvided.fromJson(Map<String, dynamic> json) {
//     id = json['id'] as int?;
//     price = json['price'] as int?;
//     titleAr = json['title_ar']?.toString();
//     titleEn = json['title_en']?.toString();
//     packageId = json['package_id'] as int?;
//     serviceId = json['service_id'] as int?;
//     providerId = json['provider_id'] as int?;
//     descriptionAr = json['description_ar']?.toString();
//     descriptionEn = json['description_en']?.toString();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['price'] = this.price;
//     data['title_ar'] = this.titleAr;
//     data['title_en'] = this.titleEn;
//     data['package_id'] = this.packageId;
//     data['service_id'] = this.serviceId;
//     data['provider_id'] = this.providerId;
//     data['description_ar'] = this.descriptionAr;
//     data['description_en'] = this.descriptionEn;
//     return data;
//   }
// }

// class ServiceLocations {
//   int? id;
//   int? cityId;
//   double? latitude;
//   double? longitude;
//   int? regionId;
//   int? serviceProvidedId;

//   ServiceLocations({
//     this.id,
//     this.cityId,
//     this.latitude,
//     this.longitude,
//     this.regionId,
//     this.serviceProvidedId,
//   });

//   ServiceLocations.fromJson(Map<String, dynamic> json) {
//     id = json['id'] as int?;
//     cityId = json['city_id'] as int?;
//     latitude = (json['latitude'] as num?)?.toDouble();
//     longitude = (json['longitude'] as num?)?.toDouble();
//     regionId = json['region_id'] as int?;
//     serviceProvidedId = json['service_provided_id'] as int?;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['city_id'] = this.cityId;
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     data['region_id'] = this.regionId;
//     data['service_provided_id'] = this.serviceProvidedId;
//     return data;
//   }
// }
