class PackageModel {
  final String id;
  final String title;
  final int price;

  PackageModel({required this.id, required this.title, required this.price});
}

class ReviewModel {
  final String name;
  final String imageUrl;
  final int rating;
  final String comment;
  final String date;

  ReviewModel({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.comment,
    required this.date,
  });
}

class DummyService {
  final String name;
  final String location;
  final double rating;
  final String description;
  final String mainImage;
  final List<String> galleryImages;
  final Set<DateTime> unavailableDates;
  final double latitude;
  final double longitude;
  final List<PackageModel> packages;
  final List<ReviewModel> reviews;
  final String priceUnit;
  final PaymentDetails paymentDetails;

  DummyService({
    required this.name,
    required this.location,
    required this.rating,
    required this.description,
    required this.mainImage,
    required this.galleryImages,
    required this.unavailableDates,
    required this.latitude,
    required this.longitude,
    required this.packages,
    required this.reviews,
    required this.priceUnit,
    required this.paymentDetails,
  });
}

class PaymentDetails {
  final int venuePrice;
  final int buffetPrice;
  final int plannerPrice;
  final int tax;

  PaymentDetails({
    required this.venuePrice,
    required this.buffetPrice,
    required this.plannerPrice,
    required this.tax,
  });

  int get total => venuePrice + buffetPrice + plannerPrice + tax;
}

class PaymentMethod {
  final String name;
  final String iconPath;
  final bool isSelected;
  final bool isIconOnly;

  PaymentMethod({
    required this.name,
    required this.iconPath,
    this.isSelected = false,
    this.isIconOnly = false,
  });
}

class MyService {
  final String id;
  final String name;
  final String category;
  final String location;
  final double rating;
  final int reviewCount;
  final int price;
  final String imageUrl;

  MyService({
    required this.id,
    required this.name,
    required this.category,
    required this.location,
    required this.rating,
    required this.reviewCount,
    required this.price,
    required this.imageUrl,
  });

  factory MyService.fromJson(Map<String, dynamic> json) {
    return MyService(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      location: json['location'],
      rating: (json['rating'] ?? 0).toDouble(),
      reviewCount: json['review_count'] ?? 0,
      price: json['price'],
      imageUrl: json['image_url'],
    );
  }
}

class CategoryModel {
  final String name;
  final String iconPath;

  CategoryModel({required this.name, required this.iconPath});
}
