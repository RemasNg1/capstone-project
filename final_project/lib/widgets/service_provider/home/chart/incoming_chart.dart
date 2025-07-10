// import 'package:final_project/core/enum/types.dart';
// import 'package:final_project/core/helper/functions.dart';
// import 'package:final_project/style/app_colors.dart';
// import 'package:final_project/style/app_spacing.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class IncomingChart extends StatelessWidget {
//   const IncomingChart({
//     super.key,
//     required this.title,
//     required this.valuesToDisplay,
//     required this.typeOfShowChart,
//   });

//   final String title;
//   final EnumTypeOfShowChart typeOfShowChart;
//   final Color leftBarColor = AppColors.lightBlue;
//   final double width = 16;
//   final List<int> valuesToDisplay;

//   @override
//   Widget build(BuildContext context) {
//     final List<BarChartGroupData> rawBar = makeGroupDataStatic(
//       valuesToDisplay: valuesToDisplay,
//       width: 10,
//     );

//     return AspectRatio(
//       aspectRatio: 1,
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Text(
//                   title,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     color: AppColors.mainGridLineColor,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//             // AppSpacing.h16,
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 8,
//                       spreadRadius: 1,
//                       offset: Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: BarChart(
//                     BarChartData(
//                       maxY: 20,
//                       titlesData: FlTitlesData(
//                         show: true,
//                         rightTitles: const AxisTitles(
//                           sideTitles: SideTitles(showTitles: false),
//                         ),
//                         topTitles: const AxisTitles(
//                           sideTitles: SideTitles(showTitles: false),
//                         ),
//                         bottomTitles: AxisTitles(
//                           sideTitles: SideTitles(
//                             showTitles: true,
//                             getTitlesWidget: bottomTitles,
//                             reservedSize: 42,
//                           ),
//                         ),
//                         leftTitles: AxisTitles(
//                           sideTitles: SideTitles(
//                             showTitles: true,
//                             reservedSize: 34,
//                             interval: 1,
//                             getTitlesWidget: leftTitles,
//                           ),
//                         ),
//                       ),
//                       borderData: FlBorderData(show: false),
//                       barGroups: rawBar,
//                       gridData: const FlGridData(show: true),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 12),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget leftTitles(double value, TitleMeta meta) {
//     const style = TextStyle(
//       color: Color(0xff7589a2),
//       fontWeight: FontWeight.bold,
//       fontSize: 13,
//     );
//     String text = leftSideIncomingTitle(value);
//     if (text.isEmpty) {
//       return Container();
//     }
//     return SideTitleWidget(
//       meta: meta,
//       space: 0,
//       child: Text(text, style: style),
//     );
//   }

//   Widget bottomTitles(double value, TitleMeta meta) {
//     final List<String> dayTitles = ['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];
//     final List<String> yearTitles = [
//       '2020',
//       '2021',
//       '2022',
//       '2023',
//       '2024',
//       '2025',
//       '2026',
//     ];
//     final List<String> monthTitles = [
//       'Jan',
//       'Feb',
//       'Mar',
//       'Apr',
//       'May',
//       'Jun',
//       'Jul',
//     ];
//     List<String> listTitle = [];
//     switch (typeOfShowChart) {
//       case EnumTypeOfShowChart.week:
//         listTitle = dayTitles;
//         break;
//       case EnumTypeOfShowChart.month:
//         listTitle = monthTitles;
//         break;
//       case EnumTypeOfShowChart.year:
//         listTitle = yearTitles;
//         break;
//     }
//     final Widget text = Text(
//       listTitle[value.toInt()],
//       style: const TextStyle(
//         color: Color(0xff7589a2),
//         fontWeight: FontWeight.bold,
//         fontSize: 14,
//       ),
//     );
//     return SideTitleWidget(meta: meta, space: 14, child: text);
//   }
// }

import 'package:final_project/core/enum/types.dart';
import 'package:final_project/core/helper/functions.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class IncomingChart extends StatelessWidget {
  const IncomingChart({
    super.key,
    required this.title,
    required this.valuesToDisplay,
    required this.typeOfShowChart,
  });

  final String title;
  final EnumTypeOfShowChart
  typeOfShowChart; // Determines if view is weekly, monthly, yearly
  final Color leftBarColor = AppColors.lightBlue;
  final double width = 16;
  final List<int> valuesToDisplay; // List of data values

  @override
  Widget build(BuildContext context) {
    // Generate bar chart data
    final List<BarChartGroupData> rawBar = makeGroupDataStatic(
      valuesToDisplay: valuesToDisplay,
      width: 10,
    );

    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.mainGridLineColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            // Chart content
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: BarChart(
                    BarChartData(
                      maxY: 20, // Max value on Y axis
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: bottomTitles, // Bottom label
                            reservedSize: 42,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 1,
                            reservedSize: 34,
                            getTitlesWidget: leftTitles, // Left label
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: false), // No border
                      barGroups: rawBar, // Bars data
                      gridData: const FlGridData(show: true), // Show grid
                    ),
                  ),
                ),
              ),
            ),

            AppSpacing.h16,
          ],
        ),
      ),
    );
  }

  // Build Y axis labels (left side)
  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 13,
    );
    String text = leftSideIncomingTitle(value); // Format label
    if (text.isEmpty) return Container();
    return SideTitleWidget(
      meta: meta,
      space: 0,
      child: Text(text, style: style),
    );
  }

  // Build X axis labels (bottom side)
  Widget bottomTitles(double value, TitleMeta meta) {
    final List<String> dayTitles = ['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];
    final List<String> yearTitles = [
      '2025',
      '2026',
      '2027',
      '2028',
      '2029',
      '2030',
      '2031',
    ];
    final List<String> monthTitles = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
    ];

    List<String> listTitle = [];
    // Pick label list depending on selected view type
    switch (typeOfShowChart) {
      case EnumTypeOfShowChart.week:
        listTitle = dayTitles;
        break;
      case EnumTypeOfShowChart.month:
        listTitle = monthTitles;
        break;
      case EnumTypeOfShowChart.year:
        listTitle = yearTitles;
        break;
    }

    final Widget text = Text(
      listTitle[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(meta: meta, space: 14, child: text);
  }
}
