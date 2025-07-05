// import 'package:easy_localization/easy_localization.dart';
// import 'package:final_project/data/dummy_data.dart';
// import 'package:final_project/models/model.dart';
// import 'package:final_project/screens/client/category_services/category_services_screen.dart';
// import 'package:final_project/screens/client/favorites/favorite_screen.dart';
// import 'package:final_project/screens/client/service_details/service_details_screen.dart';
// import 'package:final_project/style/app_colors.dart';
// import 'package:final_project/style/app_spacing.dart';
// import 'package:final_project/style/app_text_styles.dart';
// import 'package:final_project/widgets/categories_chip_list.dart';
// import 'package:final_project/widgets/category_chip.dart';
// import 'package:final_project/widgets/horizontal_service_card.dart';
// import 'package:final_project/widgets/service_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<MyService> recommended = recommendedServices;
//     final List<MyService> all = allServices;

//     return Scaffold(
//       backgroundColor: AppColors.white,
//       // appBar: AppBar(
//       //     title: Text(
//       //       '',
//       //       style: TextStyle(color: AppColors.dimGray, fontSize: 18),
//       //     ),
//       //     centerTitle: true,
//       //     backgroundColor: AppColors.white,
//       //   ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AppSpacing.h8,
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   children: [
//                     const CircleAvatar(
//                       radius: 20,
//                       backgroundImage: AssetImage('assets/images/entry.png'),
//                     ),
//                     AppSpacing.w8,
//                     Text(
//                       '${'home.hello'.tr()}, Sarah',
//                       style: AppTextStyles.interSize14(
//                         context,
//                       ).copyWith(color: AppColors.mediumGray),
//                     ),
//                   ],
//                 ),
//               ),
//               AppSpacing.h16,

//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Text(
//                   'home.question'.tr(),
//                   style: AppTextStyles.interSize20(context).copyWith(
//                     color: AppColors.blue,
//                     fontWeight: FontWeight.bold,
//                     height: 1.3,
//                   ),
//                 ),
//               ),
//               AppSpacing.h16,

//               // Search Field
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   height: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: AppColors.lightGray.withOpacity(0.2),
//                   ),
//                   child: Row(
//                     children: [
//                       const Icon(Icons.search, color: AppColors.mediumGray),
//                       AppSpacing.w8,
//                       Expanded(
//                         child: TextField(
//                           style: const TextStyle(color: AppColors.mediumGray),
//                           decoration: InputDecoration(
//                             hintText: 'home.search'.tr(),
//                             hintStyle: const TextStyle(
//                               color: AppColors.mediumGray,
//                             ),
//                             border: InputBorder.none,
//                             isDense: true,
//                           ),
//                         ),
//                       ),
//                       SvgPicture.asset(
//                         'assets/icons/filter.svg',
//                         width: 20,
//                         color: AppColors.mediumGray,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               AppSpacing.h24,

//               // Categories
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Text(
//                   'home.chooseCategory'.tr(),
//                   style: AppTextStyles.interSize16(context).copyWith(
//                     fontWeight: FontWeight.w600,
//                     color: AppColors.blue,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 12),

//               SizedBox(
//                 height: 60,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: dummyCategories.length,
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   itemBuilder: (context, index) {
//                     final category = dummyCategories[index];
//                     return CategoryChip(
//                       category: category,
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) =>
//                                 CategoryServiceScreen(categoryName: 'Venues'),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),

//               AppSpacing.h24,

//               // Recommended
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Text(
//                   'home.recommended'.tr(),
//                   style: AppTextStyles.interSize16(context).copyWith(
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.blue,
//                   ),
//                 ),
//               ),
//               AppSpacing.h8,
//               SizedBox(
//                 height: 224,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   itemCount: recommended.length,
//                   itemBuilder: (context, index) {
//                     final service = recommendedServices[index];
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 12),
//                       child: ServiceCard(
//                         title: service.name,
//                         location: service.location,
//                         imagePath: service.imageUrl,
//                         rating: service.rating,
//                         reviewCount: service.reviewCount,

//                         width: 188,
//                         height: 250,
//                         showReviewCount: false,
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ServiceDetailsScreen(),
//                             ),
//                           );
//                         },
//                         onIconPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => FavoriteScreen(),
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               AppSpacing.h16,

//               // All Products
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Text(
//                   'home.allServices'.tr(),
//                   style: AppTextStyles.interSize16(context).copyWith(
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.blue,
//                   ),
//                 ),
//               ),
//               AppSpacing.h8,

//               // All Products Vertical List
//               ListView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 padding: const EdgeInsets.symmetric(horizontal: 0),
//                 itemCount: all.length,
//                 itemBuilder: (context, index) {
//                   final service = all[index];
//                   return HorizontalServiceCard(
//                     service: service,
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ServiceDetailsScreen(),
//                         ),
//                       );
//                     },
//                     onFavoriteTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => FavoriteScreen(),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//               AppSpacing.h24,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/data/dummy_data.dart';
import 'package:final_project/models/model.dart';
import 'package:final_project/screens/client/booking_flow/service_details_screen.dart';
import 'package:final_project/screens/client/category_services/category_services_screen.dart';
// import 'package:final_project/screens/client/category_services/category_services_screen.dart';
import 'package:final_project/screens/client/favorites/favorite_screen.dart';
import 'package:final_project/screens/client/home/recommended_card.dart';
import 'package:final_project/screens/client/home/mycard.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/widgets/category_chip.dart';
import 'package:final_project/widgets/service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(FetchServicesProvidedEvent()),
      child: Builder(
        builder: (context) {
          final bloc = context.read<HomeBloc>();

          return Scaffold(
            body: SafeArea(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeLoaded) {
                    final servicesProvided = state.servicesProvided;
                    final services = state.services;
                    final recommended = servicesProvided.length > 8
                        ? servicesProvided.sublist(0, 8)
                        : servicesProvided;

                    return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("data"),
                          AppSpacing.h8,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(
                                    'assets/images/entry.png',
                                  ),
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
                              style: AppTextStyles.interSize20(context)
                                  .copyWith(
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.bold,
                                    height: 1.3,
                                  ),
                            ),
                          ),
                          AppSpacing.h16,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColors.lightGray.withOpacity(0.2),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.search,
                                    color: AppColors.mediumGray,
                                  ),
                                  AppSpacing.w8,
                                  Expanded(
                                    child: TextField(
                                      style: const TextStyle(
                                        color: AppColors.mediumGray,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'home.search'.tr(),
                                        hintStyle: const TextStyle(
                                          color: AppColors.mediumGray,
                                        ),
                                        border: InputBorder.none,
                                        isDense: true,
                                      ),
                                      onChanged: (value) {
                                        final isArabic =
                                            context.locale.languageCode == 'ar';
                                        bloc.add(
                                          SearchServicesEvent(value, isArabic),
                                        );
                                      },
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'home.chooseCategory'.tr(),
                              style: AppTextStyles.interSize16(context)
                                  .copyWith(
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
                              itemCount: services.length,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              itemBuilder: (context, index) {
                                final category = dummyCategories[index];
                                final categoryType = services[index].nameEn;

                                return CategoryChip(
                                  category: category,

                                  // categoryName: categoryName.type!,
                                  onTap: () {
                                    bloc.add(
                                      FilterByCategoryEvent(categoryType!),
                                    );
                                    Future.delayed(
                                      const Duration(milliseconds: 100),
                                      () {
                                        final filtered = bloc.filteredServices;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                CategoryServiceScreen(
                                                  categoryName: categoryType,
                                                  filteredServices: filtered,
                                                ),
                                          ),
                                        );
                                      },
                                    );

                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (_) => CategoryServiceScreen(
                                    //       categoryName: 'Venues',
                                    //     ),
                                    //   ),
                                    // );
                                  },
                                );
                              },
                            ),
                          ),
                          AppSpacing.h24,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'home.recommended'.tr(),
                              style: AppTextStyles.interSize16(context)
                                  .copyWith(
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              itemCount: recommended.length,
                              itemBuilder: (context, index) {
                                final service = recommended[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: RecommendedCard(
                                    title: service.titleAr ?? '',
                                    location:
                                        service.locations!.first.city?.nameAr ??
                                        '',
                                    imagePath:
                                        service.servicImage?.first.imageUrl ??
                                        '',
                                    rating:
                                        service.ratings?.first.rating ?? 0.0,
                                    reviewCount: 0,
                                    width: 188,
                                    height: 250,
                                    showReviewCount: false,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ServiceDetailsScreen(
                                                service: service,
                                              ),
                                        ),
                                      );
                                    },
                                    onIconPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              FavoriteScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          AppSpacing.h16,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'home.allServices'.tr(),
                              style: AppTextStyles.interSize16(context)
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blue,
                                  ),
                            ),
                          ),
                          AppSpacing.h8,
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            itemCount: servicesProvided.length,
                            itemBuilder: (context, index) {
                              final service = servicesProvided[index];
                              return Mycard(
                                service: service,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ServiceDetailsScreen(
                                            service: service,
                                          ),
                                    ),
                                  );
                                },
                                onFavoriteTap: () {
                                  // bloc.add(
                                  //   ToggleFavoriteEvent(serviceId: service.id!),
                                  // );
                                },
                              );
                            },
                          ),
                          AppSpacing.h24,
                        ],
                      ),
                    );
                  } else if (state is TestingHomeError) {
                    return Center(child: Text('Error: ${state.message}'));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
