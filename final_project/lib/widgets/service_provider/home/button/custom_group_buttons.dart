import 'package:final_project/core/enum/types.dart';
import 'package:flutter/material.dart';

class CustomGroupButtons extends StatelessWidget {
  const CustomGroupButtons({
    super.key,
    required this.onSelection,
    required this.selected,
  });
  final Function(Set<EnumTypeOfShowChart> newSelection)? onSelection;
  final EnumTypeOfShowChart selected;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<EnumTypeOfShowChart>(
      segments: const <ButtonSegment<EnumTypeOfShowChart>>[
        ButtonSegment<EnumTypeOfShowChart>(value: EnumTypeOfShowChart.week, label: Text('Week')),
        ButtonSegment<EnumTypeOfShowChart>(value: EnumTypeOfShowChart.month, label: Text('Month')),
        ButtonSegment<EnumTypeOfShowChart>(value: EnumTypeOfShowChart.year, label: Text('Year')),
      ],
      selected: <EnumTypeOfShowChart>{selected},
      onSelectionChanged: onSelection,
    );
  }
}

// (Set<EnumTypeOfShowChart> newSelection) {
//         // setState(() {
//         //   selected= newSelection.first;
//         // });
//       },
