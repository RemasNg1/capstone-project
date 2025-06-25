import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String imagePath;

  const Avatar({super.key, required this.imagePath});

  // A widget that displays a rounded rectangular avatar image with responsive width and height based on screen size.

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          imagePath,
          width: context.getWidth(factor: 0.3),
          height: context.getHeight(factor: 0.13),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
