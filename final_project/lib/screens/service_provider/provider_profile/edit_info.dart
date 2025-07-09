import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/core/constant/app_validation.dart';
import 'package:final_project/screens/service_provider/provider_profile/bloc/provider_profile_bloc.dart';
import 'package:final_project/style/app_buttons.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:final_project/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditInfoDialog extends StatelessWidget {
  const EditInfoDialog({super.key});

  // This dialog allows users to edit and save their display name and password with validation.

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProviderProfileBloc>();

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titlePadding: EdgeInsets.zero,
      title: SizedBox(
        height: 48,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'profile.edit_information'.tr(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.grey),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          height: context.getHeight(factor: 0.40),
          child: Form(
            key: bloc.profileFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: "auth.name_ar".tr(),
                  icon: Icon(CupertinoIcons.person),
                  controller: bloc.nameArController,
                  validator: AppValidation.validateNameAr,
                ),
                AppSpacing.h16,
                CustomTextFormField(
                  labelText: "auth.name_en".tr(),
                  icon: Icon(CupertinoIcons.person),
                  controller: bloc.nameEnController,
                  validator: AppValidation.validateNameEn,
                ),
                AppSpacing.h16,

                CustomTextFormField(
                  labelText: "auth.commercial_registration_number".tr(),
                  icon: Icon(CupertinoIcons.doc_text),
                  controller: bloc.crNumber,
                  validator: AppValidation.validateCrNumber,
                ),
                AppSpacing.h16,

                CustomTextFormField(
                  labelText: "auth.iban".tr(),
                  icon: Icon(CupertinoIcons.creditcard),
                  controller: bloc.ibanController,
                  keyboardType: TextInputType.number,
                  validator: AppValidation.validateIban,
                ),

                AppSpacing.h16,
                CustomTextFormField(
                  labelText: "auth.phone".tr(),
                  icon: Icon(CupertinoIcons.phone),
                  controller: bloc.phoneController,
                  keyboardType: TextInputType.number,
                  validator: AppValidation.validatePhone,
                ),
                AppSpacing.h16,

                // CustomTextFormField(
                //   labelText: "auth.email".tr(),
                //   icon: Icon(CupertinoIcons.mail),
                //   controller: bloc.emailController,
                //   validator: AppValidation.validateEmail,
                // ),
              ],
            ),
          ),
        ),
      ),

      actions: [
        ElevatedButton(
          onPressed: () {
            if (bloc.profileFormKey.currentState!.validate()) {
              bloc.add(
                UpdateProfileInfoEvent(
                  nameAr: bloc.nameArController.text,
                  nameEn: bloc.nameEnController.text,
                  phone: bloc.phoneController.text,
                  crNumber: bloc.crNumber.text,
                  iban: bloc.ibanController.text,
                ),
              );
              Navigator.pop(context);
            }
          },
          style: AppButtons.medium,
          child: Text(
            'profile.save'.tr(),
            style: AppTextStyles.interSize16(context),
          ),
        ),
      ],
    );
  }
}
