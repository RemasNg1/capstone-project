import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:final_project/widgets/booking/Container/provider_container_booking_card.dart';
import 'package:flutter/material.dart';
import 'package:final_project/models/booking_model/service_request.dart';

import 'package:easy_localization/easy_localization.dart';

class ProviderCustomColumnTabViewCards extends StatelessWidget {
  final List<ServiceRequest> waitingList;
  final List<ServiceRequest> acceptedList;
  final List<ServiceRequest>? bookingList;
  final bool showActionButtons;

  const ProviderCustomColumnTabViewCards({
    super.key,
    this.waitingList = const [],
    this.acceptedList = const [],
    this.bookingList,
    this.showActionButtons = false,
  });

  @override
  Widget build(BuildContext context) {
    final height = context.getHeight(factor: 0.6);
    final width = context.getWidth();

    // General case for "past" and "canceled" bookings
    if (bookingList != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SizedBox(
          height: height,
          width: width,
          child: ListView.builder(
            itemCount: bookingList!.length,
            itemBuilder: (context, index) {
              final booking = bookingList![index];
              return ProviderContainerBookingCard(
                item: booking,
                showActionButtons: false,
                // onTapChat: () => print("Chat with booking ID: ${booking.id}"),
              );
            },
          ),
        ),
      );
    }

    // Case for "waiting" and "accepted" bookings
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (waitingList.isNotEmpty) ...[
            Text(
              "bookings.awaitingResponse".tr(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
            AppSpacing.h8,
            SizedBox(
              height: height,
              width: width,
              child: ListView.builder(
                itemCount: waitingList.length,
                itemBuilder: (context, index) {
                  final booking = waitingList[index];
                  return ProviderContainerBookingCard(
                    item: booking,
                    showActionButtons: true,
                    // onTapChat: () =>
                    //     print("Chat with waiting booking ID: ${booking.id}"),
                  );
                },
              ),
            ),
          ],
          if (acceptedList.isNotEmpty) ...[
            AppSpacing.h24,
            Text(
              "bookings.acceptedOrders".tr(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.green,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: height,
              width: width,
              child: ListView.builder(
                itemCount: acceptedList.length,
                itemBuilder: (context, index) {
                  final booking = acceptedList[index];
                  return ProviderContainerBookingCard(
                    item: booking,
                    showActionButtons: false,
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
