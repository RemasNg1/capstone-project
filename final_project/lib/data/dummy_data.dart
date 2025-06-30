import 'package:final_project/models/model.dart';

final dummyService = DummyService(
  name: 'Royal Event Hall',
  location: 'Riyadh, Saudi Arabia',
  rating: 4.5,
  description: '''
The Venue can take up to 350 guests and it has a dining area with tables, chairs, and a buffet.
The building has three floors and a parking lot that can hold up to 200 cars.
The venue is equipped with bright yellow and white lighting and sound systems.

(Nyara Company is not responsible to remove the decorations, except the buffet and the client is obligated to pay the insurance if there was any damage at the venue)
''',
  mainImage:
      'https://cdn.saudigates.net/wp-content/uploads/2022/08/wedding_hall_in_riyadh-1-780x470.jpg',
  galleryImages: List.filled(
    6,
    'https://cdn.saudigates.net/wp-content/uploads/2022/08/wedding_hall_in_riyadh-1-780x470.jpg',
  ),
  unavailableDates: {
    DateTime(2025, 7, 24),
    DateTime(2025, 6, 25),
    DateTime(2025, 6, 28),
  },
  latitude: 24.7136,
  longitude: 46.6753,
  packages: [
    PackageModel(id: 'p1', title: 'Basic Package', price: 2000),
    PackageModel(id: 'p2', title: 'Silver Package', price: 3500),
    PackageModel(id: 'p3', title: 'Gold Package', price: 5000),
  ],
  reviews: [
    ReviewModel(
      name: 'Sara A.',
      imageUrl: 'https://randomuser.me/api/portraits/women/65.jpg',
      rating: 5,
      comment: 'The place was magical and the service was excellent!',
      date: 'June 2025',
    ),
    ReviewModel(
      name: 'Mohammed Z.',
      imageUrl: 'https://randomuser.me/api/portraits/men/75.jpg',
      rating: 4,
      comment: 'Very elegant and clean hall, perfect for special occasions.',
      date: 'May 2025',
    ),
  ],
  priceUnit: '/day',
  paymentDetails: PaymentDetails(
    venuePrice: 50000,
    buffetPrice: 15000,
    plannerPrice: 10000,
    tax: 750,
  ),
);

final List<PaymentMethod> dummyPaymentMethods = [
  PaymentMethod(name: 'Credit Card', iconPath: 'assets/icons/CreditCard.png'),
  PaymentMethod(name: 'Stc Pay', iconPath: 'assets/icons/stcPay.png'),
  PaymentMethod(
    name: 'Apple Pay',
    iconPath: 'assets/icons/ApplePay.png',
    isSelected: true,
  ),
  PaymentMethod(
    name: 'Add More',
    iconPath: 'assets/icons/add.png',
    isIconOnly: true,
  ),
];

final List<CategoryModel> dummyCategories = [
  CategoryModel(name: 'Venues', iconPath: 'assets/icons/CityHall.svg'),
  CategoryModel(name: 'Photographers', iconPath: 'assets/icons/CityHall.svg'),
  CategoryModel(name: 'Planners', iconPath: 'assets/icons/CityHall.svg'),
  CategoryModel(name: 'Buffet', iconPath: 'assets/icons/CityHall.svg'),
  CategoryModel(name: 'Hospitality', iconPath: 'assets/icons/CityHall.svg'),
  CategoryModel(name: 'Cars', iconPath: 'assets/icons/CityHall.svg'),
];

final List<MyService> recommendedServices = [
  MyService(
    id: '1',
    name: 'Nyara Venue',
    category: 'Venue',
    location: 'Riyadh',
    rating: 4.8,
    reviewCount: 185,
    price: 50000,
    imageUrl: dummyService.mainImage,
  ),
  MyService(
    id: '2',
    name: 'Elite Hall',
    category: 'Venue',
    location: 'Jeddah',
    rating: 4.6,
    reviewCount: 150,
    price: 45000,
    imageUrl: dummyService.mainImage,
  ),
  MyService(
    id: '3',
    name: 'Dream Palace',
    category: 'Venue',
    location: 'Dammam',
    rating: 4.7,
    reviewCount: 120,
    price: 47000,
    imageUrl: dummyService.mainImage,
  ),
];

final List<MyService> allServices = [
  MyService(
    id: '4',
    name: 'Royal Buffet',
    category: 'Buffet',
    location: 'Riyadh',
    rating: 4.5,
    reviewCount: 200,
    price: 15000,
    imageUrl: dummyService.mainImage,
  ),
  MyService(
    id: '5',
    name: 'Mas Pro Studio',
    category: 'Photographers',
    location: 'Jeddah',
    rating: 4.2,
    reviewCount: 220,
    price: 10000,
    imageUrl: dummyService.mainImage,
  ),
  MyService(
    id: '6',
    name: 'Opal Hall',
    category: 'Venue',
    location: 'Khobar',
    rating: 4.3,
    reviewCount: 180,
    price: 52000,
    imageUrl: dummyService.mainImage,
  ),
  MyService(
    id: '7',
    name: 'Luxury Drive',
    category: 'Car Rent',
    location: 'Riyadh',
    rating: 4.0,
    reviewCount: 100,
    price: 8000,
    imageUrl: dummyService.mainImage,
  ),
];
