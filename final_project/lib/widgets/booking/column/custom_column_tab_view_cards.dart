import 'package:final_project/models/booking/model_booking.dart';
import 'package:final_project/models/temp_bookin/booking_temp_model.dart';
import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:final_project/widgets/booking/Container/container_booking_card.dart';

import 'package:flutter/material.dart';

/// A widget that displays list of booking cards.
/// It accepts a list of `ModelBooking` and renders each item using `ContainerBookingCard`.
class CustomColumnTabViewCards extends StatelessWidget {
  const CustomColumnTabViewCards({super.key, required this.bookingList});

  /// The list of bookings to be displayed
  final List<ModelBooking>? bookingList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.getHeight(factor: 0.6),
          width: context.getWidth(),
          child: ListView.builder(
            itemCount:
                bookingList?.length ?? 0, // Number of bookings to display
            itemBuilder: (BuildContext context, int index) {
              return ContainerBookingCard(
                item: bookingList![index], // Booking item at the current index
                onTapChat: () {
                  print("onTapChat ${bookingList![index].id}");
                },

                // Called when the rating button is tapped
                onTapRating: () {
                  print("onTapRating ${bookingList![index].id}");
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
