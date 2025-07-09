import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onEditTap;

  const Avatar({super.key, required this.imagePath, this.onEditTap});

  @override
  Widget build(BuildContext context) {
    final double avatarWidth = context.getWidth(factor: 0.3);
    final double avatarHeight = context.getHeight(factor: 0.13);

    return Align(
      alignment: Alignment.center,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imagePath,
              width: avatarWidth,
              height: avatarHeight,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: -8,
            right: -8,
            child: GestureDetector(
              onTap: onEditTap,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.edit, color: Colors.white, size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
