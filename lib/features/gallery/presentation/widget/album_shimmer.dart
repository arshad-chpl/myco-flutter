import 'package:flutter/material.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:shimmer/shimmer.dart';

class AlbumShimmer extends StatelessWidget {
  const AlbumShimmer({super.key});

  @override
  Widget build(BuildContext context) => GridView.builder(
    itemCount: 6, // Number of shimmer items
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 16 * Responsive.getResponsive(context),
      mainAxisSpacing: 24 * Responsive.getResponsive(context),
      childAspectRatio: 0.65,
    ),
    itemBuilder: (context, index) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 90,
            width: double.infinity,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 16,
            width: double.infinity,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(height: 14, width: 60, color: Colors.white),
        ),
      ],
    ),
  );
}
