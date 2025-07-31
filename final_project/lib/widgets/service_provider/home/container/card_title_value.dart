import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';

class CardTitleValue extends StatelessWidget {
  const CardTitleValue({
    super.key,
    required this.title,
    required this.value,
    this.customWidth,
  });
  final String title;
  final String value;
  final double? customWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      width: customWidth ?? context.getWidth(factor: 0.4),
      decoration: BoxDecoration(
        // color: Colors.white,
        color: Theme.of(context).colorScheme.primaryContainer,

        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.3),

            // color: Colors.grey.shade200,
            spreadRadius: 2,
            blurRadius: 5,
            // offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: [Text(title), Text(value)]),
    );
  }
}
