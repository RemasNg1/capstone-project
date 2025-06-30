import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/screens/service_provider/services/services_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/widgets/custom_text_form_field_service.dart';
import 'package:final_project/widgets/custom_dropdown_field.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:final_project/widgets/custom_image_uploader.dart';
import 'package:final_project/widgets/google_map.dart';

class AddNewServiceScreen extends StatelessWidget {
  const AddNewServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    final guestCountController = TextEditingController();
    final dateController = TextEditingController();
    final priceController = TextEditingController();

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

            CustomDropdownField(
              labelText: 'services.category'.tr(),
              items: const ['Venue', 'Buffet', 'Photographers', 'Car Rent'],
              onChanged: (value) {},
              hintText: 'services.categoryPlaceholder'.tr(),
            ),

            AppSpacing.h16,

            CustomTextFormFieldService(
              labelText: 'services.about'.tr(),
              hintText: 'services.inputPlaceholder'.tr(),
              controller: nameController,
              keyboardType: TextInputType.text,
            ),

            AppSpacing.h16,

            CustomTextFormFieldService(
              labelText: 'services.guests'.tr(),
              hintText: 'services.inputPlaceholder'.tr(),
              controller: guestCountController,
              keyboardType: TextInputType.number,
            ),

            AppSpacing.h16,

            CustomTextFormFieldService(
              labelText: 'services.dates'.tr(),
              hintText: 'services.datePlaceholder'.tr(),
              controller: dateController,
              keyboardType: TextInputType.none,
              readOnly: true,
              suffixIcon: Icons.calendar_today,
              onSuffixTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  dateController.text = DateFormat('yyyy-MM-dd').format(picked);
                }
              },
            ),
            AppSpacing.h16,
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'services.addPackages'.tr(),
                      labelStyle: TextStyle(
                        color: AppColors.mediumGray,
                        fontSize: 16,
                      ),
                      hintText: 'services.inputPlaceholder'.tr(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14),
                          bottomLeft: Radius.circular(14),
                        ),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Price',
                      hintStyle: const TextStyle(
                        color: AppColors.mediumGray,
                        fontSize: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(14),
                          bottomRight: Radius.circular(14),
                        ),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            AppSpacing.h16,

            CustomTextFormFieldService(
              labelText: 'services.servicePrice'.tr(),
              hintText: 'services.inputPlaceholder'.tr(),
              controller: priceController,
              keyboardType: TextInputType.number,
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

            const GoogleMapWidget(
              latitude: 24.7136,
              longitude: 46.6753,
              label: 'Your Location',
            ),

            AppSpacing.h16,

            CustomImageUploader(
              onImagesPicked: (List<XFile> images) {
                // Handle images
              },
            ),

            AppSpacing.h24,

            Center(
              child: CustomButton(
                title: 'services.save'.tr(),
                width: 320,
                height: 48,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ServicesScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
