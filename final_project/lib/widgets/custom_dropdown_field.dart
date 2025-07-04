import 'package:flutter/material.dart';

class CustomDropdownField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? value;
  final Map<String, int> items;
  final void Function(int?) onChanged;

  const CustomDropdownField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      isExpanded: true,
      items: items.keys
          .map(
            (name) => DropdownMenuItem<String>(value: name, child: Text(name)),
          )
          .toList(),
      onChanged: (selectedName) {
        onChanged(items[selectedName]);
      },
    );
  }
}
