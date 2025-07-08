import 'package:final_project/models/booking/model_booking.dart';
import 'package:final_project/models/temp_bookin/booking_temp_model.dart';
import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:final_project/widgets/booking/Container/container_booking_card.dart';

import 'package:flutter/material.dart';

class CustomColumnTabViewCards extends StatelessWidget {
  const CustomColumnTabViewCards({super.key, required this.bookingList});
  final List<ModelBooking>? bookingList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.getHeight(factor: 0.6),
          width: context.getWidth(),
          child: ListView.builder(
            itemCount: bookingList?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return ContainerBookingCard(
                item: bookingList![index],
                onTapChat: () {
                  print(" onTapChat ${bookingList![index].id}");
                },
                onTapRating: () {
                  print(" onTapRating ${bookingList![index].id}");
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
