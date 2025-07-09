import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/screens/service_provider/add_new_service/addNew_service_screen.dart';
import 'package:final_project/screens/service_provider/add_new_service/bloc/add_new_service_bloc.dart';
import 'package:final_project/screens/service_provider/add_new_service/bloc/add_new_service_event.dart';
import 'package:final_project/screens/service_provider/services/bloc/services_bloc.dart';
import 'package:final_project/screens/service_provider/add_new_service/bloc/add_new_service_event.dart'
    as add_service;

import 'package:final_project/screens/service_provider/services/bloc/services_event.dart';

import 'package:final_project/screens/service_provider/services/bloc/services_state.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/widgets/service_provider_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // print(
    //   "👤 Current User ID: ${Supabase.instance.client.auth.currentUser?.id}",
    // );
    return BlocProvider(
      create: (_) => GetIt.I<MyServicesBloc>()..add(LoadMyServices()),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: Text(
            'services.myServices'.tr(), // Localized title
            style: const TextStyle(
              color: AppColors.dimGray,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white,
          elevation: 0,
        ),
        body: BlocBuilder<MyServicesBloc, MyServicesState>(
          builder: (context, state) {
            if (state.isLoading) {
              // Show loading indicator while services are being fetched
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: AppColors.blue,
                  size: 100,
                ),
              );
            }

            if (state.error != null) {
              // Show error message if something went wrong
              return Center(child: Text(state.error!));
            }

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // List of services added by the current provider
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.services.length,
                      itemBuilder: (context, index) {
                        final service = state.services[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ServiceProviderCard(
                            image: service.imageUrls.isNotEmpty
                                ? service.imageUrls[0]
                                : '',
                            name: context.locale.languageCode == 'ar'
                                ? service.nameAr
                                : service.nameEn,
                            category: '', // You can add category here
                            price: '${service.price} ',
                            onDelete: () {
                              // Show confirmation dialog before deleting service
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text(
                                    'services.confirmDeleteTitle'.tr(),
                                  ),
                                  content: Text(
                                    'services.confirmDeleteBody'.tr(),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('services.cancel'.tr()),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        // Trigger delete event
                                        context.read<MyServicesBloc>().add(
                                          DeleteService(service.id),
                                        );
                                      },
                                      child: Text('services.delete'.tr()),
                                    ),
                                  ],
                                ),
                              );
                            },
                            onEdit: () async {
                              // Prepare bloc for editing the selected service
                              final bloc = GetIt.I<AddServiceBloc>()
                                ..add(LoadServiceTypes())
                                ..add(LoadRegionsAndCities())
                                ..add(
                                  add_service.LoadServiceForEditing(
                                    int.parse(service.id),
                                  ),
                                );

                              // Navigate to the Add/Edit service screen
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                    value: bloc,
                                    child: AddNewServiceScreen(
                                      isEditing: true,
                                      serviceId: int.tryParse(service.id),
                                    ),
                                  ),
                                ),
                              );

                              // Reload the list if service was edited successfully
                              if (result == true) {
                                context.read<MyServicesBloc>().add(
                                  LoadMyServices(),
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Button to add a new service
                  GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider(
                            create: (_) => GetIt.I<AddServiceBloc>()
                              ..add(LoadServiceTypes())
                              ..add(LoadRegionsAndCities()),
                            child: const AddNewServiceScreen(isEditing: false),
                          ),
                        ),
                      );

                      // Reload services list if a new service was added
                      if (result == true) {
                        context.read<MyServicesBloc>().add(LoadMyServices());
                      }
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
                            'services.addMore'.tr(), // Localized button text
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
          },
        ),
      ),
    );
  }
}
