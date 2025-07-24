import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ContactAdminShimmer extends StatelessWidget {
  const ContactAdminShimmer({super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(26.0),
      child: Column(
        children: [
          // The profile card area
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Circle shimmer
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Lines shimmer
                _buildShimmerLine(context, 200),
                const SizedBox(height: 10),
                _buildShimmerLine(context, 180),
                const SizedBox(height: 10),
                _buildShimmerLine(context, 160),
                const SizedBox(height: 10),
                _buildShimmerLine(context, 140),

                const SizedBox(height: 20),

                // Buttons shimmer
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildButtonShimmer(),
                    _buildButtonShimmer(),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Bottom image area
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );

  Widget _buildShimmerLine(BuildContext context, double width) => Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: 14,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );

  Widget _buildButtonShimmer() => Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: 140,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
}
