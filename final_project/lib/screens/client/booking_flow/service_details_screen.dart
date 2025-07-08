import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/data/dummy_data.dart';
import 'package:final_project/models/chat/model_message.dart';
import 'package:final_project/models/services_models/services_provided/services_provided_model.dart';
import 'package:final_project/screens/client/booking_flow/bloc/booking_bloc.dart';
import 'package:final_project/screens/client/booking_flow/booking_details_screen.dart';
import 'package:final_project/screens/general/chats/chats_screen.dart';
import 'package:final_project/style/app_buttons.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/utils/extensions/localization_helper.dart';
import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:final_project/widgets/booking_bottom_bar.dart';
import 'package:final_project/widgets/calendar_widget.dart';
import 'package:final_project/widgets/google_map.dart';
import 'package:final_project/widgets/image_gallery.dart';
import 'package:final_project/widgets/review_card.dart';
import 'package:final_project/widgets/service_card.dart';
import 'package:final_project/widgets/service_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final ServicesProvidedModel service;

  const ServiceDetailsScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
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
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.dimGray,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                context.isArabic
                    ? service.titleAr ?? ''
                    : service.titleEn ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.dimGray,
                  fontSize: 18,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: BlocBuilder<BookingBloc, BookingState>(
                    builder: (context, state) {
                      bool isFav = service.isFavorite ?? false;

                      if (state is FavoriteToggledState) {
                        isFav = state.isFavorite;
                      }

                      return GestureDetector(
                        onTap: () {
                          context.read<BookingBloc>().add(
                            ToggleFavoriteEvent(serviceId: service.id!),
                          );
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.gray),
                          ),
                          child: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: isFav ? Colors.red : AppColors.gray,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            // Booking bar
            bottomNavigationBar: BookingBottomBar(
              price: service.price!.toStringAsFixed(2),
              buttonText: 'serviceDetails.book'.tr(),
              buttonStyle: AppButtons.small,
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
                        title: context.isArabic
                            ? service.titleAr ?? ''
                            : service.titleEn ?? '',
                        location: context.isArabic
                            ? service.locations?.first.city?.nameAr ?? ''
                            : service.locations?.first.city?.nameEn ?? '',
                        imagePath: service.servicImage?.first.imageUrl ?? '',
                        rating:
                            (service.ratings != null &&
                                service.ratings!.isNotEmpty)
                            ? service.ratings!.first.rating ?? 0.0
                            : 0.0,

                        reviewCount: service.ratings?.length ?? 0,
                        width: context.getWidth(factor: 0.9),
                        height: context.getHeight(factor: 0.23),

                        showReviewCount: true,
                        onTap: () {},
                        icon: Icons.chat_bubble_outline,

                        onIconPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChattingScreen(
                                sender: ModelMessage(
                                  content: "سيبشسيب",
                                  date: "sdgsdfg",
                                  id: 2567895,
                                  owner: "Sdfsdgf",
                                  providerAuthId: "sdfasdf",
                                  status: "send",
                                  user: User(name: "Zdf", avatar: "dddd"),
                                  userAuthId: "Sdfsdfg",
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      ImageGallery(imageUrls: service.servicImage!),
                      AppSpacing.h32,
                      // Description section
                      ServiceDescriptionSection(
                        title: 'serviceDetails.about'.tr(),
                        description: context.isArabic
                            ? service.descriptionAr ?? ''
                            : service.descriptionEn ?? '',
                      ),

                      AppSpacing.h24,

                      // Map section
                      Text(
                        'serviceDetails.location'.tr(),
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.blue,
                            ),
                      ),
                      AppSpacing.h8,
                      GoogleMapWidget(
                        latitude: service.locations?.first.latitude ?? 44,
                        longitude: service.locations?.first.longitude ?? 22,
                        label: context.isArabic ? '' : service.titleAr ?? '',
                      ),

                      AppSpacing.h24,

                      // Calendar section
                      Text(
                        'serviceDetails.availableDates'.tr(),
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.blue,
                            ),
                      ),
                      AppSpacing.h8,

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

                      AppSpacing.h24,

                      // Reviews section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${'serviceDetails.reviews'.tr()} (${service.ratings?.length ?? 0})',
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
                              AppSpacing.w4,
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
                      if (service.ratings != null &&
                          service.ratings!.isNotEmpty) ...[
                        AppSpacing.h8,
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
