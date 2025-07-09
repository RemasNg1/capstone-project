import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/models/services_models/services_provided/services_provided_model.dart';
import 'package:final_project/screens/client/booking_flow/bloc/booking_bloc.dart';
import 'package:final_project/screens/client/client_bottom_navbar/client_bottom_navbar_screen.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/utils/extensions/localization_helper.dart';
import 'package:final_project/widgets/custom_result_dialog.dart';
import 'package:final_project/widgets/payment_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moyasar/moyasar.dart';
import 'dart:ui' as ui;

class CheckoutScreen extends StatelessWidget {
  final ServicesProvidedModel service;

  const CheckoutScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BookingBloc>();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'bookingReview.payment'.tr(),
          style: TextStyle(color: AppColors.dimGray, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            AppSpacing.h16,

            PaymentSummaryCard(
              servicePrice: service.price!,
              serviceTitle: context.isArabic
                  ? service.titleAr ?? ''
                  : service.titleEn ?? '',
              tax: service.price! * 0.15,
              total: service.price! * 1.15,
            ),
            AppSpacing.h72,
            Directionality(
              textDirection: ui.TextDirection.ltr,
              child: CreditCard(
                config: configMethod(amount: (service.price! * 115)),

                onPaymentResult: (PaymentResponse value) async {
                  if (value.status == PaymentStatus.paid) {
                    bloc.add(
                      SubmitBooking(
                        serviceId: service.id!,
                        serviceLocationId: service.locations!.first.id!,
                        date: bloc.selectedDay,
                      ),
                    );
                    CustomResultDialog.show(
                      context,
                      icon: Icons.check_circle,
                      iconColor: AppColors.blue,
                      title: 'bookingReview.payment_success'.tr(),
                      message: 'bookingReview.wait_for_acceptance'.tr(),
                      buttonText: 'bookingReview.back_to_home'.tr(),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ClientBottomNavbarScreen(),
                          ),
                        );
                      },
                    );
                  } else {
                    Flushbar(
                      messageText: Text(
                        "فشلت عملية الدفع، حاول مرة أخرى.",
                        style: AppTextStyles.interSize16(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                      icon: Icon(Icons.error, color: Colors.white),
                      duration: Duration(seconds: 3),
                      flushbarPosition: FlushbarPosition.BOTTOM,
                      borderRadius: BorderRadius.circular(8),
                      margin: EdgeInsets.all(16),
                    ).show(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

PaymentConfig configMethod({required double amount}) {
  return PaymentConfig(
    publishableApiKey: "",
    amount: amount.toInt(),
    description: "Service Reservation",
  );
}
