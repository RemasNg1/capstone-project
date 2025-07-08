// import 'package:final_project/core/enum/types.dart';
// import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';

// class CustomGroupButtons extends StatelessWidget {
//   const CustomGroupButtons({
//     super.key,
//     required this.onSelection,
//     required this.selected,
//   });

//   final Function(Set<EnumTypeOfShowChart> newSelection)? onSelection;
//   final EnumTypeOfShowChart selected;

//   @override
//   Widget build(BuildContext context) {
//     return SegmentedButton<EnumTypeOfShowChart>(
//       segments: <ButtonSegment<EnumTypeOfShowChart>>[
//         ButtonSegment<EnumTypeOfShowChart>(
//           value: EnumTypeOfShowChart.week,
//           label: Text('home.week'.tr()),

//         ),
//         ButtonSegment<EnumTypeOfShowChart>(
//           value: EnumTypeOfShowChart.month,
//           label: Text('home.month'.tr()),
//         ),
//         ButtonSegment<EnumTypeOfShowChart>(
//           value: EnumTypeOfShowChart.year,
//           label: Text('home.year'.tr()),
//         ),
//       ],
//       selected: <EnumTypeOfShowChart>{selected},
//       onSelectionChanged: onSelection,
//     );
//   }
// }

// // (Set<EnumTypeOfShowChart> newSelection) {
// //         // setState(() {
// //         //   selected= newSelection.first;
// //         // });
// //       },

// import 'package:final_project/core/enum/types.dart';
// import 'package:final_project/style/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';

// class CustomTabSwitcher extends StatelessWidget {
//   const CustomTabSwitcher({
//     super.key,
//     required Null Function(dynamic newSelection) onChanged,
//     required EnumTypeOfShowChart selected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       initialIndex: 0,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TabBar(
//             labelStyle: const TextStyle(fontWeight: FontWeight.bold),
//             labelColor: Colors.black,
//             indicatorWeight: 4.0,
//             unselectedLabelColor: Colors.grey,
//             indicator: const UnderlineTabIndicator(
//               borderSide: BorderSide(width: 4.0, color: AppColors.mediumBlue),
//             ),
//             tabs: [
//               Tab(text: 'home.week'.tr()),
//               Tab(text: 'home.month'.tr()),
//               Tab(text: 'home.year'.tr()),
//             ],
//           ),

//           // Expanded(
//           //   child: TabBarView(
//           //     children: [
//           //       WeeklyWidget(),
//           //       MonthlyWidget(),
//           //       YearlyWidget(),
//           //     ],
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }

import 'package:final_project/core/enum/types.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomTabSwitcher extends StatelessWidget {
  const CustomTabSwitcher({
    super.key,
    required this.onChanged,
    required this.selected,
  });

  final Function(EnumTypeOfShowChart newSelection) onChanged;
  final EnumTypeOfShowChart selected;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: selected.index,
      child: Builder(
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                onTap: (index) {
                  onChanged(EnumTypeOfShowChart.values[index]);
                },
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorWeight: 4.0,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 4.0,
                    color: AppColors.mediumBlue,
                  ),
                ),
                tabs: [
                  Tab(text: 'home.week'.tr()),
                  Tab(text: 'home.month'.tr()),
                  Tab(text: 'home.year'.tr()),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
