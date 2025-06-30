import 'package:final_project/data/dummy_data.dart';
import 'package:final_project/screens/client/booking_details/booking_details_screen.dart';
import 'package:final_project/screens/general/chats/conversation_screen.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/widgets/booking_bottom_bar.dart';
import 'package:final_project/widgets/calendar_widget.dart';
import 'package:final_project/widgets/google_map.dart';
import 'package:final_project/widgets/image_gallery.dart';
import 'package:final_project/widgets/package_list.dart';
import 'package:final_project/widgets/review_card.dart';
import 'package:final_project/widgets/service_card.dart';
import 'package:final_project/widgets/service_description.dart';
import 'package:flutter/material.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.dimGray),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          dummyService.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.dimGray,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                // TODO: toggle favorite status
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.gray),
                ),
                child: const Icon(Icons.favorite_border, color: AppColors.gray),
              ),
            ),
          ),
        ],
      ),

      // Booking bar
      bottomNavigationBar: BookingBottomBar(
        price: dummyService.packages.first.price,
        buttonText: 'Book',
        buttonWidth: 120,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookingDetailsScreen(
                //Supabase
                serviceName: dummyService.name,
                serviceDescription: dummyService.description,
                city: dummyService.location,
                latitude: dummyService.latitude,
                longitude: dummyService.longitude, //
                bookingDate: '5/4/2025', // Supabase
                bookingTime: '12:00 PM - 5:00 AM', //Supabase
              ),
            ),
          );
        },
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 12, 24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top service card
              ServiceCard(
                title: 'Nyara Venue',
                location: 'Riyadh',
                imagePath: dummyService.mainImage,
                rating: 4.8,
                reviewCount: 185,
                width: 343,
                height: 224,
                showReviewCount: true,
                onTap: () {},
                icon: Icons.chat_bubble_outline,
                onIconPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConversationScreen(messages: []),
                    ),
                  );
                },
              ),

              ImageGallery(imageUrls: dummyService.galleryImages),

              const SizedBox(height: 20),
              // Description section
              ServiceDescriptionSection(
                title: 'About ${dummyService.name}',
                description: dummyService.description,
              ),

              // Packages section
              Text(
                'Packages',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blue,
                ),
              ),
              const SizedBox(height: 8),
              PackagesList(
                packages: dummyService.packages,
                selectedIds: const [],
                onToggle: (_) {},
              ),

              const SizedBox(height: 20),

              // Map section
              Text(
                'Location',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blue,
                ),
              ),
              const SizedBox(height: 8),
              GoogleMapWidget(
                latitude: dummyService.latitude,
                longitude: dummyService.longitude,
                label: dummyService.name,
              ),

              const SizedBox(height: 20),

              // Calendar section
              Text(
                'Available Dates',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blue,
                ),
              ),
              const SizedBox(height: 8),
              CalendarWidget(
                selectedDay: DateTime.now(),
                unavailableDays: dummyService.unavailableDates,
              ),

              const SizedBox(height: 20),

              // Reviews section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reviews (${dummyService.reviews.length})',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.blue, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        dummyService.rating.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 8),
              Column(
                children: dummyService.reviews.map((review) {
                  return ReviewCard(
                    name: review.name,
                    imageUrl: review.imageUrl,
                    rating: review.rating,
                    comment: review.comment,
                    date: review.date,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
