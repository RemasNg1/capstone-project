import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/data/dummy_data.dart';
import 'package:final_project/models/services_models/services_provided/services_provided_model.dart';
import 'package:final_project/screens/client/booking_flow/bloc/booking_bloc.dart';
import 'package:final_project/screens/client/home/homeee_screen.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/widgets/booking_bottom_bar.dart';
import 'package:final_project/widgets/custom_result_dialog.dart';
import 'package:final_project/widgets/payment_method_list.dart';
import 'package:final_project/widgets/payment_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moyasar/moyasar.dart';

class CheckoutScreen extends StatelessWidget {
  final ServicesProvidedModel service;

  const CheckoutScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    // final payment = dummyService.paymentDetails;
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
              serviceTitle: service.titleAr!,
              // buffetPrice: payment.buffetPrice,
              // plannerPrice: payment.plannerPrice,
              tax: service.price! * 0.15,
              total: service.price! * 1.15,
            ),
            AppSpacing.h24,
            CreditCard(
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
                        MaterialPageRoute(builder: (context) => HomeeScreen()),
                      );
                    },
                  );
                  // await sendNotificationByExternalId(
                  //   externalUserId: ['34298'],
                  //   title: 'Payment Successful',
                  //   message:
                  //       'Your payment of \$${bloc.amount} was successful!',
                  // );
                } else {
                  // await sendNotificationByExternalId(
                  //   externalUserId: ['34298'],
                  //   title: 'Payment Not Successful',
                  //   message:
                  //       'Your payment of \$${bloc.amount} not successful!',
                  // );
                }
              },
            ),
            // PaymentMethodList(methods: dummyPaymentMethods),
          ],
        ),
      ),

      // bottomNavigationBar: BookingBottomBar(
      //   price: (service.price! * 1.15).toStringAsFixed(2),
      //   buttonText: 'bookingReview.pay'.tr(),
      //   buttonWidth: 100,
      //   onPressed: () {
      //     CustomResultDialog.show(
      //       context,
      //       icon: Icons.check_circle,
      //       iconColor: AppColors.blue,
      //       title: 'bookingReview.payment_success'.tr(),
      //       message: 'bookingReview.wait_for_acceptance'.tr(),
      //       buttonText: 'bookingReview.back_to_home'.tr(),
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => HomeeScreen()),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}

PaymentConfig configMethod({required double amount}) {
  return PaymentConfig(
    publishableApiKey: "pk_test_Aw3KeUqXpRpRjvi1k7WKPeK436JpG73EuYs6RyJr",
    amount: amount.toInt(),
    description: "test",
  );
}
