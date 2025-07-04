import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';

class HorizontalDashedLine extends StatelessWidget {
  final double width;
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double thickness;

  const HorizontalDashedLine({
    Key? key,
    required this.width,
    this.color = Colors.black,
    this.dashWidth = 5,
    this.dashSpace = 3,
    this.thickness = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, thickness),
      painter: _DashedLinePainter(
        color: color,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
        thickness: thickness,
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double thickness;

  _DashedLinePainter({
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
    required this.thickness,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
