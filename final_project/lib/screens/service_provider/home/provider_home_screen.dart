import 'package:final_project/core/enum/types.dart';
import 'package:final_project/screens/service_provider/home/bloc/provider_home_bloc.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:final_project/widgets/calendar_widget.dart';
import 'package:final_project/widgets/service_provider/home/button/custom_group_buttons.dart';
import 'package:final_project/widgets/service_provider/home/chart/incoming_chart.dart';
import 'package:final_project/widgets/service_provider/home/container/card_title_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProviderHomeScreen extends StatelessWidget {
  ProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home page"),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: BlocProvider(
              create: (context) => ProviderHomeBloc(),
              child: Builder(
                builder: (context) {
                  final bloc = context.read<ProviderHomeBloc>();
                  final int totalIncoming = bloc.listOfValue
                      .fold(0, (a, b) => a + b)
                      .toInt();

                  return BlocBuilder<ProviderHomeBloc, ProviderHomeState>(
                    builder: (context, state) {
                      print("ProviderHomeBloc");
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView(
                              children: <Widget>[
                                AppSpacing.h32,
                                CustomGroupButtons(
                                  selected: bloc.selectedDataView,
                                  onSelection: (newSelection) {
                                    bloc.add(
                                      ChangeDataView(
                                        selectedDataView: newSelection.first,
                                      ),
                                    );
                                  },
                                ),
                                AppSpacing.h32,
                                Column(
                                  spacing: 24,
                                  children: [
                                    Row(
                                      spacing: 4,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CardTitleValue(
                                          title: "Rejected Order",
                                          value: "${bloc.rejectedOrder}",
                                        ),

                                        CardTitleValue(
                                          title: "Accepted Order",
                                          value: "${bloc.acceptedOrder}",
                                        ),
                                      ],
                                    ),
                                    CardTitleValue(
                                      title: "Total Incoming",
                                      // sum all accepted Order if list is empty return 0
                                      value: "$totalIncoming SAR",
                                      customWidth: context.getWidth(
                                        factor: 0.85,
                                      ),
                                    ),
                                  ],
                                ),
                                AppSpacing.h32,

                                IncomingChart(
                                  title: 'Incoming',
                                  valuesToDisplay: bloc.listOfValue,
                                  typeOfShowChart: bloc.selectedDataView,
                                ),
                                AppSpacing.h32,

                                Text(
                                  textAlign: TextAlign.center,
                                  " Booking Schedule",
                                ),
                                AppSpacing.h32,

                                CalendarWidget(
                                  selectedDay: DateTime.now(),
                                  unavailableDays: bloc.unavailableDays,
                                  selectedDays: bloc.selectedDays,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
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
