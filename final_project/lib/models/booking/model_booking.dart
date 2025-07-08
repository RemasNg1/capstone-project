class ModelBooking {
  int? id;
  String? date;
  int? serviceProvidedId;
  int? serviceLocationId;
  String? status;
  String? userAuthId;
  ServicesProvided? servicesProvided;
  ServiceLocations? serviceLocations;

  ModelBooking({
    this.id,
    this.date,
    this.serviceProvidedId,
    this.serviceLocationId,
    this.status,
    this.userAuthId,
    this.servicesProvided,
    this.serviceLocations,
  });

  ModelBooking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    serviceProvidedId = json['service_provided_id'];
    serviceLocationId = json['service_location_id'];
    status = json['status'];
    userAuthId = json['user_auth_id'];
    servicesProvided = json['services_provided'] != null
        ? new ServicesProvided.fromJson(json['services_provided'])
        : null;
    serviceLocations = json['service_locations'] != null
        ? new ServiceLocations.fromJson(json['service_locations'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['service_provided_id'] = this.serviceProvidedId;
    data['service_location_id'] = this.serviceLocationId;
    data['status'] = this.status;
    data['user_auth_id'] = this.userAuthId;
    if (this.servicesProvided != null) {
      data['services_provided'] = this.servicesProvided!.toJson();
    }
    if (this.serviceLocations != null) {
      data['service_locations'] = this.serviceLocations!.toJson();
    }
    return data;
  }
}

class ServicesProvided {
  int? id;
  double? price;
  String? titleAr;
  String? titleEn;
  int? packageId;
  int? serviceId;
  int? providerId;
  String? descriptionAr;
  String? descriptionEn;

  ServicesProvided({
    this.id,
    this.price,
    this.titleAr,
    this.titleEn,
    this.packageId,
    this.serviceId,
    this.providerId,
    this.descriptionAr,
    this.descriptionEn,
  });

  ServicesProvided.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    packageId = json['package_id'];
    serviceId = json['service_id'];
    providerId = json['provider_id'];
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['title_ar'] = this.titleAr;
    data['title_en'] = this.titleEn;
    data['package_id'] = this.packageId;
    data['service_id'] = this.serviceId;
    data['provider_id'] = this.providerId;
    data['description_ar'] = this.descriptionAr;
    data['description_en'] = this.descriptionEn;
    return data;
  }
}

class ServiceLocations {
  int? id;
  int? cityId;
  double? latitude;
  double? longitude;
  int? regionId;
  int? serviceProvidedId;

  ServiceLocations({
    this.id,
    this.cityId,
    this.latitude,
    this.longitude,
    this.regionId,
    this.serviceProvidedId,
  });

  ServiceLocations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['city_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    regionId = json['region_id'];
    serviceProvidedId = json['service_provided_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['region_id'] = this.regionId;
    data['service_provided_id'] = this.serviceProvidedId;
    return data;
  }
}
