import 'package:final_project/core/helper/functions.dart';
import 'package:final_project/models/temp_bookin/booking_temp_model.dart';
import 'package:final_project/core/enum/types.dart';
import 'package:final_project/widgets/booking/column/custom_column_tab_view_cards.dart';
import 'package:final_project/widgets/booking/tab%20view/custom_tab_view.dart';
import 'package:flutter/material.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTabView(
      titlePage: 'My bookings',
      tabTitles: {"Currently", "in the past", "Canceled"},
      setOfTabView: {
        // Currently view
        CustomColumnTabViewCards(
          bookingList: getBookingWithSameStatus(
            bookingList,
            EnumBookingStatus.send,
          ),
        ),
        // in the past view
        CustomColumnTabViewCards(
          bookingList: getBookingWithSameStatus(
            bookingList,
            EnumBookingStatus.accepted,
          ),
        ),
        // Canceled view
        CustomColumnTabViewCards(
          bookingList: getBookingWithSameStatus(
            bookingList,
            EnumBookingStatus.rejected,
          ),
        ),
      },
    );
  }
}
