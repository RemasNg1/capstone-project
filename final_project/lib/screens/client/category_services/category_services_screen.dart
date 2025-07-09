import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/core/helper/functions.dart';
import 'package:final_project/models/services_models/services_provided/services_provided_model.dart';
import 'package:final_project/screens/client/booking_flow/service_details_screen.dart';
import 'package:final_project/screens/client/category_services/bloc/category_services_bloc.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/utils/extensions/localization_helper.dart';
import 'package:final_project/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

/// CategoryScreen displays a list of services based on selected category.

class CategoryServiceScreen extends StatelessWidget {
  final String categoryName;
  final List<ServicesProvidedModel> filteredServices;

  const CategoryServiceScreen({
    super.key,
    required this.categoryName,
    required this.filteredServices,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryServicesBloc()..add(InitServicesEvent(filteredServices)),
      child: Builder(
        builder: (context) {
          final bloc = context.read<CategoryServicesBloc>();
          return Scaffold(
            appBar: AppBar(
              title: Text(
                categoryName,
                style: TextStyle(color: AppColors.dimGray, fontSize: 18),
              ),
              centerTitle: true,
              elevation: 0,
            ),
            body: BlocBuilder<CategoryServicesBloc, CategoryServicesState>(
              builder: (context, state) {
                return Column(
                  children: [
                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'home.search'.tr(),
                            hintStyle: const TextStyle(
                              color: AppColors.mediumGray,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: AppColors.mediumGray,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                          ),
                          onChanged: (value) {
                            bloc.add(
                              SearchServicesEvent(
                                query: value,
                                isArabic: context.isArabic,
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    // Grid
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: state is SuccessSearch
                              ? GridView.builder(
                                  itemCount: state.servicesProvided.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 16,
                                        crossAxisSpacing: 16,
                                        childAspectRatio: 160 / 205,
                                      ),
                                  itemBuilder: (context, index) {
                                    final service =
                                        state.servicesProvided[index];
                                    return CategoryCard(
                                      imageUrl:
                                          service.servicImage!.first.imageUrl!,
                                      title: context.isArabic
                                          ? service.titleAr ?? ''
                                          : service.titleEn ?? '',
                                      location: context.isArabic
                                          ? service
                                                .locations!
                                                .first
                                                .city!
                                                .nameAr!
                                          : service
                                                .locations!
                                                .first
                                                .city!
                                                .nameEn!,
                                      rating: calculateAverageRating(
                                        service.ratings!,
                                      ),
                                      // rating:
                                      //     (service.ratings != null &&
                                      //         service.ratings!.isNotEmpty)
                                      //     ? service.ratings!.first.rating ?? 0.0
                                      //     : 0.0,
                                      ratingCount: service.ratings?.length ?? 0,
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
                                    );
                                  },
                                )
                              : Center(
                                  child:
                                      LoadingAnimationWidget.staggeredDotsWave(
                                        color: AppColors.blue,
                                        size: 100,
                                      ),
                                ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
