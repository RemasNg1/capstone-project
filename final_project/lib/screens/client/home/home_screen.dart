import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/core/helper/functions.dart';
import 'package:final_project/screens/client/booking_flow/service_details_screen.dart';
import 'package:final_project/screens/client/category_services/category_services_screen.dart';
import 'package:final_project/screens/client/home/recommended_card.dart';
import 'package:final_project/screens/client/home/mycard.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/utils/extensions/localization_helper.dart';
import 'package:final_project/widgets/category_chip.dart';
import 'package:flutter/material.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final homeBloc = GetIt.I<HomeBloc>();

    // return BlocProvider.value(
    //   value: homeBloc,
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
                    return Skeletonizer(
                      enabled: true,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppSpacing.h8,
                            Row(
                              children: [
                                const CircleAvatar(radius: 20),
                                AppSpacing.w8,
                                Text(
                                  'Hello User',
                                  style: AppTextStyles.interSize14(context),
                                ),
                              ],
                            ),
                            AppSpacing.h16,
                            Text(
                              'What service do you need?',
                              style: AppTextStyles.interSize28(context),
                            ),
                            AppSpacing.h16,
                            Container(
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
                                  const Expanded(child: Text('Search here...')),
                                ],
                              ),
                            ),
                            AppSpacing.h24,
                            Text(
                              'Choose Category',
                              style: AppTextStyles.interSize16(context),
                            ),
                            AppSpacing.h16,
                            SizedBox(
                              height: 60,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Chip(label: Text('Category $index')),
                                ),
                              ),
                            ),
                            AppSpacing.h24,
                            Text(
                              'Recommended',
                              style: AppTextStyles.interSize16(context),
                            ),
                            AppSpacing.h8,
                            SizedBox(
                              height: 224,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (_, index) => Container(
                                  width: 188,
                                  margin: const EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.outline,

                                    // color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            AppSpacing.h16,
                            Text(
                              'All Services',
                              style: AppTextStyles.interSize16(context),
                            ),
                            AppSpacing.h8,
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (_, index) => Container(
                                height: 120,
                                margin: const EdgeInsets.only(bottom: 12),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.outline,
                                  // color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            AppSpacing.h24,
                          ],
                        ),
                      ),
                    );
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
                          AppSpacing.h8,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                    state.currentUser.avatar ??
                                        'https://i.pinimg.com/736x/df/16/57/df165790d80fa38530f128f350fb315a.jpg',
                                  ),
                                ),
                                AppSpacing.w8,
                                Text(
                                  '${'home.hello'.tr()}, ${state.currentUser.name}',
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
                              style: AppTextStyles.interSize28(context)
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
                                        bloc.add(
                                          SearchServicesEvent(
                                            value,
                                            context.isArabic,
                                          ),
                                        );
                                      },
                                    ),
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
                                final categoryType = services[index];

                                return CategoryChip(
                                  category:
                                      bloc.serviceIcon[categoryType.typeEn]!,
                                  categoryName: context.isArabic
                                      ? categoryType.typeAr ?? ''
                                      : categoryType.typeEn ?? '',

                                  onTap: () {
                                    bloc.add(
                                      FilterByCategoryEvent(
                                        categoryType.nameEn!,
                                      ),
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
                                                  categoryName: context.isArabic
                                                      ? categoryType.nameAr ??
                                                            ''
                                                      : categoryType.nameEn ??
                                                            '',
                                                  filteredServices: filtered,
                                                ),
                                          ),
                                        );
                                      },
                                    );
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
                                    title: context.isArabic
                                        ? service.titleAr ?? ''
                                        : service.titleEn ?? '',
                                    location: context.isArabic
                                        ? service
                                                  .locations!
                                                  .first
                                                  .city
                                                  ?.nameAr ??
                                              ''
                                        : service
                                                  .locations!
                                                  .first
                                                  .city
                                                  ?.nameEn ??
                                              '',

                                    imagePath:
                                        service.servicImage?.first.imageUrl ??
                                        '',
                                    rating: calculateAverageRating(
                                      service.ratings!,
                                    ),

                                    reviewCount: service.ratings?.length ?? 0,
                                    width: 188,
                                    height: 250,
                                    icon: Icon(
                                      service.isFavorite!
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: service.isFavorite!
                                          ? Colors.red
                                          : AppColors.mediumGray,
                                    ),

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
                                      bloc.add(
                                        ToggleFavoriteEvent(
                                          serviceId: service.id!,
                                          context: context,
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
                                  bloc.add(
                                    ToggleFavoriteEvent(
                                      serviceId: service.id!,
                                      context: context,
                                    ),
                                  );
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
