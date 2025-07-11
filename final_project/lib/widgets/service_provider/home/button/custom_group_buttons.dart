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

  // Callback to handle when the tab is changed
  final Function(EnumTypeOfShowChart newSelection) onChanged;

  // Currently selected tab (week, month, or year)
  final EnumTypeOfShowChart selected;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // Number of tabs
      length: 3,
      // Set initial tab index based on selected value
      initialIndex: selected.index,
      child: Builder(
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                // When a tab is tapped, trigger onChanged callback
                onTap: (index) {
                  onChanged(EnumTypeOfShowChart.values[index]);
                },

                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorWeight: 4.0,
                // Custom underline indicator for selected tab
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 4.0,
                    color: AppColors.mediumBlue,
                  ),
                ),
                // Define the three tabs: Week, Month, Year
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
