class ServiceRequestModel {
  int? id;
  String? date;
  int? serviceProvidedId;
  int? serviceLocationId;
  String? status;
  String? userAuthId;
  ServicesProvided? servicesProvided;

  ServiceRequestModel(
      {this.id,
      this.date,
      this.serviceProvidedId,
      this.serviceLocationId,
      this.status,
      this.userAuthId,
      this.servicesProvided});

  ServiceRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    serviceProvidedId = json['service_provided_id'];
    serviceLocationId = json['service_location_id'];
    status = json['status'];
    userAuthId = json['user_auth_id'];
    servicesProvided = json['services_provided'] != null
        ? new ServicesProvided.fromJson(json['services_provided'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['service_provided_id'] = this.serviceProvidedId;
    data['service_location_id'] = this.serviceLocationId;
    data['status'] = this.status;
    data['user_auth_id'] = this.userAuthId;
    if (this.servicesProvided != null) {
      data['services_provided'] = this.servicesProvided!.toJson();
    }
    return data;
  }
}

class ServicesProvided {
  int? id;
  int? price;
  String? titleAr;
  String? titleEn;
  Null? packageId;
  int? serviceId;
  int? providerId;
  String? descriptionAr;
  String? descriptionEn;
  String? providerAuthId;

  ServicesProvided(
      {this.id,
      this.price,
      this.titleAr,
      this.titleEn,
      this.packageId,
      this.serviceId,
      this.providerId,
      this.descriptionAr,
      this.descriptionEn,
      this.providerAuthId});

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
    providerAuthId = json['provider_auth_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['title_ar'] = this.titleAr;
    data['title_en'] = this.titleEn;
    data['package_id'] = this.packageId;
    data['service_id'] = this.serviceId;
    data['provider_id'] = this.providerId;
    data['description_ar'] = this.descriptionAr;
    data['description_en'] = this.descriptionEn;
    data['provider_auth_id'] = this.providerAuthId;
    return data;
  }
}
