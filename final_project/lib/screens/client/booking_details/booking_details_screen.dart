import 'package:final_project/screens/client/checkout/checkout_screen.dart';
import 'package:final_project/screens/client/service_details/service_details_screen.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/widgets/booking_bottom_bar.dart';
import 'package:final_project/widgets/google_map.dart';
import 'package:final_project/widgets/service_description.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookingDetailsScreen extends StatelessWidget {
  final String serviceName;
  final String serviceDescription;
  final String city;
  final double latitude;
  final double longitude;
  final String bookingDate;
  final String bookingTime;

  const BookingDetailsScreen({
    super.key,
    required this.serviceName,
    required this.serviceDescription,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.bookingDate,
    required this.bookingTime,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2)), // simulate loading
      builder: (context, snapshot) {
        final isLoading = snapshot.connectionState != ConnectionState.done;

        return Skeletonizer(
          enabled: isLoading,
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              backgroundColor: AppColors.white,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                'Booking Details',
                style: TextStyle(color: AppColors.dimGray, fontSize: 20),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.dimGray,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ServiceDetailsScreen(),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: isLoading
                ? null
                : BookingBottomBar(
                    buttonText: 'Next',
                    buttonWidth: 360,
                    showPrice: false,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckoutScreen(),
                        ),
                      );
                    },
                  ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: ListView(
                children: [
                  ServiceDescriptionSection(
                    title: 'About the Venue',
                    description: serviceDescription,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'City:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        size: 16,
                        color: AppColors.gray,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        city,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Time and date',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    bookingDate,
                    style: const TextStyle(fontSize: 14, color: AppColors.gray),
                  ),
                  Text(
                    bookingTime,
                    style: const TextStyle(fontSize: 13, color: AppColors.gray),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GoogleMapWidget(
                    latitude: latitude,
                    longitude: longitude,
                    label: serviceName,
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
