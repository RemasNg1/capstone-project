class ProviderTempModel {
  final int id;
  final String name;
  final String email;
  final String avatar;
  final String description;
  final String iban;
  final String notificationId;
  final String commercialRegistrationCertificate;

  ProviderTempModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.description,
    required this.iban,
    required this.notificationId,
    required this.commercialRegistrationCertificate,
  });

  //   is_deleted varchar(255)
}

List<ProviderTempModel> providers = [
  ProviderTempModel(
    id: 1,
    name: "provider:Opal Venue",
    email: "OpalVenue@omar.com",
    avatar:
        "https://images.unsplash.com/photo-1599566150163-29194dcaad36?crop=faces&fit=crop&w=200&h=200",
    description:
        "The Venue can take up to 350 guests and it has a dining area with tables, chairs, and a buffet.",
    iban: "iban",
    notificationId: "notificationId",
    commercialRegistrationCertificate: "commercialRegistrationCertificate",
  ),
];
