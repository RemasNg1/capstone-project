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
