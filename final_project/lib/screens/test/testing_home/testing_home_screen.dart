// import 'package:final_project/models/test_service_provided/service_provided_model.dart';
// import 'package:final_project/style/app_colors.dart';
// import 'package:final_project/style/app_spacing.dart';
// import 'package:final_project/style/app_text_styles.dart';
// import 'package:final_project/widgets/star_rating_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:final_project/screens/test/testing_home/bloc/testing_home_bloc.dart'; // عدل المسار حسب مشروعك

// class TestingHomeScreen extends StatelessWidget {
//   const TestingHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => TestingHomeBloc()..add(FetchServicesEvent()),
//       child: Scaffold(
//         appBar: AppBar(title: const Text('Testing Home')),
//         body: BlocBuilder<TestingHomeBloc, TestingHomeState>(
//           builder: (context, state) {
//             if (state is TestingHomeInitial || state is TestingHomeLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is TestingHomeLoaded) {
//               final List<NewServiceProvidedModel> services = state.services;

//               if (services.isEmpty) {
//                 return const Center(child: Text('لا توجد خدمات لعرضها'));
//               }

//               return ListView.builder(
//                 padding: const EdgeInsets.all(16),
//                 itemCount: services.length,
//                 itemBuilder: (context, index) {
//                   final service = services[index];

//                   return InkWell(
//                     onTap: () {
//                       // تعامل مع الضغط هنا
//                     },
//                     borderRadius: BorderRadius.circular(16),
//                     child: Container(
//                       padding: const EdgeInsets.all(12),
//                       margin: const EdgeInsets.symmetric(
//                         vertical: 8,
//                         horizontal: 16,
//                       ),
//                       decoration: BoxDecoration(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: [
//                           BoxShadow(
//                             color: AppColors.lightGray.withOpacity(0.3),
//                             blurRadius: 10,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child:
//                                 (service.servicImageUrl != null &&
//                                     service.servicImageUrl!.isNotEmpty)
//                                 ? Image.network(
//                                     service.servicImageUrl!,
//                                     height: 80,
//                                     width: 100,
//                                     fit: BoxFit.cover,
//                                     errorBuilder: (_, __, ___) => Container(
//                                       color: Colors.grey,
//                                       width: 100,
//                                       height: 80,
//                                     ),
//                                   )
//                                 : Container(
//                                     width: 100,
//                                     height: 80,
//                                     color: Colors.grey.shade300,
//                                     child: const Icon(
//                                       Icons.image,
//                                       size: 40,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                           ),
//                           AppSpacing.w8,
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   service.title ?? 'بدون عنوان',
//                                   style: AppTextStyles.interSize16(context)
//                                       .copyWith(
//                                         fontWeight: FontWeight.bold,
//                                         color: AppColors.black,
//                                       ),
//                                 ),
//                                 AppSpacing.h4,
//                                 if (service.serviceName != null &&
//                                     service.serviceName!.isNotEmpty)
//                                   Text(
//                                     service.serviceName!,
//                                     style: AppTextStyles.interSize14(
//                                       context,
//                                     ).copyWith(color: AppColors.mediumGray),
//                                   ),
//                                 if (service.description != null &&
//                                     service.description!.isNotEmpty)
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 4),
//                                     child: Text(
//                                       service.description!,
//                                       maxLines: 2,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: AppTextStyles.interSize12(
//                                         context,
//                                       ).copyWith(color: AppColors.mediumGray),
//                                     ),
//                                   ),
//                                 const SizedBox(height: 8),
//                                 Row(
//                                   children: [
//                                     StarRatingWidget(
//                                       rating: service.averageRating,
//                                     ),
//                                     const SizedBox(width: 6),
//                                     // إذا عندك عدد التقييمات حط هنا، وإلا امسحه أو علقه
//                                     // Text(
//                                     //   '(${service.reviewCount ?? 0} ratings)',
//                                     //   style: AppTextStyles.interSize12(context).copyWith(color: AppColors.lightGray),
//                                     // ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),

//                           Column(
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   // تعامل مع تفضيل الخدمة (الفافوريت)
//                                 },
//                                 child: const Icon(
//                                   Icons.favorite_border,
//                                   color: AppColors.mediumGray,
//                                 ),
//                               ),
//                               const SizedBox(height: 12),
//                               const Icon(
//                                 Icons.arrow_forward_ios,
//                                 size: 16,
//                                 color: AppColors.mediumGray,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             } else if (state is TestingHomeError) {
//               return Center(child: Text('حدث خطأ: ${state.message}'));
//             } else {
//               return const Center(child: Text('حالة غير معروفة'));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:easy_localization/easy_localization.dart';
// import 'package:final_project/data/dummy_data.dart';
// import 'package:final_project/models/model.dart';
// import 'package:final_project/screens/client/category_services/category_services_screen.dart';
// import 'package:final_project/screens/client/favorites/favorite_screen.dart';
// import 'package:final_project/screens/client/service_details/service_details_screen.dart';
// import 'package:final_project/screens/test/testing_home/mycard.dart';
// import 'package:final_project/style/app_colors.dart';
// import 'package:final_project/style/app_spacing.dart';
// import 'package:final_project/style/app_text_styles.dart';
// import 'package:final_project/widgets/category_chip.dart';
// import 'package:final_project/widgets/service_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// // Bloc imports
// import 'bloc/testing_home_bloc.dart';

// class TestingHomeScreen extends StatelessWidget {
//   const TestingHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<MyService> recommended = recommendedServices;

//     return BlocProvider(
//       create: (context) => TestingHomeBloc()..add(FetchServicesEvent()),
//       child: Scaffold(
//         backgroundColor: AppColors.white,
//         body: SafeArea(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AppSpacing.h8,
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Row(
//                     children: [
//                       const CircleAvatar(
//                         radius: 20,
//                         backgroundImage: AssetImage('assets/images/entry.png'),
//                       ),
//                       AppSpacing.w8,
//                       Text(
//                         '${'home.hello'.tr()}, Sarah',
//                         style: AppTextStyles.interSize14(
//                           context,
//                         ).copyWith(color: AppColors.mediumGray),
//                       ),
//                     ],
//                   ),
//                 ),
//                 AppSpacing.h16,

//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Text(
//                     'home.question'.tr(),
//                     style: AppTextStyles.interSize20(context).copyWith(
//                       color: AppColors.blue,
//                       fontWeight: FontWeight.bold,
//                       height: 1.3,
//                     ),
//                   ),
//                 ),
//                 AppSpacing.h16,

//                 // Search Field
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     height: 50,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       color: AppColors.lightGray.withOpacity(0.2),
//                     ),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.search, color: AppColors.mediumGray),
//                         AppSpacing.w8,
//                         Expanded(
//                           child: TextField(
//                             style: const TextStyle(color: AppColors.mediumGray),
//                             decoration: InputDecoration(
//                               hintText: 'home.search'.tr(),
//                               hintStyle: const TextStyle(
//                                 color: AppColors.mediumGray,
//                               ),
//                               border: InputBorder.none,
//                               isDense: true,
//                             ),
//                           ),
//                         ),
//                         SvgPicture.asset(
//                           'assets/icons/filter.svg',
//                           width: 20,
//                           color: AppColors.mediumGray,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 AppSpacing.h24,

//                 // Categories
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Text(
//                     'home.chooseCategory'.tr(),
//                     style: AppTextStyles.interSize16(context).copyWith(
//                       fontWeight: FontWeight.w600,
//                       color: AppColors.blue,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 12),

//                 SizedBox(
//                   height: 60,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: dummyCategories.length,
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     itemBuilder: (context, index) {
//                       final category = dummyCategories[index];
//                       return CategoryChip(
//                         category: category,
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) =>
//                                   CategoryServiceScreen(categoryName: 'Venues'),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),

//                 AppSpacing.h24,

//                 // Recommended
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Text(
//                     'home.recommended'.tr(),
//                     style: AppTextStyles.interSize16(context).copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.blue,
//                     ),
//                   ),
//                 ),
//                 AppSpacing.h8,
//                 SizedBox(
//                   height: 224,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     itemCount: recommended.length,
//                     itemBuilder: (context, index) {
//                       final service = recommended[index];
//                       return Padding(
//                         padding: const EdgeInsets.only(right: 12),
//                         child: ServiceCard(
//                           title: service.name,
//                           location: service.location,
//                           imagePath: service.imageUrl,
//                           rating: service.rating,
//                           reviewCount: service.reviewCount,
//                           width: 188,
//                           height: 250,
//                           showReviewCount: false,
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ServiceDetailsScreen(),
//                               ),
//                             );
//                           },
//                           onIconPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => FavoriteScreen(),
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 AppSpacing.h16,

//                 // All Services using Bloc
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Text(
//                     'home.allServices'.tr(),
//                     style: AppTextStyles.interSize16(context).copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.blue,
//                     ),
//                   ),
//                 ),
//                 AppSpacing.h8,

//                 BlocBuilder<TestingHomeBloc, TestingHomeState>(
//                   builder: (context, state) {
//                     if (state is TestingHomeLoading) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else if (state is TestingHomeLoaded) {
//                       final services = state.services;

//                       return ListView.builder(
//                         physics: const NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//                         padding: const EdgeInsets.symmetric(horizontal: 0),
//                         itemCount: services.length,
//                         itemBuilder: (context, index) {
//                           final service = services[index];
//                           return Mycard(
//                             service: service,
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => ServiceDetailsScreen(),
//                                 ),
//                               );
//                             },
//                             onFavoriteTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => FavoriteScreen(),
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                       );
//                     } else if (state is TestingHomeError) {
//                       print(state.message);
//                       return Center(child: Text('حدث خطأ: ${state.message}'));
//                     } else {
//                       return const SizedBox();
//                     }
//                   },
//                 ),

//                 AppSpacing.h24,
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:easy_localization/easy_localization.dart';
// import 'package:final_project/data/dummy_data.dart';
// import 'package:final_project/models/model.dart';
// import 'package:final_project/screens/client/booking_flow/service_details_screen.dart';
// import 'package:final_project/screens/client/category_services/category_services_screen.dart';
// import 'package:final_project/screens/client/favorites/favorite_screen.dart';
// import 'package:final_project/screens/client/service_details/service_details_screen.dart';
// import 'package:final_project/screens/test/service_card.dart';
// import 'package:final_project/screens/test/service_details_screen.dart';
// import 'package:final_project/screens/test/testing_home/mycard.dart';
// import 'package:final_project/style/app_colors.dart';
// import 'package:final_project/style/app_spacing.dart';
// import 'package:final_project/style/app_text_styles.dart';
// import 'package:final_project/widgets/category_chip.dart';
// import 'package:final_project/widgets/service_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'bloc/testing_home_bloc.dart';

// class TestingHomeScreen extends StatelessWidget {
//   const TestingHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => TestingHomeBloc()..add(FetchServicesEvent()),
//       child: Scaffold(
//         // backgroundColor: AppColors.white,
//         body: SafeArea(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(vertical: 12),
//             child: BlocBuilder<TestingHomeBloc, TestingHomeState>(
//               builder: (context, state) {
//                 final bloc = context.read<TestingHomeBloc>();
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AppSpacing.h8,
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Row(
//                         children: [
//                           const CircleAvatar(
//                             radius: 20,
//                             backgroundImage: AssetImage(
//                               'assets/images/entry.png',
//                             ),
//                           ),
//                           AppSpacing.w8,
//                           Text(
//                             '${'home.hello'.tr()}, Sarah',
//                             style: AppTextStyles.interSize14(
//                               context,
//                             ).copyWith(color: AppColors.mediumGray),
//                           ),
//                         ],
//                       ),
//                     ),
//                     AppSpacing.h16,
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Text(
//                         'home.question'.tr(),
//                         style: AppTextStyles.interSize20(context).copyWith(
//                           color: AppColors.blue,
//                           fontWeight: FontWeight.bold,
//                           height: 1.3,
//                         ),
//                       ),
//                     ),
//                     AppSpacing.h16,
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         height: 50,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: AppColors.lightGray.withOpacity(0.2),
//                         ),
//                         child: Row(
//                           children: [
//                             const Icon(
//                               Icons.search,
//                               color: AppColors.mediumGray,
//                             ),
//                             AppSpacing.w8,
//                             Expanded(
//                               child: TextField(
//                                 style: const TextStyle(
//                                   color: AppColors.mediumGray,
//                                 ),
//                                 decoration: InputDecoration(
//                                   hintText: 'home.search'.tr(),
//                                   hintStyle: const TextStyle(
//                                     color: AppColors.mediumGray,
//                                   ),
//                                   border: InputBorder.none,
//                                   isDense: true,
//                                 ),
//                                 onChanged: (value) {
//                                   final isArabic =
//                                       context.locale.languageCode == 'ar';
//                                   bloc.add(
//                                     SearchServicesEvent(value, isArabic),
//                                   );
//                                 },
//                               ),
//                             ),
//                             SvgPicture.asset(
//                               'assets/icons/filter.svg',
//                               width: 20,
//                               color: AppColors.mediumGray,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     AppSpacing.h24,
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Text(
//                         'home.chooseCategory'.tr(),
//                         style: AppTextStyles.interSize16(context).copyWith(
//                           fontWeight: FontWeight.w600,
//                           color: AppColors.blue,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     SizedBox(
//                       height: 60,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: dummyCategories.length,
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         itemBuilder: (context, index) {
//                           final category = dummyCategories[index];
//                           return CategoryChip(
//                             category: category,
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (_) => CategoryServiceScreen(
//                                     categoryName: 'Venues',
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                     AppSpacing.h24,

//                     BlocBuilder<TestingHomeBloc, TestingHomeState>(
//                       builder: (context, state) {
//                         if (state is TestingHomeLoading) {
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         } else if (state is TestingHomeLoaded) {
//                           final services = state.services;

//                           final recommended = services.length > 8
//                               ? services.sublist(0, 8)
//                               : services;

//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 16,
//                                 ),
//                                 child: Text(
//                                   'home.recommended'.tr(),
//                                   style: AppTextStyles.interSize16(context)
//                                       .copyWith(
//                                         fontWeight: FontWeight.bold,
//                                         color: AppColors.blue,
//                                       ),
//                                 ),
//                               ),
//                               AppSpacing.h8,
//                               SizedBox(
//                                 height: 224,
//                                 child: ListView.builder(
//                                   scrollDirection: Axis.horizontal,
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 16,
//                                   ),
//                                   itemCount: recommended.length,
//                                   itemBuilder: (context, index) {
//                                     final service = recommended[index];
//                                     return Padding(
//                                       padding: const EdgeInsets.only(right: 12),
//                                       child: RecommendedCard(
//                                         title: service.titleAr ?? '',
//                                         location:
//                                             service
//                                                 .locations!
//                                                 .first
//                                                 .city
//                                                 ?.nameAr ??
//                                             '',
//                                         imagePath:
//                                             service
//                                                 .servicImage
//                                                 ?.first
//                                                 .imageUrl ??
//                                             '',
//                                         rating:
//                                             service.ratings!.first.rating ?? 0,
//                                         reviewCount: 0,
//                                         width: 188,
//                                         height: 250,
//                                         showReviewCount: false,
//                                         onTap: () {
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) =>
//                                                   TestServiceDetailsScreen(
//                                                     service: service,
//                                                   ),
//                                             ),
//                                           );
//                                         },
//                                         onIconPressed: () {
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) =>
//                                                   FavoriteScreen(),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                               AppSpacing.h16,
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 16,
//                                 ),
//                                 child: Text(
//                                   'home.allServices'.tr(),
//                                   style: AppTextStyles.interSize16(context)
//                                       .copyWith(
//                                         fontWeight: FontWeight.bold,
//                                         color: AppColors.blue,
//                                       ),
//                                 ),
//                               ),
//                               AppSpacing.h8,
//                               ListView.builder(
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 shrinkWrap: true,
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 0,
//                                 ),
//                                 itemCount: services.length,
//                                 itemBuilder: (context, index) {
//                                   final service = services[index];
//                                   return Mycard(
//                                     service: service,
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               TestServiceDetailsScreen(
//                                                 service: service,
//                                               ),
//                                         ),
//                                       );
//                                     },
//                                     onFavoriteTap: () {
//                                       // bloc.add(
//                                       //   ToggleFavoriteEvent(
//                                       //     serviceId: service.id!,
//                                       //   ),
//                                       // );
//                                       // Navigator.push(
//                                       //   context,
//                                       //   MaterialPageRoute(
//                                       //     builder: (context) =>
//                                       //         FavoriteScreen(),
//                                       //   ),
//                                       // );
//                                     },
//                                   );
//                                 },
//                               ),
//                             ],
//                           );
//                         } else if (state is TestingHomeError) {
//                           return Center(child: Text('Error: ${state.message}'));
//                         } else {
//                           return const SizedBox();
//                         }
//                       },
//                     ),
//                     AppSpacing.h24,
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TestingHomeScreen extends StatelessWidget {
//   const TestingHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => TestingHomeBloc()..add(FetchServicesProvidedEvent()),
//       child: Builder(
//         builder: (context) {
//           final bloc = context.read<TestingHomeBloc>();

//           return Scaffold(
//             body: SafeArea(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(vertical: 12),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AppSpacing.h8,
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Row(
//                         children: [
//                           const CircleAvatar(
//                             radius: 20,
//                             backgroundImage: AssetImage(
//                               'assets/images/entry.png',
//                             ),
//                           ),
//                           AppSpacing.w8,
//                           Text(
//                             '${'home.hello'.tr()}, Sarah',
//                             style: AppTextStyles.interSize14(
//                               context,
//                             ).copyWith(color: AppColors.mediumGray),
//                           ),
//                         ],
//                       ),
//                     ),
//                     AppSpacing.h16,
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Text(
//                         'home.question'.tr(),
//                         style: AppTextStyles.interSize20(context).copyWith(
//                           color: AppColors.blue,
//                           fontWeight: FontWeight.bold,
//                           height: 1.3,
//                         ),
//                       ),
//                     ),
//                     AppSpacing.h16,
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         height: 50,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: AppColors.lightGray.withOpacity(0.2),
//                         ),
//                         child: Row(
//                           children: [
//                             const Icon(
//                               Icons.search,
//                               color: AppColors.mediumGray,
//                             ),
//                             AppSpacing.w8,
//                             Expanded(
//                               child: TextField(
//                                 style: const TextStyle(
//                                   color: AppColors.mediumGray,
//                                 ),
//                                 decoration: InputDecoration(
//                                   hintText: 'home.search'.tr(),
//                                   hintStyle: const TextStyle(
//                                     color: AppColors.mediumGray,
//                                   ),
//                                   border: InputBorder.none,
//                                   isDense: true,
//                                 ),
//                                 onChanged: (value) {
//                                   final isArabic =
//                                       context.locale.languageCode == 'ar';
//                                   bloc.add(
//                                     SearchServicesEvent(value, isArabic),
//                                   );
//                                 },
//                               ),
//                             ),
//                             SvgPicture.asset(
//                               'assets/icons/filter.svg',
//                               width: 20,
//                               color: AppColors.mediumGray,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     AppSpacing.h24,
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Text(
//                         'home.chooseCategory'.tr(),
//                         style: AppTextStyles.interSize16(context).copyWith(
//                           fontWeight: FontWeight.w600,
//                           color: AppColors.blue,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     SizedBox(
//                       height: 60,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: dummyCategories.length,
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         itemBuilder: (context, index) {
//                           final category = dummyCategories[index];
//                           return CategoryChip(
//                             category: category,
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (_) => CategoryServiceScreen(
//                                     categoryName: 'Venues',
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                     AppSpacing.h24,

//                     BlocBuilder<TestingHomeBloc, TestingHomeState>(
//                       builder: (context, state) {
//                         if (state is TestingHomeLoading) {
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         } else if (state is TestingHomeLoaded) {
//                           final servicesProvided = state.servicesProvided;
//                           final services = state.services;
//                           final recommended = servicesProvided.length > 8
//                               ? servicesProvided.sublist(0, 8)
//                               : servicesProvided;

//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 16,
//                                 ),
//                                 child: Text(
//                                   'home.recommended'.tr(),
//                                   style: AppTextStyles.interSize16(context)
//                                       .copyWith(
//                                         fontWeight: FontWeight.bold,
//                                         color: AppColors.blue,
//                                       ),
//                                 ),
//                               ),
//                               AppSpacing.h8,
//                               SizedBox(
//                                 height: 224,
//                                 child: ListView.builder(
//                                   scrollDirection: Axis.horizontal,
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 16,
//                                   ),
//                                   itemCount: recommended.length,
//                                   itemBuilder: (context, index) {
//                                     final service = recommended[index];
//                                     return Padding(
//                                       padding: const EdgeInsets.only(right: 12),
//                                       child: RecommendedCard(
//                                         title: service.titleAr ?? '',
//                                         location:
//                                             service
//                                                 .locations!
//                                                 .first
//                                                 .city
//                                                 ?.nameAr ??
//                                             '',
//                                         imagePath:
//                                             service
//                                                 .servicImage
//                                                 ?.first
//                                                 .imageUrl ??
//                                             '',
//                                         rating:
//                                             service.ratings!.first.rating ?? 0,
//                                         reviewCount: 0,
//                                         width: 188,
//                                         height: 250,
//                                         showReviewCount: false,
//                                         onTap: () {
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) =>
//                                                   TestServiceDetailsScreen(
//                                                     service: service,
//                                                   ),
//                                             ),
//                                           );
//                                         },
//                                         onIconPressed: () {
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) =>
//                                                   FavoriteScreen(),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                               AppSpacing.h16,
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 16,
//                                 ),
//                                 child: Text(
//                                   'home.allServices'.tr(),
//                                   style: AppTextStyles.interSize16(context)
//                                       .copyWith(
//                                         fontWeight: FontWeight.bold,
//                                         color: AppColors.blue,
//                                       ),
//                                 ),
//                               ),
//                               AppSpacing.h8,
//                               ListView.builder(
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 shrinkWrap: true,
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 0,
//                                 ),
//                                 itemCount: servicesProvided.length,
//                                 itemBuilder: (context, index) {
//                                   final service = servicesProvided[index];
//                                   return Mycard(
//                                     service: service,
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               TestServiceDetailsScreen(
//                                                 service: service,
//                                               ),
//                                         ),
//                                       );
//                                     },
//                                     onFavoriteTap: () {
//                                       // bloc.add(
//                                       //   ToggleFavoriteEvent(
//                                       //     serviceId: service.id!,
//                                       //   ),
//                                       // );
//                                       // Navigator.push(
//                                       //   context,
//                                       //   MaterialPageRoute(
//                                       //     builder: (context) =>
//                                       //         FavoriteScreen(),
//                                       //   ),
//                                       // );
//                                     },
//                                   );
//                                 },
//                               ),
//                             ],
//                           );
//                         } else if (state is TestingHomeError) {
//                           return Center(child: Text('Error: ${state.message}'));
//                         } else {
//                           return const SizedBox();
//                         }
//                       },
//                     ),
//                     AppSpacing.h24,
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/data/dummy_data.dart';
import 'package:final_project/models/model.dart';
import 'package:final_project/screens/client/booking_flow/category_services_screen.dart';
import 'package:final_project/screens/client/booking_flow/service_details_screen.dart';
// import 'package:final_project/screens/client/category_services/category_services_screen.dart';
import 'package:final_project/screens/client/favorites/favorite_screen.dart';
import 'package:final_project/screens/client/service_details/service_details_screen.dart';
import 'package:final_project/screens/test/service_card.dart';
import 'package:final_project/screens/test/testing_home/mycard.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/widgets/category_chip.dart';
import 'package:final_project/widgets/service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'bloc/testing_home_bloc.dart';

class TestingHomeScreen extends StatelessWidget {
  const TestingHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestingHomeBloc()..add(FetchServicesProvidedEvent()),
      child: Builder(
        builder: (context) {
          final bloc = context.read<TestingHomeBloc>();

          return Scaffold(
            body: SafeArea(
              child: BlocBuilder<TestingHomeBloc, TestingHomeState>(
                builder: (context, state) {
                  if (state is TestingHomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is TestingHomeLoaded) {
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
                                              TestServiceDetailsScreen(
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
                                          TestServiceDetailsScreen(
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
