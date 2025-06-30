import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/data/dummy_data.dart';
import 'package:final_project/models/model.dart';
import 'package:final_project/screens/client/category_services/category_services_screen.dart';
import 'package:final_project/screens/client/favorites/favorite_screen.dart';
import 'package:final_project/screens/client/service_details/service_details_screen.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/widgets/categories_chip_list.dart';
import 'package:final_project/widgets/category_chip.dart';
import 'package:final_project/widgets/horizontal_service_card.dart';
import 'package:final_project/widgets/service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MyService> recommended = recommendedServices;
    final List<MyService> all = allServices;

    return Scaffold(
      backgroundColor: AppColors.white,
      // appBar: AppBar(
      //     title: Text(
      //       '',
      //       style: TextStyle(color: AppColors.dimGray, fontSize: 18),
      //     ),
      //     centerTitle: true,
      //     backgroundColor: AppColors.white,
      //   ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.h8,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/entry.png'),
                    ),
                    AppSpacing.w8,
                    Text(
                      '${'home.hello'.tr()}, Sarah',
                      style: AppTextStyles.interSize14(
                        context,
                      ).copyWith(color: AppColors.mediumGray),
                    ),
                  ],
                ),
              ),
              AppSpacing.h16,

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'home.question'.tr(),
                  style: AppTextStyles.interSize20(context).copyWith(
                    color: AppColors.blue,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
              ),
              AppSpacing.h16,

              // Search Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.lightGray.withOpacity(0.2),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: AppColors.mediumGray),
                      AppSpacing.w8,
                      Expanded(
                        child: TextField(
                          style: const TextStyle(color: AppColors.mediumGray),
                          decoration: InputDecoration(
                            hintText: 'home.search'.tr(),
                            hintStyle: const TextStyle(
                              color: AppColors.mediumGray,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/filter.svg',
                        width: 20,
                        color: AppColors.mediumGray,
                      ),
                    ],
                  ),
                ),
              ),
              AppSpacing.h24,

              // Categories
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'home.chooseCategory'.tr(),
                  style: AppTextStyles.interSize16(context).copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dummyCategories.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    final category = dummyCategories[index];
                    return CategoryChip(
                      category: category,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                CategoryServiceScreen(categoryName: 'Venues'),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              AppSpacing.h24,

              // Recommended
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'home.recommended'.tr(),
                  style: AppTextStyles.interSize16(context).copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue,
                  ),
                ),
              ),
              AppSpacing.h8,
              SizedBox(
                height: 224,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: recommended.length,
                  itemBuilder: (context, index) {
                    final service = recommendedServices[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ServiceCard(
                        title: service.name,
                        location: service.location,
                        imagePath: service.imageUrl,
                        rating: service.rating,
                        reviewCount: service.reviewCount,

                        width: 188,
                        height: 250,
                        showReviewCount: false,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ServiceDetailsScreen(),
                            ),
                          );
                        },
                        onIconPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FavoriteScreen(),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              AppSpacing.h16,

              // All Products
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'home.allServices'.tr(),
                  style: AppTextStyles.interSize16(context).copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue,
                  ),
                ),
              ),
              AppSpacing.h8,

              // All Products Vertical List
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 0),
                itemCount: all.length,
                itemBuilder: (context, index) {
                  final service = all[index];
                  return HorizontalServiceCard(
                    service: service,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceDetailsScreen(),
                        ),
                      );
                    },
                    onFavoriteTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoriteScreen(),
                        ),
                      );
                    },
                  );
                },
              ),
              AppSpacing.h24,
            ],
          ),
        ),
      ),
    );
  }
}
