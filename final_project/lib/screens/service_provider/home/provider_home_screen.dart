// import 'package:final_project/screens/service_provider/home/bloc/provider_home_bloc.dart';
// import 'package:final_project/style/app_spacing.dart';
// import 'package:final_project/utils/extensions/screen/screen_size.dart';

// import 'package:final_project/widgets/service_provider/home/button/custom_group_buttons.dart';
// import 'package:final_project/widgets/service_provider/home/chart/incoming_chart.dart';
// import 'package:final_project/widgets/service_provider/home/container/card_title_value.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:easy_localization/easy_localization.dart';

// class ProviderHomeScreen extends StatelessWidget {
//   const ProviderHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text("home.home_page".tr()),
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Container(
//             padding: const EdgeInsets.all(16),
//             child: BlocProvider(
//               create: (context) => ProviderHomeBloc(),
//               child: Builder(
//                 builder: (context) {
//                   final bloc = context.read<ProviderHomeBloc>();
//                   final int totalIncoming = bloc.listOfValue
//                       .fold(0, (a, b) => a + b)
//                       .toInt();

//                   return BlocBuilder<ProviderHomeBloc, ProviderHomeState>(
//                     builder: (context, state) {
//                       return Column(
//                         children: [
//                           Expanded(
//                             child: ListView(
//                               children: <Widget>[
//                                 AppSpacing.h32,

//                                 //  الكروت
//                                 Column(
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         CardTitleValue(
//                                           title: "home.rejected_order".tr(),
//                                           value: "${bloc.rejectedOrder}",
//                                         ),
//                                         CardTitleValue(
//                                           title: "home.accepted_order".tr(),
//                                           value: "${bloc.acceptedOrder}",
//                                         ),
//                                       ],
//                                     ),
//                                     AppSpacing.h16,
//                                     CardTitleValue(
//                                       title: "home.total_incoming".tr(),
//                                       value: "$totalIncoming SAR",
//                                       customWidth: context.getWidth(
//                                         factor: 0.85,
//                                       ),
//                                     ),
//                                   ],
//                                 ),

//                                 AppSpacing.h24,

//                                 //  التاب بار
//                                 // CustomTabSwitcher(
//                                 //   selected: bloc.selectedDataView,
//                                 //   onChanged: (newSelection) {
//                                 //     bloc.add(
//                                 //       ChangeDataView(
//                                 //         selectedDataView: newSelection,
//                                 //       ),
//                                 //     );
//                                 //   },
//                                 // ),
//                                 BlocBuilder<
//                                   ProviderHomeBloc,
//                                   ProviderHomeState
//                                 >(
//                                   builder: (context, state) {
//                                     final selectedType = context
//                                         .read<ProviderHomeBloc>()
//                                         .selectedDataView;

//                                     return CustomTabSwitcher(
//                                       selected: selectedType,
//                                       onChanged: (newType) {
//                                         context.read<ProviderHomeBloc>().add(
//                                           ChangeDataView(newType),
//                                         );
//                                       },
//                                     );
//                                   },
//                                 ),

//                                 //  الرسم البياني
//                                 IncomingChart(
//                                   title: "home.incoming".tr(),
//                                   valuesToDisplay: bloc.listOfValue,
//                                   typeOfShowChart: bloc.selectedDataView,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:final_project/screens/service_provider/home/bloc/provider_home_bloc.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/utils/extensions/screen/screen_size.dart';

import 'package:final_project/widgets/service_provider/home/button/custom_group_buttons.dart';
import 'package:final_project/widgets/service_provider/home/chart/incoming_chart.dart';
import 'package:final_project/widgets/service_provider/home/container/card_title_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

/// Displays summary statistics and a chart based on selected data view.
class ProviderHomeScreen extends StatelessWidget {
  const ProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Remove back button
        automaticallyImplyLeading: false,

        title: Text("home.home_page".tr()),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: BlocProvider(
              // Create the ProviderHomeBloc instance
              create: (context) => ProviderHomeBloc(),
              child: BlocBuilder<ProviderHomeBloc, ProviderHomeState>(
                builder: (context, state) {
                  final bloc = context.read<ProviderHomeBloc>();

                  // Calculate total income from the list of values
                  final int totalIncoming = bloc.listOfValue
                      .fold(0, (a, b) => a + b)
                      .toInt();

                  return Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            AppSpacing.h32,
                            // Order summary cards (accepted, rejected, total incoming)
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // Rejected orders card
                                    CardTitleValue(
                                      title: "home.rejected_order".tr(),
                                      value: "${bloc.rejectedOrder}",
                                    ),
                                    // Accepted orders card
                                    CardTitleValue(
                                      title: "home.accepted_order".tr(),
                                      value: "${bloc.acceptedOrder}",
                                    ),
                                  ],
                                ),
                                AppSpacing.h16,

                                // Total income card
                                CardTitleValue(
                                  title: "home.total_incoming".tr(),
                                  value: "$totalIncoming SAR",
                                  customWidth: context.getWidth(factor: 0.85),
                                ),
                              ],
                            ),

                            AppSpacing.h24,
                            // Tab bar to switch chart data view (e.g., weekly/monthly)
                            CustomTabSwitcher(
                              selected: bloc.selectedDataView,
                              onChanged: (newType) {
                                bloc.add(ChangeDataView(newType));
                              },
                            ),

                            // Income chart visualization
                            IncomingChart(
                              title: "home.incoming".tr(),
                              valuesToDisplay: bloc.listOfValue,
                              typeOfShowChart: bloc.selectedDataView,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
