import 'package:final_project/core/enum/types.dart';
import 'package:final_project/core/helper/functions.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class IncomingChart extends StatelessWidget {
  const IncomingChart({super.key, required this.title, required this.valuesToDisplay, required this.typeOfShowChart});

  final String title;
  final EnumTypeOfShowChart typeOfShowChart;
  final Color leftBarColor = AppColors.contentColorYellow;
  final double width = 16;
  final List<int> valuesToDisplay;


  @override
  Widget build(BuildContext context) {
   final List<BarChartGroupData> rawBar = makeGroupDataStatic(valuesToDisplay:valuesToDisplay, width:16);

    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title, 
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff77839a),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 38),
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 20,
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
                        getTitlesWidget: bottomTitles,
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 34,
                        interval: 1,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  
                  borderData: FlBorderData(show: false),
                  barGroups: rawBar, 
                  gridData: const FlGridData(show: true),
                ),
                
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 13,
    );
    String text=leftSideIncomingTitle(value);
    if(text.isEmpty) {
      return Container();
    }
    return SideTitleWidget(
      meta: meta,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
   final List<String> dayTitles = ['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];
   final List<String> yearTitles = ['2020', '2021', '2022', '2023', '2024', '2025', '2026'];
   final List<String> monthTitles = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul']; 
   List<String> listTitle=[];
  switch( typeOfShowChart ){
    case EnumTypeOfShowChart.week:
    listTitle=dayTitles;
    break;
    case EnumTypeOfShowChart.month:
    listTitle=monthTitles;
    break;
    case EnumTypeOfShowChart.year:
    listTitle=yearTitles;
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
    return SideTitleWidget(
      meta: meta,
      space: 14, 
      child: text,
    );
  }
}
