import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/screens/client/bookings/bloc/bookings_bloc.dart';
import 'package:final_project/screens/client/bookings/blocBookingImage/bloc/booking_image_bloc.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/widgets/booking/column/custom_column_tab_view_cards.dart';
import 'package:final_project/widgets/booking/tab%20view/custom_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookingsBloc>(
          create: (BuildContext context) => BookingsBloc(),
        ),
        BlocProvider<BookingImageBloc>(
          create: (BuildContext context) => BookingImageBloc(),
        ),
      ],
      child: Builder(
        builder: (context) {
          var bloc = context.read<BookingsBloc>();
          return BlocBuilder<BookingsBloc, BookingsState>(
            builder: (context, state) {
              if (state is BookingsInitial) {
                bloc.add(BookingsLoadingData());
              }
              if (state is BookingLoadingSuccessfully ||
                  state is RatingUpdatedState) {
                return CustomTabView(
                  titlePage: 'bookings.my_bookings'.tr(),
                  tabTitles: {
                    "bookings.current".tr(),
                    "bookings.past".tr(),
                    "bookings.canceled".tr(),
                  },
                  setOfTabView: {
                    // Currently view
                    CustomColumnTabViewCards(
                      bookingList: bloc.currentBookingAccepted!,
                    ),
                    // in the past view
                    CustomColumnTabViewCards(bookingList: bloc.pastBooking!),
                    // Canceled view
                    CustomColumnTabViewCards(
                      bookingList: bloc.canceledBooking!,
                    ),
                  },
                );
              }
              if (state is UserLoggedInAsAnonymousState) {
                return Scaffold(
                  appBar: AppBar(title: Text("bookings.my_bookings".tr())),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/no_bookings.png'),
                      Text("bookings.booking_empty_message".tr()),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: AppColors.blue,
                    size: 100,
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
