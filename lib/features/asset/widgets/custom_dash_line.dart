import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;
  final Axis axis;

  const DashedLine({
    super.key,
    this.width = double.infinity,
    this.height = 1,
    this.color = Colors.black,
    this.strokeWidth = 1,
    this.dashLength = 5,
    this.gapLength = 3,
    this.axis = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: axis == Axis.horizontal ? Size(width, height) : Size(width, height),
      painter: DashedLinePainter(
        color: color,
        strokeWidth: strokeWidth,
        dashLength: dashLength,
        gapLength: gapLength,
        axis: axis,
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;
  final Axis axis;

  DashedLinePainter({
    required this.color,
    required this.strokeWidth,
    this.dashLength = 5,
    this.gapLength = 3,
    this.axis = Axis.horizontal,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth;

    double start = 0;
    final isHorizontal = axis == Axis.horizontal;
    final totalLength = isHorizontal ? size.width : size.height;

    while (start < totalLength) {
      final end = start + dashLength;
      if (isHorizontal) {
        canvas.drawLine(
          Offset(start, size.height / 2),
          Offset(end < size.width ? end : size.width, size.height / 2),
          paint,
        );
      } else {
        canvas.drawLine(
          Offset(size.width / 2, start),
          Offset(size.width / 2, end < size.height ? end : size.height),
          paint,
        );
      }
      start += dashLength + gapLength;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
