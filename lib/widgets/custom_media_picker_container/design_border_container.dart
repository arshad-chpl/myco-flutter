import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';


class DesignBorderContainer extends StatelessWidget {
  final Widget child;
  final Color? borderColor;
  final double borderRadius;
  final double dashWidth;
  final double dashSpace;
  final double borderWidth;
  final Color? backgroundColor;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final double? height;
  final double? width;

  const DesignBorderContainer({
    required this.child,
    super.key,
    this.borderColor,
    this.borderRadius = 50.0,
    this.dashWidth = 5.0,
    this.dashSpace = 3.0,
    this.borderWidth = 3,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(12),
    this.onTap,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = borderColor ?? Theme.of(context).primaryColor;

    return CustomPaint(
      painter: _DesignBorderPainter(
        color: themeColor,
        borderRadius: borderRadius,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
        borderWidth: borderWidth,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor ?? AppTheme.getColor(context).onPrimary,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _DesignBorderPainter extends CustomPainter {
  final Color color;
  final double borderRadius;
  final double dashWidth;
  final double dashSpace;
  final double borderWidth;

  _DesignBorderPainter({
    required this.color,
    required this.borderRadius,
    required this.dashWidth,
    required this.dashSpace,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Offset.zero & size,
          Radius.circular(borderRadius),
        ),
      );

    final metrics = path.computeMetrics();
    for (final metric in metrics) {
      double distance = 0;
      while (distance < metric.length) {
        canvas.drawPath(
          metric.extractPath(distance, distance + dashWidth),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
