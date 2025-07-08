import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/widgets/booking/column/provider_custom_column_tab_view_cards.dart';
import 'package:flutter/material.dart';
import 'package:final_project/repo/booking_repo.dart';
import 'package:final_project/screens/service_provider/service_booking2/bloc/service_booking_bloc.dart';
import 'package:final_project/screens/service_provider/service_booking2/bloc/service_booking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ServicesBookingsScreen extends StatelessWidget {
  const ServicesBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookingsBloc(BookingRepository(Supabase.instance.client))
            ..add(LoadBookings()),
      child: const _BookingsContent(),
    );
  }
}

class _BookingsContent extends StatelessWidget {
  const _BookingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Provides tab controller for the booking tabs
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("bookings.myBookings".tr()), // Localized screen title
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            tabs: [
              Tab(text: "bookings.current".tr()), // "Currently"
              Tab(text: "bookings.past".tr()), // "In the past"
              Tab(text: "bookings.canceled".tr()), // "Canceled"
            ],
          ),
        ),
        body: BlocBuilder<BookingsBloc, BookingsState>(
          builder: (context, state) {
            if (state is BookingsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BookingsLoaded) {
              return TabBarView(
                children: [
                  // Tab 1: Current orders - waiting & accepted
                  ProviderCustomColumnTabViewCards(
                    waitingList: state.waiting,
                    acceptedList: state.current,
                    showActionButtons: true,
                  ),

                  // Tab 2: Past orders
                  ProviderCustomColumnTabViewCards(
                    bookingList: state.past,
                    waitingList: [],
                    acceptedList: [],
                  ),

                  // Tab 3: Canceled orders
                  ProviderCustomColumnTabViewCards(
                    bookingList: state.canceled,
                    waitingList: [],
                    acceptedList: [],
                  ),
                ],
              );
            } else if (state is BookingsError) {
              return Center(child: Text("Error: ${state.message}"));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
