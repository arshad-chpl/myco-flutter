import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;

  const CustomShimmer.line({
    super.key,
    this.height = 30,
    this.width = double.infinity,
    this.borderRadius = 10,
    this.margin,
  });

  @override
  Widget build(BuildContext context) => Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
}

class LeaveTypeShimmer extends StatelessWidget {
  const LeaveTypeShimmer({super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: const Column(
          children: [
            CustomShimmer.line(),
            SizedBox(height: 10),
            CustomShimmer.line(),
            SizedBox(height: 10),
            CustomShimmer.line(),
          ],
        ),
      ),
    );
}