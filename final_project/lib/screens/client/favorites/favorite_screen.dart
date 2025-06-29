import 'package:final_project/data/dummy_data.dart';
import 'package:final_project/models/model.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/widgets/category_card.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DummyService> services = List.generate(3, (_) => dummyService);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Favorite',
          style: TextStyle(color: AppColors.dimGray, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: services.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 162 / 190,
          ),
          itemBuilder: (context, index) {
            final service = services[index];
            return CategoryCard(
              showFavorite: false,
              imageUrl: service.mainImage,
              title: service.name,
              location: service.location,
              rating: service.rating,
              ratingCount: service.reviews.length,
            );
          },
        ),
      ),
    );
  }
}
