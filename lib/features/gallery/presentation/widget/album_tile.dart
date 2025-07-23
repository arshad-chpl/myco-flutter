import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/cached_image_holder.dart';

/// AlbumTile displays a 2x2 grid of album images.
/// Only shows the image grid; no text or dates.
class AlbumTile extends StatelessWidget {
  final List<String> imageUrls;

  /// Constructs an AlbumTile with a list of (up to 4) image URLs.
  /// If fewer than 4 images, blank squares are used for remaining cells.
  const AlbumTile({required this.imageUrls, super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure there are always exactly 4 images for the 2x2 layout.
    final displayImages = List<String>.from(imageUrls);
    while (displayImages.length < 4) {
      displayImages.add(''); // Fill with blank strings as placeholders.
    }

    // Grid side length is made responsive to device size.
    final side = 130 * Responsive.getResponsive(context);

    return SizedBox(
      height: side,
      width: side,
      child: GridView.builder(
        physics:
            const NeverScrollableScrollPhysics(), // Prevent scrolling inside tile
        padding: EdgeInsets.zero, // Remove default GridView padding
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns for a 2x2 grid
          mainAxisSpacing: 2, // Small spacing between grid items
          crossAxisSpacing: 2,
        ),
        itemCount: 4,
        itemBuilder: (context, i) {
          final img = displayImages[i];
          return ClipRRect(
            borderRadius: BorderRadius.circular(
              4 * Responsive.getResponsive(context), // Responsive rounding
            ),
            child: CachedImage(
              imageUrl: img,
              errorWidget: Image.asset(AppAssets.myCoLogo),
            ),
          );
        },
      ),
    );
  }
}
