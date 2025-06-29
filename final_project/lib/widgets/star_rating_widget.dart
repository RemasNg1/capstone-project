import 'package:flutter/material.dart';

class StarRatingWidget extends StatelessWidget {
  final double rating; // بين 0 و 5
  final int maxStars;

  const StarRatingWidget({super.key, required this.rating, this.maxStars = 5});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(maxStars, (index) {
        final isFilled = index < rating.round();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Image.asset(
            isFilled
                ? 'assets/icons/star_filled.png'
                : 'assets/icons/star_empty.png',
            width: 10,
            height: 10,
          ),
        );
      }),
    );
  }
}
