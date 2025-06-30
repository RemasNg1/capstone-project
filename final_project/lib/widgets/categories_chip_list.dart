import 'package:final_project/data/dummy_data.dart';
import 'package:final_project/models/model.dart';
import 'package:final_project/widgets/category_chip.dart';
import 'package:flutter/material.dart';

class CategoriesChipList extends StatelessWidget {
  final void Function(CategoryModel category) onCategoryTap;

  const CategoriesChipList({super.key, required this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dummyCategories.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final category = dummyCategories[index];
          return CategoryChip(
            category: category,
            //isSelected: false,
            onTap: () => onCategoryTap(category),
          );
        },
      ),
    );
  }
}
