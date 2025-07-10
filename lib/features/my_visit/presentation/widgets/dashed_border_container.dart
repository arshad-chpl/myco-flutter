import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class DashedBorderContainer extends StatelessWidget {
  final Widget child;

  const DashedBorderContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) => CustomPaint(
    painter: DashedBorderPainter(
      color: AppColors.primary,
      radius: 12 * Responsive.getResponsive(context),
    ),
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.018 * Responsive.getWidth(context),
      ),
      child: child,
    ),
  );
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double radius;
  final double dashWidth;
  final double dashSpace;

  DashedBorderPainter({
    required this.color,
    required this.radius,
    this.dashWidth = 5,
    this.dashSpace = 3,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final rect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );

    final path = Path()..addRRect(rect);

    final dashPath = _createDashedPath(path);
    canvas.drawPath(dashPath, paint);
  }

  Path _createDashedPath(Path source) {
    final Path path = Path();
    for (PathMetric pathMetric in source.computeMetrics()) {
      double distance = 0;
      while (distance < pathMetric.length) {
        final next = distance + dashWidth;
        path.addPath(pathMetric.extractPath(distance, next), Offset.zero);
        distance = next + dashSpace;
      }
    }
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
