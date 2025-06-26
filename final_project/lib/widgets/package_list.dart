import 'package:final_project/models/model.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:flutter/material.dart';

class PackagesList extends StatelessWidget {
  final List<PackageModel> packages;
  final List<String> selectedIds;
  final void Function(String id)? onToggle;

  const PackagesList({
    super.key,
    required this.packages,
    required this.selectedIds,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: packages.map((pkg) {
        final isSelected = selectedIds.contains(pkg.id);

        return GestureDetector(
          onTap: () => onToggle?.call(pkg.id),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    pkg.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: isSelected ? AppColors.black : AppColors.gray,
                    ),
                  ),
                ),
                Text(
                  '${pkg.price} SR',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: isSelected ? AppColors.blue : AppColors.gray,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
