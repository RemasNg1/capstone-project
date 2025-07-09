import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/core/helper/functions.dart';
import 'package:final_project/screens/client/booking_flow/service_details_screen.dart';
import 'package:final_project/screens/client/favorites/bloc/favorites_bloc.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/utils/extensions/localization_helper.dart';
import 'package:final_project/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesBloc()..add(FetchServicesProvidedEvent()),
      child: Builder(
        builder: (context) {
          final bloc = context.read<FavoritesBloc>();
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              title: Text(
                'profile.favorite'.tr(),
                style: TextStyle(color: AppColors.dimGray, fontSize: 18),
              ),
              centerTitle: true,
              backgroundColor: AppColors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<FavoritesBloc, FavoritesState>(
                builder: (context, state) {
                  if (state is ServiceLoading) {
                    return Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: AppColors.blue,
                        size: 100,
                      ),
                    );
                  } else if (state is ServicesLoaded) {
                    return GridView.builder(
                      itemCount: state.servicesProvided.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 162 / 190,
                          ),
                      itemBuilder: (context, index) {
                        final service = state.servicesProvided[index];
                        return CategoryCard(
                          showFavorite: false,
                          imageUrl: service.servicImage?.first.imageUrl ?? '',
                          title: context.isArabic
                              ? service.titleAr!
                              : service.titleEn!,
                          location: context.isArabic
                              ? service.locations?.first.city?.nameAr ?? ''
                              : service.locations?.first.city?.nameEn ?? '',
                          rating: calculateAverageRating(service.ratings!),
                          ratingCount: service.ratings?.length ?? 0,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ServiceDetailsScreen(service: service),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                  return SizedBox();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
