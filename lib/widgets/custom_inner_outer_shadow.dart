import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomInnerOuterShadow extends SingleChildRenderObjectWidget {
  const CustomInnerOuterShadow({
    super.key,
    this.innerShadows = const <Shadow>[],
    this.outerShadows = const <BoxShadow>[],
    super.child,
  });

  final List<Shadow> innerShadows;
  final List<BoxShadow> outerShadows;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final renderObject = _RenderInnerShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(
    BuildContext context,
    // ignore: library_private_types_in_public_api
    _RenderInnerShadow renderObject,
  ) {
    renderObject
      ..shadows = innerShadows
      ..outerShadows = outerShadows;
  }
}

class _RenderInnerShadow extends RenderProxyBox {
  late List<Shadow> shadows;
  List<BoxShadow> outerShadows = [];

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;
    final bounds = offset & size;

    // Draw drop (outer) shadow if any
    if (outerShadows.isNotEmpty) {
      for (final shadow in outerShadows) {
        final Paint paint = Paint()
          ..color = shadow.color
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadow.blurRadius);

        final RRect rrect = RRect.fromRectAndCorners(
          bounds,
          topLeft: Radius.circular(0), // adjust if needed
          topRight: const Radius.circular(12), // match your container
          bottomLeft: const Radius.circular(16),
          bottomRight: Radius.circular(0),
        );

        context.canvas.save();
        context.canvas.translate(shadow.offset.dx, shadow.offset.dy);
        context.canvas.drawRRect(rrect, paint);
        context.canvas.restore();
      }
    }

    // Draw base content and inner shadows
    context.canvas.saveLayer(bounds, Paint());
    context.paintChild(child!, offset);

    for (final shadow in shadows) {
      final shadowRect = bounds.inflate(shadow.blurSigma);
      final shadowPaint = Paint()
        ..blendMode = BlendMode.srcATop
        ..colorFilter = ColorFilter.mode(shadow.color, BlendMode.srcOut)
        ..imageFilter = ImageFilter.blur(
          sigmaX: shadow.blurSigma,
          sigmaY: shadow.blurSigma,
        );
      context.canvas
        ..saveLayer(shadowRect, shadowPaint)
        ..translate(shadow.offset.dx, shadow.offset.dy);
      context.paintChild(child!, offset);
      context.canvas.restore();
    }

    context.canvas.restore();
  }
}
