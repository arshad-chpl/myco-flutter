import 'package:flutter/material.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:shimmer/shimmer.dart';

class ShortLeaveCardSkeleton extends StatelessWidget {
  const ShortLeaveCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.getResponsive(context);
    final textResponsive = Responsive.getResponsiveText(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8 * responsive),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10 * responsive),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: double.infinity,
            height: 40 * responsive,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10 * responsive)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16 * responsive),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: 100 * responsive,
                    height: 14 * textResponsive,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          // Body
          Padding(
            padding: EdgeInsets.all(10 * responsive),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Leave type and time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSkeletonBox(width: 60 * responsive, height: 18 * textResponsive),
                    _buildSkeletonBox(width: 50 * responsive, height: 14 * textResponsive),
                  ],
                ),
                const SizedBox(height: 8),

                // Leave reason
                _buildSkeletonBox(width: double.infinity, height: 14 * textResponsive),
                const SizedBox(height: 4),
                _buildSkeletonBox(width: 200 * responsive, height: 14 * textResponsive),
                const SizedBox(height: 8),

                // Status
                _buildSkeletonBox(width: 100 * responsive, height: 14 * textResponsive),
                const SizedBox(height: 8),

                // Rejection Reason block
                _buildSkeletonBox(width: 120 * responsive, height: 14 * textResponsive),
                const SizedBox(height: 4),
                _buildSkeletonBox(width: double.infinity, height: 14 * textResponsive),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkeletonBox({required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
