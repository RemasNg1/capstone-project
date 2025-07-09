import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:final_project/widgets/booking/Container/provider_container_booking_card.dart';
import 'package:flutter/material.dart';
import 'package:final_project/models/booking_model/service_request.dart';

import 'package:easy_localization/easy_localization.dart';

/// This widget displays booking cards for service providers inside a tab view.
/// It supports three main types of bookings:
/// 1. Waiting for response
/// 2. Accepted
/// 3. Past or canceled (via bookingList)

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

    // Case: show generic booking list (past or canceled)
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

    // Case: display waiting and accepted bookings
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Waiting bookings section
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

          // Accepted bookings section
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
                    // onTapChat: () =>
                    //     print("Chat with accepted booking ID: ${booking.id}"),
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
