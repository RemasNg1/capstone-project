// import 'package:final_project/screens/service_provider/services_bookings/bloc/bookings_bloc.dart';
// import 'package:final_project/screens/service_provider/services_bookings/blocBookingImage/bloc/booking_image_bloc.dart';
// import 'package:final_project/widgets/booking/column/custom_column_tab_view_cards.dart';
// import 'package:final_project/widgets/booking/tab%20view/custom_tab_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:easy_localization/easy_localization.dart';

// class ServicesBookingsScreen extends StatelessWidget {
//   const ServicesBookingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<BookingsBloc>(
//           create: (BuildContext context) =>
//               BookingsBloc()..add(BookingsLoadingData()),
//         ),
//         BlocProvider<BookingImageBloc>(
//           create: (BuildContext context) => BookingImageBloc(),
//         ),
//       ],
//       child: Builder(
//         builder: (context) {
//           var bloc = context.read<BookingsBloc>();
//           return BlocBuilder<BookingsBloc, BookingsState>(
//             builder: (context, state) {
//               print("BookingsBloc state: $state");

//               // if (state is BookingsInitial) {
//               //   bloc.add(BookingsLoadingData());
//               // }
//               if (state is BookingLoadingSuccessfully) {
//                 return CustomTabView(
//                   titlePage: 'bookings.my_bookings'.tr(),
//                   tabTitles: {
//                     "bookings.current".tr(),
//                     "bookings.past".tr(),
//                     "bookings.canceled".tr(),
//                   },
//                   setOfTabView: {
//                     // Currently view
//                     CustomColumnTabViewCards(
//                       bookingList: bloc.currentBookingAccepted!,
//                     ),
//                     // in the past view
//                     CustomColumnTabViewCards(bookingList: bloc.pastBooking!),
//                     // Canceled view
//                     CustomColumnTabViewCards(
//                       bookingList: bloc.canceledBooking!,
//                     ),
//                   },
//                 );
//               } else {
//                 return Center(child: CircularProgressIndicator());
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }
