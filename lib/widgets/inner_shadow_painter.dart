import 'dart:ui';

import 'package:flutter/material.dart';

class InnerShadowPainter extends CustomPainter {
  final Color shadowColor;
  final double blur;
  final Offset offset;
  final double borderRadius;
  final bool isShadowTopLeft;
  final bool isShadowTopRight;
  final bool isShadowBottomRight;
  final bool isShadowBottomLeft;

  InnerShadowPainter({
    required this.shadowColor,
    required this.blur,
    required this.offset,
    required this.borderRadius,
    this.isShadowTopLeft = false,
    this.isShadowTopRight = false,
    this.isShadowBottomRight = false,
    this.isShadowBottomLeft = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = shadowColor
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, blur);

    final Rect rect = Offset.zero & size;
    final RRect rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(borderRadius),
    );
    final Path outer =
        Path()..addRect(
          Rect.fromLTRB(
            -size.width,
            -size.height,
            size.width * 2,
            size.height * 2,
          ),
        );
    final Path inner =
        Path()
          ..addRRect(rrect)
          ..fillType = PathFillType.evenOdd;

    canvas.saveLayer(rect, Paint());

    if (isShadowBottomRight) {
      canvas.save();
      canvas.translate(-offset.dx.abs(), -offset.dy.abs());
      canvas.drawPath(
        Path.combine(PathOperation.difference, outer, inner),
        paint,
      );
      canvas.restore();
    }
    if (isShadowBottomLeft) {
      canvas.save();
      canvas.translate(offset.dx.abs(), -offset.dy.abs());
      canvas.drawPath(
        Path.combine(PathOperation.difference, outer, inner),
        paint,
      );
      canvas.restore();
    }
    if (isShadowTopLeft) {
      canvas.save();
      canvas.translate(offset.dx.abs(), offset.dy.abs());
      canvas.drawPath(
        Path.combine(PathOperation.difference, outer, inner),
        paint,
      );
      canvas.restore();
    }
    if (isShadowTopRight) {
      canvas.save();
      canvas.translate(-offset.dx.abs(), offset.dy.abs());
      canvas.drawPath(
        Path.combine(PathOperation.difference, outer, inner),
        paint,
      );
      canvas.restore();
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}