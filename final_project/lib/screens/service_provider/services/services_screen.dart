import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/data/dummy_data.dart';
import 'package:final_project/models/model.dart';
import 'package:final_project/screens/service_provider/add_new_service/add_new_service_screen.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/widgets/service_provider_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MyService> services = [
      MyService(
        id: "1",
        name: dummyService.name,
        category: 'Venue',
        location: dummyService.location,
        rating: dummyService.rating,
        reviewCount: dummyService.reviews.length,
        price: dummyService.paymentDetails.venuePrice,
        imageUrl: dummyService.mainImage,
      ),
      MyService(
        id: "2",
        name: dummyService.name,
        category: 'Venue',
        location: dummyService.location,
        rating: dummyService.rating,
        reviewCount: dummyService.reviews.length,
        price: dummyService.paymentDetails.venuePrice,
        imageUrl: dummyService.mainImage,
      ),
      MyService(
        id: "3",
        name: dummyService.name,
        category: 'Venue',
        location: dummyService.location,
        rating: dummyService.rating,
        reviewCount: dummyService.reviews.length,
        price: dummyService.paymentDetails.venuePrice,
        imageUrl: dummyService.mainImage,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'services.myServices'.tr(),
          style: const TextStyle(color: AppColors.dimGray, fontSize: 18),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...services.map(
            (service) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ServiceProviderCard(
                image: service.imageUrl,
                name: service.name,
                category: service.category,
                price: '${service.price} ${'SAR'}',
                onDelete: () {
                  // TODO
                },
                onEdit: () {
                  // TODO
                },
              ),
            ),
          ),

          // "Add More"
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNewServiceScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightGray),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/add.svg',
                    width: 24,
                    height: 24,
                    color: AppColors.mediumGray,
                  ),

                  AppSpacing.w4,
                  Text(
                    'services.addMore'.tr(),
                    style: const TextStyle(
                      color: AppColors.mediumGray,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
