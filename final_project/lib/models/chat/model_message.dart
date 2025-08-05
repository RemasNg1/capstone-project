class ModelMessage {
  int? id;
  String? content;
  DateTime? date;
  String? status;
  String? owner;
  String? userAuthId;
  String? providerAuthId;
  Providers? providers;
  User? user;

  ModelMessage({
    this.id,
    this.content,
    this.date,
    this.status,
    this.owner,
    this.userAuthId,
    this.providerAuthId,
    this.providers,
    this.user,
  });

  ModelMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    date = DateTime.tryParse(json['created_at'] ?? '');
    status = json['status'];
    owner = json['owner'];
    userAuthId = json['user_auth_id'];
    providerAuthId = json['provider_auth_id'];
    providers = json['providers'] != null
        ? new Providers.fromJson(json['providers'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['created_at'] = this.date?.toIso8601String();
    data['status'] = this.status;
    data['owner'] = this.owner;
    data['user_auth_id'] = this.userAuthId;
    data['provider_auth_id'] = this.providerAuthId;
    if (this.providers != null) {
      data['providers'] = this.providers!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Providers {
  String? avatar;
  String? nameAr;
  String? nameEn;

  Providers({this.avatar, this.nameAr, this.nameEn});

  Providers.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    return data;
  }
}

class User {
  String? name;
  String? avatar;

  User({this.name, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    return data;
  }
}
