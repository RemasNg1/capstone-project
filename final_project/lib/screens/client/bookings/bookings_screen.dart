import 'package:final_project/screens/booking/enum/types.dart';
import 'package:final_project/screens/booking/helper/functions.dart';
import 'package:final_project/screens/booking/models/booking_temp_model.dart';
import 'package:final_project/screens/booking/widget/column/custom_column_tab_view_cards.dart';
import 'package:final_project/screens/booking/widget/tab%20view/custom_tab_view.dart';
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
