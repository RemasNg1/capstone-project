//

import 'package:final_project/models/services_models/service_image/service_image_model.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:flutter/material.dart';

class ImageGallery extends StatelessWidget {
  final List<ServiceImageModel> imageUrls;
  final VoidCallback? onMorePressed;

  const ImageGallery({super.key, required this.imageUrls, this.onMorePressed});

  void _openImageViewer(BuildContext context, int initialIndex) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: AppColors.white,
          insetPadding: EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            height: 400,
            child: PageView.builder(
              controller: PageController(initialPage: initialIndex),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return InteractiveViewer(
                  child: Image.network(
                    imageUrls[index].imageUrl!,
                    fit: BoxFit.contain,
                    height: 400,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayImages = imageUrls.take(6).toList();
    final remainingCount = imageUrls.length - displayImages.length;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              ...displayImages.asMap().entries.map((entry) {
                final index = entry.key;
                final url = entry.value;

                final isLastImage = index == 2 && remainingCount > 0;

                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () {
                      if (isLastImage && onMorePressed != null) {
                        onMorePressed!();
                      } else {
                        _openImageViewer(context, index);
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                      child: isLastImage
                          ? Container(
                              width: 96,
                              height: 91,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(url.imageUrl!),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Color(0x66000000),
                                    //merage color
                                    BlendMode.darken,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(17),
                              ),
                              child: Center(
                                child: Text(
                                  '+$remainingCount',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : Image.network(
                              url.imageUrl!,
                              width: 100,
                              height: 91,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
