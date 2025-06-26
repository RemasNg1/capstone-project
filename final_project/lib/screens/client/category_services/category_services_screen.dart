import 'package:final_project/data/dummy_data.dart';
import 'package:final_project/models/model.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/widgets/category_card.dart';
import 'package:flutter/material.dart';

/// CategoryScreen displays a list of services based on selected category.

class CategoryServiceScreen extends StatelessWidget {
  final String categoryName;

  const CategoryServiceScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final List<DummyService> services = List.generate(8, (_) => dummyService);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          categoryName,
          style: TextStyle(color: AppColors.dimGray, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: const TextStyle(color: AppColors.mediumGray),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.mediumGray,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
                onChanged: (value) {
                  // handle search input
                },
              ),
            ),
          ),

          // Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: GridView.builder(
                  itemCount: services.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 160 / 205, // Card ratio
                  ),
                  itemBuilder: (context, index) {
                    final service = services[index];
                    return CategoryCard(
                      imageUrl: service.mainImage,
                      title: service.name,
                      location: service.location,
                      rating: service.rating,
                      ratingCount: service.reviews.length,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
