import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/screens/service_provider/add_new_service/bloc/add_new_service_bloc.dart';
import 'package:final_project/screens/service_provider/add_new_service/bloc/add_new_service_event.dart';
import 'package:final_project/screens/service_provider/add_new_service/bloc/add_new_service_state.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/widgets/booking_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/widgets/custom_text_form_field_service.dart';
import 'package:final_project/widgets/custom_dropdown_field.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:final_project/widgets/custom_image_uploader.dart';
import 'package:final_project/widgets/google_map.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';

class AddNewServiceScreen extends StatelessWidget {
  final bool isEditing; // check if screen is for editing
  final int? serviceId; // id of the service to edit

  const AddNewServiceScreen({
    super.key,
    this.isEditing = false,
    this.serviceId,
  });

  @override
  Widget build(BuildContext context) {
    // If editing, use existing bloc from parent
    // If adding, create new bloc and load data
    return isEditing
        ? BlocProvider.value(
            value: BlocProvider.of<AddServiceBloc>(context)
              ..add(LoadRegionsAndCities())
              ..add(LoadServiceTypes())
              ..add(LoadServiceForEditing(serviceId!)),
            child: _buildWithListeners(),
          )
        : BlocProvider(
            create: (context) {
              final bloc = AddServiceBloc(GetIt.I<SupabaseClient>(), []);

              bloc.add(LoadServiceTypes());
              bloc.add(LoadRegionsAndCities());
              return bloc;
            },
            child: _buildWithListeners(),
          );
  }

  Widget _buildWithListeners() {
    return MultiBlocListener(
      listeners: [
        // Show success or error message after saving
        BlocListener<AddServiceBloc, AddServiceState>(
          listenWhen: (prev, curr) => prev.success != curr.success,
          listener: (context, state) {
            if (state.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("services.saved_successfully".tr())),
              );
              Navigator.pop(context, true);
            } else if (state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("services.error".tr(args: [state.error ?? ''])),
                ),
              );
            }
          },
        ),

        // Show message when images are uploaded
        BlocListener<AddServiceBloc, AddServiceState>(
          listenWhen: (prev, curr) =>
              prev.images != curr.images &&
              prev.isEditingLoaded == curr.isEditingLoaded,
          listener: (context, state) {
            if (!isEditing && state.images.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("services.images_uploaded".tr())),
              );
            }
          },
        ),
      ],
      child: Builder(
        builder: (context) {
          final bloc = context.read<AddServiceBloc>();

          // Form controllers
          final nameController = TextEditingController();
          // final guestCountController = TextEditingController();
          final dateController = TextEditingController();
          final priceController = TextEditingController();
          final arabicNameController = TextEditingController();
          final descriptionController = TextEditingController();
          final arabicDescriptionController = TextEditingController();

          // Fill controllers with existing data if editing

          // if (isEditing && bloc.state.isEditingLoaded) {
          //   nameController.text = bloc.state.name;
          //   arabicNameController.text = bloc.state.arabicName;
          //   descriptionController.text = bloc.state.description;
          //   arabicDescriptionController.text = bloc.state.arabicDescription;
          //   priceController.text = bloc.state.price;
          //   dateController.text = bloc.state.unavailableDateRanges.isNotEmpty
          //       ? bloc.state.unavailableDateRanges
          //             .map(
          //               (range) =>
          //                   '${range.start.toIso8601String().substring(0, 10)} → ${range.end.toIso8601String().substring(0, 10)}',
          //             )
          //             .join(', ')
          //       : '';
          // }

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text('services.newService'.tr()),
              foregroundColor: Theme.of(context).colorScheme.onSurface,
              automaticallyImplyLeading: true,
            ),

            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<AddServiceBloc, AddServiceState>(
                    buildWhen: (previous, current) =>
                        previous.isEditingLoaded != current.isEditingLoaded,
                    builder: (context, state) {
                      if (isEditing && state.isEditingLoaded) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          nameController.text = state.name;
                          arabicNameController.text = state.arabicName;
                          descriptionController.text = state.description;
                          arabicDescriptionController.text =
                              state.arabicDescription;
                          priceController.text = state.price;
                          dateController.text =
                              state.unavailableDateRanges.isNotEmpty
                              ? state.unavailableDateRanges
                                    .map(
                                      (range) =>
                                          '${range.start.toIso8601String().substring(0, 10)} → ${range.end.toIso8601String().substring(0, 10)}',
                                    )
                                    .join(', ')
                              : '';
                        });
                      }
                      return const SizedBox.shrink();
                    },
                  ),

                  // Section Title: General Information
                  Text(
                    'services.generalInfo'.tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue,
                    ),
                  ),
                  AppSpacing.h16,

                  // Category dropdown
                  // English and Arabic categories
                  BlocBuilder<AddServiceBloc, AddServiceState>(
                    builder: (context, state) {
                      if (state.loadingServiceTypes) {
                        return AppSpacing.h48;
                      }

                      final Map<String, int> categoryMap = {
                        'services.categoryPlaceholder'.tr(): -1,
                        ...{
                          for (int i = 0; i < state.serviceTypes.length; i++)
                            context.locale.languageCode == 'ar'
                                    ? state.serviceTypes[i]['ar']!
                                    : state.serviceTypes[i]['en']!:
                                i,
                        },
                      };

                      final selectedCategoryIndex = state.serviceTypes
                          .indexWhere((type) {
                            final localized =
                                context.locale.languageCode == 'ar'
                                ? type['ar']
                                : type['en'];
                            return localized == state.category;
                          });

                      return CustomDropdownField(
                        labelText: 'services.category'.tr(),
                        hintText: 'services.categoryPlaceholder'.tr(),
                        value: categoryMap.keys.firstWhere((key) {
                          final expectedCategory =
                              context.locale.languageCode == 'ar'
                              ? state.selectedTypeAr
                              : state.selectedTypeEn;

                          return key.trim().toLowerCase() ==
                              expectedCategory?.trim().toLowerCase();
                        }, orElse: () => ''),

                        items: categoryMap,
                        onChanged: (selectedIndex) {
                          if (selectedIndex != null && selectedIndex != -1) {
                            final selected = state.serviceTypes[selectedIndex];
                            final localizedName =
                                context.locale.languageCode == 'ar'
                                ? selected['ar']!
                                : selected['en']!;

                            context.read<AddServiceBloc>().emit(
                              state.copyWith(
                                category: localizedName,
                                selectedTypeAr: selected['ar'],
                                selectedTypeEn: selected['en'],
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),

                  AppSpacing.h16,

                  // Form fields for name, description, guest count, etc.
                  CustomTextFormFieldService(
                    labelText: 'services.serviceNameEn'.tr(),
                    hintText: 'services.inputPlaceholder'.tr(),
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => bloc.add(NameChanged(value)),
                  ),

                  AppSpacing.h16,
                  CustomTextFormFieldService(
                    labelText: 'services.serviceNameAr'.tr(),
                    hintText: 'services.inputPlaceholder'.tr(),
                    controller: arabicNameController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => bloc.add(ArabicNameChanged(value)),
                  ),

                  AppSpacing.h16,
                  CustomTextFormFieldService(
                    labelText: 'services.descriptionEn'.tr(),
                    hintText: 'services.inputPlaceholder'.tr(),
                    controller: descriptionController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => bloc.add(DescriptionChanged(value)),
                  ),

                  AppSpacing.h16,
                  CustomTextFormFieldService(
                    labelText: 'services.descriptionAr'.tr(),
                    hintText: 'services.inputPlaceholder'.tr(),
                    controller: arabicDescriptionController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) =>
                        bloc.add(ArabicDescriptionChanged(value)),
                  ),

                  // AppSpacing.h16,
                  // CustomTextFormFieldService(
                  //   labelText: 'services.guests'.tr(),
                  //   hintText: 'services.inputPlaceholder'.tr(),
                  //   controller: guestCountController,
                  //   keyboardType: TextInputType.number,
                  //   onChanged: (value) => bloc.add(GuestCountChanged(value)),
                  // ),
                  AppSpacing.h16,

                  // Show calendar bottom sheet
                  CustomTextFormFieldService(
                    labelText: 'services.dates'.tr(),
                    hintText: 'services.datePlaceholder'.tr(),
                    controller: dateController,
                    keyboardType: TextInputType.none,
                    readOnly: true,
                    suffixIcon: Icons.calendar_today,
                    onSuffixTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.55,
                              color: Theme.of(context).scaffoldBackgroundColor,
                              child: BookingCalendar(
                                serviceLocationId: 0,
                                onUnavailableDatesChanged: (ranges) {
                                  bloc.add(UnavailableRangesChanged(ranges));
                                  dateController.text = ranges
                                      .map(
                                        (r) =>
                                            '${DateFormat('yyyy-MM-dd').format(r.start)} → ${DateFormat('yyyy-MM-dd').format(r.end)}',
                                      )
                                      .join(', ');
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),

                  AppSpacing.h16,
                  CustomTextFormFieldService(
                    labelText: 'services.servicePrice'.tr(),
                    hintText: 'services.inputPlaceholder'.tr(),
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) => bloc.add(PriceChanged(value)),
                  ),

                  AppSpacing.h24,

                  // Section: Location and Photos
                  Text(
                    'services.locationAndPhotos'.tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue,
                    ),
                  ),

                  AppSpacing.h16,

                  // Region dropdown
                  BlocBuilder<AddServiceBloc, AddServiceState>(
                    builder: (context, state) {
                      final regionItems = state.regions.map((region) {
                        final id = region.id;
                        final name = context.locale.languageCode == 'ar'
                            ? region.nameAr
                            : region.nameEn;
                        return DropdownMenuItem<int>(
                          value: id,
                          child: Text(name),
                        );
                      }).toList();

                      final validRegionId =
                          regionItems.any(
                            (item) => item.value == state.regionId,
                          )
                          ? state.regionId
                          : null;

                      return DropdownButtonFormField<int>(
                        isExpanded: true,
                        value: validRegionId,
                        decoration: InputDecoration(
                          labelText: tr('services.selectRegion'),
                          hintText: tr('services.selectRegion'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.all(16),
                        ),
                        items: regionItems,
                        onChanged: (selectedId) {
                          if (selectedId != null) {
                            context.read<AddServiceBloc>().add(
                              RegionChanged(selectedId),
                            );
                          }
                        },
                      );
                    },
                  ),

                  AppSpacing.h16,

                  // City dropdown based on selected region
                  BlocBuilder<AddServiceBloc, AddServiceState>(
                    builder: (context, state) {
                      final selectedRegionId = state.regionId;
                      final filteredCities = state.cities
                          .where((city) => city.regionId == selectedRegionId)
                          .toList();

                      final cityItems = filteredCities.map((city) {
                        final id = city.id;
                        final name = context.locale.languageCode == 'ar'
                            ? city.nameAr
                            : city.nameEn;
                        return DropdownMenuItem<int>(
                          value: id,
                          child: Text(name ?? 'Unknown City'),
                        );
                      }).toList();

                      final validCityId =
                          cityItems.any((item) => item.value == state.cityId)
                          ? state.cityId
                          : null;

                      return DropdownButtonFormField<int>(
                        isExpanded: true,
                        value: validCityId,
                        decoration: InputDecoration(
                          labelText: tr('services.selectCity'),
                          hintText: tr('services.selectCity'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.all(16),
                        ),
                        items: cityItems,
                        onChanged: (selectedCityId) {
                          if (selectedCityId != null) {
                            final selectedCity = filteredCities.firstWhere(
                              (city) => city.id == selectedCityId,
                              orElse: () => filteredCities.first,
                            );
                            final lat = selectedCity.latitude;
                            final lng = selectedCity.longitude;

                            if (lat != null && lng != null) {
                              context.read<AddServiceBloc>().add(
                                CityChanged(selectedCityId, lat: lat, lng: lng),
                              );
                            } else {
                              context.read<AddServiceBloc>().add(
                                CityChanged(selectedCityId),
                              );
                            }
                          }
                        },
                      );
                    },
                  ),

                  AppSpacing.h16,

                  // Google Map to pick location
                  BlocBuilder<AddServiceBloc, AddServiceState>(
                    builder: (context, state) {
                      return GoogleMapWidget(
                        latitude: state.location?.latitude ?? 24.7136,
                        longitude: state.location?.longitude ?? 46.6753,
                        label: 'services.yourLocation'.tr(),
                        onLocationSelected: (lat, lng) {
                          bloc.add(LocationChanged(LatLng(lat, lng)));
                        },
                      );
                    },
                  ),

                  AppSpacing.h16,

                  // Upload images
                  BlocBuilder<AddServiceBloc, AddServiceState>(
                    builder: (context, state) {
                      return CustomImageUploader(
                        onImagesPicked: (List<XFile> images) {
                          context.read<AddServiceBloc>().add(
                            ImagesPicked(images),
                          );
                        },
                        onRemoveImage: (int index) {
                          context.read<AddServiceBloc>().add(
                            RemoveImageAtIndex(index),
                          );
                        },
                        currentImages: state.images,
                      );
                    },
                  ),

                  AppSpacing.h24,

                  // Submit Button
                  Center(
                    child: BlocBuilder<AddServiceBloc, AddServiceState>(
                      builder: (context, state) {
                        if (state.isSubmitting) {
                          return ElevatedButton.icon(
                            onPressed: null,
                            icon: const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            label: Text('services.saving'.tr()),
                          );
                        }

                        return CustomButton(
                          title: 'services.save'.tr(),
                          width: 320,
                          height: 48,
                          onPressed: () {
                            // Save form values to state
                            bloc
                              ..add(NameChanged(nameController.text))
                              ..add(
                                ArabicNameChanged(arabicNameController.text),
                              )
                              ..add(
                                DescriptionChanged(descriptionController.text),
                              )
                              ..add(
                                ArabicDescriptionChanged(
                                  arabicDescriptionController.text,
                                ),
                              )
                              // ..add(
                              //   GuestCountChanged(guestCountController.text),
                              // )
                              ..add(PriceChanged(priceController.text));

                            // Call appropriate submit or update event
                            if (isEditing && serviceId != null) {
                              bloc.add(UpdateService(serviceId!));
                            } else {
                              bloc.add(SubmitService());
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
