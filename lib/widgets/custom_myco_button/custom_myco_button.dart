import 'package:flutter/material.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';

class MyCoButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final BoxDecoration? decoration;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final FontWeight? fontWeight;
  final Widget? image;
  final AxisDirection imagePosition;
  final bool enabled;
  final double? spacing;
  final Border? border;
  final Color? borderColor;
  final double? borderWidth;
  final double? boarderRadius;
  final String? fontFamily;
  final bool wantBorder;
  final bool isShadowTopLeft;
  final bool isShadowTopRight;
  final bool isShadowBottomRight;
  final bool isShadowBottomLeft;

  const MyCoButton({
    super.key,
    required this.onTap,
    required this.title,
    this.decoration,
    this.height,
    this.width,
    this.textStyle,
    this.backgroundColor,
    this.fontWeight,
    this.image,
    this.imagePosition = AxisDirection.left,
    this.enabled = true,
    this.spacing,
    this.border,
    this.borderColor,
    this.borderWidth,
    this.boarderRadius,
    this.fontFamily,
    this.wantBorder = true,
    this.isShadowTopLeft = false,
    this.isShadowTopRight = false,
    this.isShadowBottomRight = false,
    this.isShadowBottomLeft = false,
  });

  @override
  Widget build(BuildContext context) {
    return _MyCoButtonMobile(
      onTap: enabled ? onTap : null,
      title: title,
      height: height ?? 0.06 * getHeight(context),
      width: width,
      backgroundColor: backgroundColor,
      decoration: decoration,
      textStyle: textStyle,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      image: image,
      imagePosition: imagePosition,
      enabled: enabled,
      spacing: spacing,
      border: border,
      borderColor: borderColor,
      borderWidth: borderWidth,
      boarderRadius: boarderRadius,
      wantBorder: wantBorder,
      isShadowTopLeft: isShadowTopLeft,
      isShadowTopRight: isShadowTopRight,
      isShadowBottomRight: isShadowBottomRight,
      isShadowBottomLeft: isShadowBottomLeft,
    );
  }
}

class _MyCoButtonMobile extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final double? height;
  final double? width;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final BoxDecoration? decoration;
  final TextStyle? textStyle;
  final Widget? image;
  final AxisDirection imagePosition;
  final bool enabled;
  final double? spacing;
  final Border? border;
  final Color? borderColor;
  final double? borderWidth;
  final double? boarderRadius;
  final String? fontFamily;
  final bool wantBorder;
  final bool isShadowTopLeft;
  final bool isShadowTopRight;
  final bool isShadowBottomRight;
  final bool isShadowBottomLeft;

  const _MyCoButtonMobile({
    required this.onTap,
    required this.title,
    this.height,
    this.width,
    this.fontWeight,
    this.backgroundColor,
    this.decoration,
    this.textStyle,
    this.image,
    required this.imagePosition,
    required this.enabled,
    this.spacing,
    this.border,
    this.borderColor,
    this.borderWidth,
    this.boarderRadius,
    this.fontFamily,
    this.wantBorder = true,
    this.isShadowTopLeft = false,
    this.isShadowTopRight = false,
    this.isShadowBottomRight = false,
    this.isShadowBottomLeft = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color bgColor = enabled
        ? (backgroundColor ?? MyCoButtonTheme.mobileBackgroundColor)
        : Colors.grey.shade400;

    final TextStyle finalStyle =
        (textStyle ?? MyCoButtonTheme.getMobileTextStyle(context)).copyWith(
          fontFamily: fontFamily,
        );

    final double radius = boarderRadius ?? MyCoButtonTheme.borderRadius;

    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: height ?? 0.04 * getHeight(context),
            width: width ?? 0.94 * getWidth(context),
            decoration:
                decoration ??
                BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(radius),
                  border: wantBorder
                      ? border ??
                            Border.all(
                              color:
                                  borderColor ??
                                  MyCoButtonTheme.defaultBorder.top.color,
                              width:
                                  borderWidth ??
                                  MyCoButtonTheme.defaultBorder.top.width,
                            )
                      : null,
                ),
            child: Center(
              child: _ButtonContent(
                title: title,
                style: finalStyle,
                image: image,
                imagePosition: imagePosition,
                spacing: spacing,
              ),
            ),
          ),
          if (isShadowTopLeft ||
              isShadowTopRight ||
              isShadowBottomRight ||
              isShadowBottomLeft) ...[
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: CustomPaint(
                  painter: InnerShadowPainter(
                    shadowColor: const Color(0x1A2FBBA4),
                    blur: 1.4,
                    offset: const Offset(0, 1),
                    borderRadius: radius,
                    isShadowTopLeft: isShadowTopLeft,
                    isShadowTopRight: isShadowTopRight,
                    isShadowBottomRight: isShadowBottomRight,
                    isShadowBottomLeft: isShadowBottomLeft,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: CustomPaint(
                  painter: InnerShadowPainter(
                    shadowColor: Colors.black38,
                    blur: 4,
                    offset: const Offset(4, -3),
                    borderRadius: radius,
                    isShadowTopLeft: isShadowTopLeft,
                    isShadowTopRight: isShadowTopRight,
                    isShadowBottomRight: isShadowBottomRight,
                    isShadowBottomLeft: isShadowBottomLeft,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  final String title;
  final TextStyle style;
  final Widget? image;
  final AxisDirection imagePosition;
  final double? spacing;

  const _ButtonContent({
    required this.title,
    required this.style,
    this.image,
    required this.imagePosition,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    final imageWidget = image ?? const SizedBox();
    final double gap = spacing ?? 1;

    List<Widget> children;

    if (imagePosition == AxisDirection.left) {
      children = [imageWidget, SizedBox(width: gap), Text(title, style: style)];
    } else if (imagePosition == AxisDirection.right) {
      children = [Text(title, style: style), SizedBox(width: gap), imageWidget];
    } else if (imagePosition == AxisDirection.up) {
      children = [
        imageWidget,
        SizedBox(height: gap),
        Text(title, style: style),
      ];
    } else {
      children = [
        Text(title, style: style),
        SizedBox(height: gap),
        imageWidget,
      ];
    }

    return (imagePosition == AxisDirection.left ||
            imagePosition == AxisDirection.right)
        ? Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          );
  }
}

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
    final Paint paint = Paint()
      ..color = shadowColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blur);

    final Rect rect = Offset.zero & size;
    final RRect rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(borderRadius),
    );
    final Path outer = Path()
      ..addRect(
        Rect.fromLTRB(
          -size.width,
          -size.height,
          size.width * 2,
          size.height * 2,
        ),
      );
    final Path inner = Path()
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
