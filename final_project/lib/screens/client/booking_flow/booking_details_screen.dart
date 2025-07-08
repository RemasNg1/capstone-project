import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/models/services_models/services_provided/services_provided_model.dart';
import 'package:final_project/screens/client/booking_flow/bloc/booking_bloc.dart';
import 'package:final_project/screens/client/booking_flow/checkout_screen.dart';
import 'package:final_project/screens/client/booking_flow/service_details_screen.dart';
import 'package:final_project/style/app_buttons.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/utils/extensions/localization_helper.dart';
import 'package:final_project/widgets/booking_bottom_bar.dart';
import 'package:final_project/widgets/google_map.dart';
import 'package:final_project/widgets/service_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingDetailsScreen extends StatelessWidget {
  final ServicesProvidedModel service;

  const BookingDetailsScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BookingBloc>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'bookingReview.details'.tr(),
          style: TextStyle(color: AppColors.dimGray, fontSize: 20),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.dimGray),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ServiceDetailsScreen(service: service),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BookingBottomBar(
        buttonText: 'bookingReview.next'.tr(),
        buttonStyle: AppButtons.large,
        showPrice: false,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: bloc,
                child: CheckoutScreen(service: service),
              ),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: ListView(
          children: [
            // About the venue
            ServiceDescriptionSection(
              title: 'serviceDetails.about'.tr(),
              description: context.isArabic
                  ? service.descriptionAr ?? ''
                  : service.descriptionEn ?? '',
            ),

            AppSpacing.h8,

            // City
            Text(
              '${'bookingReview.city'.tr()}:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.blue,
              ),
            ),
            AppSpacing.h8,
            Row(
              children: [
                Icon(Icons.location_pin, size: 16, color: AppColors.gray),
                AppSpacing.h8,
                Text(
                  context.isArabic
                      ? service.locations?.first.city?.nameAr ?? ''
                      : service.locations?.first.city?.nameEn ?? '',
                  style: TextStyle(fontSize: 13, color: AppColors.gray),
                ),
              ],
            ),

            AppSpacing.h24,

            // & Date
            Text(
              'bookingReview.date'.tr(),
              style: TextStyle(
                fontSize: 16,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
              ),
            ),
            AppSpacing.h8,

            Text(
              DateFormat('yyyy-MM-dd').format(bloc.selectedDay),
              style: const TextStyle(fontSize: 14, color: AppColors.gray),
            ),

            AppSpacing.h24,

            // Location map
            Text(
              'bookingReview.location'.tr(),
              style: TextStyle(
                fontSize: 16,
                color: AppColors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            AppSpacing.h16,
            GoogleMapWidget(
              latitude: service.locations?.first.latitude ?? 0,
              longitude: service.locations?.first.longitude ?? 0,
              label: context.isArabic
                  ? service.titleAr ?? ''
                  : service.titleEn ?? '',
            ),
            AppSpacing.h32,
          ],
        ),
      ),
    );
  }
}
