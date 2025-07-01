import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';

class HeaderCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0025000, size.height * 0.0033333);
    path_0.lineTo(0, size.height * 0.2516667);
    path_0.lineTo(size.width * 0.5050000, size.height * 0.3333333);
    path_0.lineTo(size.width * 0.9975000, size.height * 0.2500000);
    path_0.lineTo(size.width * 0.9975000, 0);
    path_0.lineTo(size.width * 0.0025000, size.height * 0.0033333);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
