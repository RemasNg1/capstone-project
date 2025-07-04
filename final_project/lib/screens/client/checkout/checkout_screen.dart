import 'package:final_project/data/dummy_data.dart';
import 'package:final_project/screens/client/home/homeee_screen.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/widgets/booking_bottom_bar.dart';
import 'package:final_project/widgets/custom_result_dialog.dart';
import 'package:final_project/widgets/payment_method_list.dart';
import 'package:final_project/widgets/payment_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final payment = dummyService.paymentDetails;

    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2)), // simulate loading
      builder: (context, snapshot) {
        final isLoading = snapshot.connectionState != ConnectionState.done;

        return Skeletonizer(
          enabled: isLoading,
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              title: const Text(
                'Payment',
                style: TextStyle(color: AppColors.dimGray, fontSize: 20),
              ),
              centerTitle: true,
              backgroundColor: AppColors.white,
              foregroundColor: AppColors.black,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  PaymentSummaryCard(
                    venuePrice: payment.venuePrice,
                    buffetPrice: payment.buffetPrice,
                    plannerPrice: payment.plannerPrice,
                    tax: payment.tax,
                    total: payment.total,
                  ),
                  const SizedBox(height: 24),
                  PaymentMethodList(methods: dummyPaymentMethods),
                ],
              ),
            ),
            bottomNavigationBar: isLoading
                ? null
                : BookingBottomBar(
                    price: payment.total,
                    buttonText: 'Pay',
                    buttonWidth: 100,
                    onPressed: () {
                      CustomResultDialog.show(
                        context,
                        icon: Icons.check_circle,
                        iconColor: AppColors.blue,
                        title: 'Payment Successful',
                        message:
                            'Wait for the service provider to accept your order.',
                        buttonText: 'Back to home',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeeScreen(),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
