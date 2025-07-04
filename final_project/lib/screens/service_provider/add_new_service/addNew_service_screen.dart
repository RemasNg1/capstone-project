import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/screens/service_provider/add_new_service/bloc/add_new_service_bloc.dart';
import 'package:final_project/screens/service_provider/add_new_service/bloc/add_new_service_event.dart';
import 'package:final_project/screens/service_provider/add_new_service/bloc/add_new_service_state.dart';
import 'package:final_project/screens/service_provider/services/services_screen.dart';
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

class AddNewServiceScreen extends StatelessWidget {
  const AddNewServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = AddServiceBloc(GetIt.I<SupabaseClient>());

        bloc.add(LoadServiceTypes());
        bloc.add(LoadRegionsAndCities());
        return bloc;
      },

      child: MultiBlocListener(
        listeners: [
          BlocListener<AddServiceBloc, AddServiceState>(
            listenWhen: (prev, curr) => prev.success != curr.success,
            listener: (context, state) {
              if (state.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("services.saved_successfully".tr())),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ServicesScreen()),
                );
              } else if (state.error != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "services.error".tr(args: [state.error ?? '']),
                    ),
                  ),
                );
              }
            },
          ),
          BlocListener<AddServiceBloc, AddServiceState>(
            listenWhen: (prev, curr) => prev.images != curr.images,
            listener: (context, state) {
              if (state.images.isNotEmpty) {
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

            // ValueNotifier<List<Map<String, TextEditingController>>> packages =
            //     ValueNotifier([]);
            final nameController = TextEditingController();
            final guestCountController = TextEditingController();
            final dateController = TextEditingController();
            final priceController = TextEditingController();
            final arabicNameController = TextEditingController();
            final descriptionController = TextEditingController();
            final arabicDescriptionController = TextEditingController();

            return Scaffold(
              appBar: AppBar(
                title: Text('services.newService'.tr()),
                centerTitle: true,
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.black,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'services.generalInfo'.tr(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blue,
                      ),
                    ),
                    AppSpacing.h16,

                    /// Category Dropdown
                    BlocBuilder<AddServiceBloc, AddServiceState>(
                      builder: (context, state) {
                        if (state.loadingServiceTypes) {
                          return AppSpacing.h48;
                        }
                        //convert to map
                        final Map<String, int> categoryMap = {
                          for (int i = 0; i < state.serviceTypes.length; i++)
                            state.serviceTypes[i]: i,
                        };

                        return CustomDropdownField(
                          labelText: 'services.category'.tr(),
                          hintText: 'services.categoryPlaceholder'.tr(),
                          value: state.category.isNotEmpty
                              ? state.category
                              : null,
                          items: categoryMap,
                          onChanged: (selectedId) {
                            if (selectedId != null) {
                              final selectedName = categoryMap.keys.firstWhere(
                                (name) => categoryMap[name] == selectedId,
                                orElse: () => '',
                              );
                              if (selectedName.isNotEmpty) {
                                context.read<AddServiceBloc>().add(
                                  CategoryChanged(selectedName),
                                );
                              }
                            }
                          },
                        );
                      },
                    ),

                    AppSpacing.h16,

                    /// English Name
                    CustomTextFormFieldService(
                      labelText: 'services.serviceNameEn'.tr(),
                      hintText: 'services.inputPlaceholder'.tr(),
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      onChanged: (value) => bloc.add(NameChanged(value)),
                    ),
                    AppSpacing.h16,

                    /// Arabic Name
                    CustomTextFormFieldService(
                      labelText: 'services.serviceNameAr'.tr(),
                      hintText: 'services.inputPlaceholder'.tr(),
                      controller: arabicNameController,
                      keyboardType: TextInputType.text,
                      onChanged: (value) => bloc.add(ArabicNameChanged(value)),
                    ),
                    AppSpacing.h16,

                    /// English Description
                    CustomTextFormFieldService(
                      labelText: 'services.descriptionEn'.tr(),
                      hintText: 'services.inputPlaceholder'.tr(),
                      controller: descriptionController,
                      keyboardType: TextInputType.text,
                      onChanged: (value) => bloc.add(DescriptionChanged(value)),
                    ),
                    AppSpacing.h16,

                    /// Arabic Description
                    CustomTextFormFieldService(
                      labelText: 'services.descriptionAr'.tr(),
                      hintText: 'services.inputPlaceholder'.tr(),
                      controller: arabicDescriptionController,
                      keyboardType: TextInputType.text,
                      onChanged: (value) =>
                          bloc.add(ArabicDescriptionChanged(value)),
                    ),
                    AppSpacing.h16,

                    /// Guest Count
                    CustomTextFormFieldService(
                      labelText: 'services.guests'.tr(),
                      hintText: 'services.inputPlaceholder'.tr(),
                      controller: guestCountController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) => bloc.add(GuestCountChanged(value)),
                    ),

                    AppSpacing.h16,

                    /// Date Picker
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
                                height:
                                    MediaQuery.of(context).size.height * 0.55,
                                color: Theme.of(
                                  context,
                                ).scaffoldBackgroundColor,
                                child: BookingCalendar(
                                  onDateSelected: (selectedDate) {
                                    //dateController.text = selectedDate;
                                    bloc.add(DateChanged(selectedDate));
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),

                    AppSpacing.h16,

                    /// Price
                    CustomTextFormFieldService(
                      labelText: 'services.servicePrice'.tr(),
                      hintText: 'services.inputPlaceholder'.tr(),
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) => bloc.add(PriceChanged(value)),
                    ),

                    AppSpacing.h24,

                    Text(
                      'services.locationAndPhotos'.tr(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blue,
                      ),
                    ),
                    AppSpacing.h16,

                    //regions
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

                        // Verify that RegionId actually exists in the list
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

                        //// Verify that cityId actually exists in the list
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
                                  CityChanged(
                                    selectedCityId,
                                    lat: lat,
                                    lng: lng,
                                  ),
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

                    /// Google Map
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

                    /// Image Picker
                    CustomImageUploader(
                      onImagesPicked: (List<XFile> images) {
                        bloc.add(ImagesPicked(images));
                      },
                    ),

                    AppSpacing.h24,

                    /// Save Button
                    Center(
                      child: BlocBuilder<AddServiceBloc, AddServiceState>(
                        builder: (context, state) {
                          if (state.isSubmitting) {
                            return ElevatedButton.icon(
                              onPressed: null,
                              icon: const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                              label: Text('services.saving'.tr()),
                            );
                          }

                          return CustomButton(
                            title: 'services.save'.tr(),
                            width: 320,
                            height: 48,
                            onPressed: () {
                              bloc
                                ..add(NameChanged(nameController.text))
                                ..add(
                                  ArabicNameChanged(arabicNameController.text),
                                )
                                ..add(
                                  DescriptionChanged(
                                    descriptionController.text,
                                  ),
                                )
                                ..add(
                                  ArabicDescriptionChanged(
                                    arabicDescriptionController.text,
                                  ),
                                )
                                ..add(
                                  GuestCountChanged(guestCountController.text),
                                )
                                ..add(PriceChanged(priceController.text));

                              if (dateController.text.isNotEmpty) {
                                bloc.add(DateChanged(dateController.text));
                              }

                              bloc.add(SubmitService());
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
      ),
    );
  }
}
