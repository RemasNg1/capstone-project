import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/data/dummy_data.dart';
import 'package:final_project/models/services_models/services_provided/services_provided_model.dart';
import 'package:final_project/models/service_provided/service_provided_model.dart';
// import 'package:final_project/screens/client/booking_details/booking_details_screen.dart';
import 'package:final_project/screens/client/booking_flow/bloc/booking_bloc.dart';
import 'package:final_project/screens/client/booking_flow/booking_details_screen.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';

class TestServiceDetailsScreen extends StatelessWidget {
  final ServicesProvidedModel service;

  const TestServiceDetailsScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    // print(service.id);
    // print(service.locations);
    // print(service.serviceRequests);
    // print(service.servicImage);
    print(service.ratings);
    print(service.ratings?.first.client);

    final requestDates = service.serviceRequests != null
        ? service.serviceRequests!
              .where(
                (r) =>
                    r.date != null &&
                    (r.status == 'accepted' || r.status == 'send'),
              )
              .map((r) => DateTime(r.date!.year, r.date!.month, r.date!.day))
              .toSet()
        : <DateTime>{};

    final disabledRangeDates = <DateTime>{};
    for (var loc in service.locations ?? []) {
      for (var dis in loc.disabledDates ?? []) {
        DateTime current = dis.startDate;
        while (!current.isAfter(dis.endDate)) {
          disabledRangeDates.add(
            DateTime(current.year, current.month, current.day),
          );
          current = current.add(Duration(days: 1));
        }
      }
    }

    final unavailableDays = requestDates.union(disabledRangeDates);

    return BlocProvider(
      create: (context) => BookingBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<BookingBloc>();
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              backgroundColor: AppColors.white,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.dimGray,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                service.titleAr!,
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
                      child: const Icon(
                        Icons.favorite_border,
                        color: AppColors.gray,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Booking bar
            bottomNavigationBar: BookingBottomBar(
              price: service.price!.toStringAsFixed(2),
              buttonText: 'serviceDetails.book'.tr(),
              buttonWidth: 120,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: bloc,
                      child: BookingDetailsScreen(service: service),
                    ),
                  ),
                );
              },
              // onPressed: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => BookingDetailsScreen(
              //         service: service,

              //       ),
              //     ),
              //   );
              // },
            ),

            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 0, 12, 24),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top service card
                      ServiceCard(
                        title: service.titleAr ?? '',
                        location: service.locations?.first.city?.nameAr ?? '',
                        imagePath: service.servicImage?.first.imageUrl ?? '',
                        rating: service.ratings?.first.rating ?? 0,
                        reviewCount: service.ratings?.length ?? 0,
                        width: 343,
                        height: 224,
                        showReviewCount: true,
                        onTap: () {},
                        icon: Icons.chat_bubble_outline,
                        onIconPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ConversationScreen(messages: []),
                            ),
                          );
                        },
                      ),

                      ImageGallery(imageUrls: service.servicImage!),

                      const SizedBox(height: 20),
                      // Description section
                      ServiceDescriptionSection(
                        title: 'serviceDetails.about'.tr(),
                        description: service.descriptionAr ?? '',
                      ),

                      // Packages section
                      // Text(
                      //   'Packages',
                      //   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      //     fontWeight: FontWeight.bold,
                      //     color: AppColors.blue,
                      //   ),
                      // ),
                      // const SizedBox(height: 8),
                      // PackagesList(
                      //   packages: dummyService.packages,
                      //   selectedIds: const [],
                      //   onToggle: (_) {},
                      // ),
                      const SizedBox(height: 20),

                      // Map section
                      Text(
                        'serviceDetails.location'.tr(),
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
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
                        'serviceDetails.availableDates'.tr(),
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.blue,
                            ),
                      ),
                      const SizedBox(height: 8),

                      BlocBuilder<BookingBloc, BookingState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              CalendarWidget(
                                selectedDay: bloc.selectedDay,
                                unavailableDays: unavailableDays.isNotEmpty
                                    ? unavailableDays
                                    : {DateTime(2025, 7, 1)},
                                onDaySelected: (day) {
                                  bloc.add(DaySelected(day));
                                },
                              ),
                            ],
                          );
                        },
                      ),

                      const SizedBox(height: 20),

                      // Reviews section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${'serviceDetails.reviews'.tr()} (${dummyService.reviews.length})',
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blue,
                                ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: AppColors.blue,
                                size: 20,
                              ),
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
                        children: service.ratings!.map((review) {
                          return ReviewCard(
                            name: review.client?.name ?? "no name",
                            imageUrl:
                                'https://cdn2.iconfinder.com/data/icons/circle-avatars-1/128/050_girl_avatar_profile_woman_suit_student_officer-512.png',
                            rating: review.rating?.toInt() ?? 0,
                            comment: review.content ?? '',
                            date: DateFormat(
                              'yyyy-MM-dd',
                            ).format(review.date ?? DateTime.now()),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
