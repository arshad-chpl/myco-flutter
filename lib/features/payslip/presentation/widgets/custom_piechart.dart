import 'dart:math';
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class LineChartSegment {
  final String label;
  final double value;
  final Color color;
  final bool? showShadow;

  LineChartSegment({
    required this.label,
    required this.value,
    required this.color,
    this.showShadow = true,
  });

  // Override == and hashCode for proper comparison of LineChartSegment objects
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LineChartSegment &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          value == other.value &&
          color == other.color;

  @override
  int get hashCode => label.hashCode ^ value.hashCode ^ color.hashCode;
}

class CustomLinePieChart extends StatefulWidget {
  final List<LineChartSegment> segments;
  final double? width;
  final double? height;
  final double totalLeaves;
  final double totalPaidLeave;
  final double? segmentWidth;
  final double? innerRadius;
  final bool? isValueOnChart;
  final String? dynamicCenterText;
  final Color? onChartTextColor;
  const CustomLinePieChart({
    required this.segments,
    required this.totalLeaves,
    required this.totalPaidLeave,
    this.segmentWidth,
    this.innerRadius,
    super.key,
    this.isValueOnChart,
    this.width,
    this.height,
    this.dynamicCenterText,
    this.onChartTextColor,
  });

  @override
  State<CustomLinePieChart> createState() => _CustomLinePieChartState();
}

class _CustomLinePieChartState extends State<CustomLinePieChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> curvedAnimation;
  late Animation<double> pieAnimation;

  // Added state variable to track the currently lifted segment
  LineChartSegment? _currentlyLiftedSegment;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2800), // total 3s
      vsync: this,
    );

    curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeInOut), // for scale
    );

    pieAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeInOut), // for painter
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Helper function to detect which segment was tapped
  // This needs to be able to access the painter's innerRadius and segmentWidth
  LineChartSegment? _hitTestSegment(Offset tapPosition, Size chartSize) {
    final center = chartSize.center(Offset.zero);
    double startAngle = -pi / 2;

    // Use the same radius values as the painter
    const double painterInnerRadius = 85; // From DonutChartPainter in build
    const double painterSegmentWidth = 35; // From DonutChartPainter in build

    final tapVector = tapPosition - center;
    double tapAngle = atan2(tapVector.dy, tapVector.dx);
    final tapRadius = tapVector.distance;

    // Normalize tapAngle to be within -pi/2 to 3*pi/2 for consistent comparison
    // This handles the wrap-around from -pi to pi for atan2
    if (tapAngle < -pi / 2) {
      tapAngle += 2 * pi;
    }

    for (var segment in widget.segments) {
      final sweepAngle = 2 * pi / 6;
      final endAngle = startAngle + sweepAngle;

      // Adjust startAngle and endAngle if they cross the -pi/2 (top) line
      // This is crucial for accurate hit testing across the chart's top
      final double adjustedStartAngle = startAngle;
      final double adjustedEndAngle = endAngle;

      if (adjustedStartAngle < -pi / 2 && adjustedEndAngle > -pi / 2) {}

      if (tapAngle >= startAngle &&
          tapAngle < endAngle &&
          tapRadius >= (painterInnerRadius - painterSegmentWidth / 2) &&
          tapRadius <= (painterInnerRadius + painterSegmentWidth / 2)) {
        return segment;
      }
      startAngle = endAngle;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    width: widget.width ?? double.infinity,
    height: widget.height ?? 400,
    child: AnimatedBuilder(
      animation: curvedAnimation,
      // ignore: prefer_expression_function_bodies
      builder: (context, _) {
        // We use a Builder here to get the actual size of the CustomPaint
        // for accurate hit testing.
        return LayoutBuilder(
          builder: (context, constraints) {
            final chartSize = Size(constraints.maxWidth, constraints.maxHeight);
            return GestureDetector(
              onTapUp: (details) {
                final RenderBox renderBox =
                    context.findRenderObject() as RenderBox;
                final localPosition = renderBox.globalToLocal(
                  details.globalPosition,
                );
                final tappedSegment = _hitTestSegment(localPosition, chartSize);

                setState(() {
                  // Toggle the lifted segment
                  if (_currentlyLiftedSegment == tappedSegment) {
                    _currentlyLiftedSegment = null; // Unlift if tapped again
                  } else {
                    _currentlyLiftedSegment =
                        tappedSegment; // Lift the new segment
                  }
                });
              },
              child: Transform.scale(
                scale: curvedAnimation.value,
                child: CustomPaint(
                  painter: DonutChartPainter(
                    context: context,
                    segments: widget.segments,
                    segmentWidth: widget.segmentWidth ?? 35,
                    innerRadius: widget.innerRadius ?? 85,
                    animationValue: pieAnimation.value,
                    dynamicCenterText: widget.dynamicCenterText,
                    totalLeaves: 12.0,
                    totalPaidLeave: 4.0,
                    isValueOnChart: widget.isValueOnChart ?? false,
                    onChartTextColor: widget.onChartTextColor,
                    liftedSegment:
                        _currentlyLiftedSegment, // Pass the lifted segment
                  ),
                ),
              ),
            );
          },
        );
      },
    ),
  );
}

class DonutChartPainter extends CustomPainter {
  final List<LineChartSegment> segments;
  final double segmentWidth;
  final double innerRadius;
  final double totalLeaves;
  final double totalPaidLeave;
  final double connectorLength;
  final double animationValue;
  final LineChartSegment? liftedSegment;
  final bool? isValueOnChart;
  final String? dynamicCenterText;
  final BuildContext context;
  final Color? onChartTextColor;

  DonutChartPainter({
    required this.context,
    required this.totalLeaves,
    required this.totalPaidLeave,
    required this.segments,
    required this.animationValue,
    this.onChartTextColor,
    this.isValueOnChart,
    this.segmentWidth = 30,
    this.innerRadius = 80,
    this.connectorLength = 25,
    this.liftedSegment,
    required this.dynamicCenterText,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    double startAngle = -pi / 2;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = segmentWidth;

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    final leftLabels = <(LineChartSegment, Offset, double)>[];
    final rightLabels = <(LineChartSegment, Offset, double)>[];

    for (var segment in segments) {
      final sweepAngle = 2 * pi / 6;

      final currentRadius = innerRadius;

      Color darken(Color color, [double amount = 0.1]) {
        assert(amount >= 0 && amount <= 1);
        final hsl = HSLColor.fromColor(color);
        final hslDark = hsl.withLightness(
          (hsl.lightness - amount).clamp(0.0, 1.0),
        );
        return hslDark.toColor();
      }

      final midAngle = startAngle + sweepAngle / 2;
      final isRightSide = midAngle < pi / 2 || midAngle > 3 * pi / 2;

      // --- Start of new conditional logic for gradient/solid color ---
      if (segment.showShadow == true) {
        final List<Color> gradientColors;
        final List<double> gradientStops;

        if (isRightSide) {
          gradientColors = [segment.color, darken(segment.color, 0.15)];
          gradientStops = const [0.94, 1.0];
        } else {
          gradientColors = [darken(segment.color, 0.15), segment.color];
          gradientStops = const [0.0, 0.06];
        }

        final gradient = SweepGradient(
          endAngle: sweepAngle,
          colors: gradientColors,
          stops: gradientStops,
        );
        paint.shader = gradient.createShader(
          Rect.fromCircle(center: center, radius: currentRadius),
        );
      } else {
        // If isShowGradient is false, use a solid color
        paint.color = segment.color;
        paint.shader = null;
      }
      // --- End of new conditional logic ---

      paint.strokeWidth = (segment == liftedSegment)
          ? segmentWidth + 15
          : segmentWidth;

      // Canvas transformations to align gradient
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(startAngle);
      canvas.translate(-center.dx, -center.dy);

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: currentRadius),
        0.0,
        sweepAngle,
        false,
        paint,
      );
      canvas.restore();

      // final midAngle = startAngle + sweepAngle / 2;
      final dx = cos(midAngle) * (currentRadius + segmentWidth / 2);
      final dy = sin(midAngle) * (currentRadius + segmentWidth / 2);
      final pointOnArc = Offset(center.dx + dx, center.dy + dy);

      if (isValueOnChart == true) {
        final valueTextPainter = TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          text: TextSpan(
            text: segment.value.toStringAsFixed(0),
            style: TextStyle(
              fontFamily: 'Gilroy-semiBold',
              fontSize: 12 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.bold,
              color: onChartTextColor ?? Colors.white,
            ),
          ),
        );

        valueTextPainter.layout();
        final labelRadius = innerRadius + segmentWidth * .05;
        final labelOffset = Offset(
          center.dx + cos(midAngle) * labelRadius,
          center.dy + sin(midAngle) * labelRadius,
        );
        valueTextPainter.paint(
          canvas,
          labelOffset -
              Offset(valueTextPainter.width / 2, valueTextPainter.height / 2),
        );
      }

      // final isRightSide = midAngle < pi / 2 || midAngle > 3 * pi / 2;

      if (isRightSide) {
        rightLabels.add((segment, pointOnArc, midAngle));
      } else {
        leftLabels.add((segment, pointOnArc, midAngle));
      }

      startAngle += 2 * pi / 6;
    }

    Color darken(Color color, [double amount = 0.1]) {
      assert(amount >= 0 && amount <= 1);
      final hsl = HSLColor.fromColor(color);
      final hslDark = hsl.withLightness(
        (hsl.lightness - amount).clamp(0.0, 1.0),
      );
      return hslDark.toColor();
    }

    final double miniRadius = innerRadius - segmentWidth / 2.1;
    double miniStartAngle = -pi / 2;
    final miniPaint = Paint()..style = PaintingStyle.fill;

    for (var segment in segments) {
      final sweepAngle = 2 * pi / 6;
      miniPaint.color = darken(segment.color, 0.15);

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: miniRadius),
        miniStartAngle,
        sweepAngle,
        true,
        miniPaint,
      );
      miniStartAngle += sweepAngle;
    }

    final double innerCircleRadius = miniRadius * 0.89;
    final double circleRadius = miniRadius * 0.9;
    final Offset innerCircleCenter = Offset(center.dx, center.dy + 5);

    final Paint innerCirclePaint = Paint()..color = Colors.white;
    canvas.drawCircle(innerCircleCenter, innerCircleRadius, innerCirclePaint);

    final Paint borderPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    canvas.drawCircle(innerCircleCenter, circleRadius, borderPaint);

    final String centerText =
        dynamicCenterText ??
        'Total Leave\n$totalLeaves\nTotal Paid Leave\n$totalPaidLeave';

    final TextPainter centerTextPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: centerText,
        style: TextStyle(
          fontSize: 12 * Responsive.getDashboardResponsiveText(context),
          fontFamily: 'Gilroy-semiBold',
          color: Colors.black,
          height: 1.5,
        ),
      ),
    );
    centerTextPainter.layout();
    final Offset textOffset = Offset(
      center.dx - centerTextPainter.width / 2,
      center.dy - centerTextPainter.height / 2.5,
    );
    centerTextPainter.paint(canvas, textOffset);

    List<double> generateYPositions(int count, double height) {
      if (count == 1) return [height / 2];
      if (count == 2) return [height * 0.3, height * 0.7];
      if (count == 3) return [height * 0.2, height * 0.5, height * 0.8];
      final spacing = (height - 100) / (count - 1);
      return List.generate(count, (i) => 50 + spacing * i);
    }

    void drawFixedLabelBoxes(
      List<(LineChartSegment, Offset, double)> entries,
      bool isRight,
    ) {
      final ySlots = generateYPositions(entries.length, size.height);

      for (int i = 0; i < entries.length && i < ySlots.length; i++) {
        final (segment, pointOnArc, midAngle) = entries[i];
        final y = ySlots[i];

        final labelText = isValueOnChart == true
            ? segment.label
            : '${segment.label}\n${segment.value.toString().padLeft(2, '0')}';

        final labelStyle = TextStyle(
          color: Colors.black.withAlpha((255 * animationValue).toInt()),
          fontSize: 14,
          fontFamily: 'Gilroy-semiBold',
          height: 1.4,
        );

        textPainter.text = TextSpan(text: labelText, style: labelStyle);
        textPainter.layout();

        final boxWidth = 75.0;
        final boxHeight = 50.0;
        final fixedOffset = Offset(isRight ? size.width - 10 : 10, y);

        final boxX = isRight ? fixedOffset.dx - boxWidth + 10 : 0.0;
        final boxY = fixedOffset.dy - boxHeight / 2;
        final labelRect = Rect.fromLTWH(boxX, boxY, boxWidth, boxHeight);

        Offset textPaintOffset;
        if (isRight) {
          textPaintOffset = Offset(
            fixedOffset.dx + 8,
            y - textPainter.height / 2,
          );
        } else {
          textPaintOffset = Offset(
            fixedOffset.dx - textPainter.width - 8,
            y - textPainter.height / 2,
          );
        }

        textPaintOffset = Offset(
          textPaintOffset.dx.clamp(0.0, size.width - textPainter.width),
          textPaintOffset.dy.clamp(0.0, size.height - textPainter.height),
        );

        Offset
        targetLabelConnectPoint; // Where the line *should* end horizontally
        if (isValueOnChart != true) {
          targetLabelConnectPoint = Offset(
            isRight ? labelRect.left : labelRect.right,
            labelRect.center.dy,
          );
        } else {
          // This is the point where the horizontal line will *begin* to draw the underline
          // It's the start (for right labels) or end (for left labels) of the text's X coordinate,
          // and the Y coordinate where the underline will be drawn.
          targetLabelConnectPoint = Offset(
            isRight
                ? textPaintOffset.dx
                : textPaintOffset.dx + textPainter.width,
            textPaintOffset.dy +
                textPainter.height +
                2, // 2 units below the text for underline
          );
        }

        final elbowPointX = isRight
            ? pointOnArc.dx + connectorLength
            : pointOnArc.dx - connectorLength;
        final elbowPoint = Offset(elbowPointX, targetLabelConnectPoint.dy);

        // --- Draw Label Box / Text ---
        if (isValueOnChart != true) {
          final rRect = RRect.fromRectAndRadius(
            labelRect,
            const Radius.circular(8),
          );

          final paintBox = Paint()
            ..color = segment.color.withAlpha((40 * animationValue).toInt());
          canvas.drawRRect(rRect, paintBox);

          final textOffset = Offset(
            boxX + (boxWidth - textPainter.width) / 2,
            boxY + (boxHeight - textPainter.height) / 2,
          );
          textPainter.paint(canvas, textOffset);
        } else {
          textPainter.paint(canvas, textPaintOffset);
        }

        // --- Draw Connector Lines ---
        final linePaint = Paint()
          ..color = segment.color
          ..strokeWidth = 2;

        // Animate the diagonal line segment (from arc point to elbowPoint)
        if (animationValue <= 0.5) {
          final progress = animationValue / 0.5;
          final animatedElbowPoint = Offset.lerp(
            pointOnArc,
            elbowPoint,
            progress,
          )!;
          canvas.drawLine(pointOnArc, animatedElbowPoint, linePaint);
        } else {
          // Draw the full diagonal line once animationValue is past 0.5
          canvas.drawLine(pointOnArc, elbowPoint, linePaint);

          // Animate the horizontal line segment
          final horizontalProgress =
              (animationValue - 0.5) /
              0.5; // normalize to 0.0 → 1.0 for second half

          if (isValueOnChart == true) {
            // Underline animation: starts from targetLabelConnectPoint and extends across text width
            final underlineStart = targetLabelConnectPoint;
            final underlineEnd = Offset(
              isRight
                  ? textPaintOffset.dx + textPainter.width
                  : textPaintOffset.dx,
              targetLabelConnectPoint.dy,
            );

            // The 'horizontal line' from elbowPoint to the start of the underline
            final intermediateConnectionPoint = Offset(
              isRight
                  ? textPaintOffset.dx
                  : textPaintOffset.dx + textPainter.width,
              elbowPoint.dy,
            );

            // Animate the connection to the underline starting point
            final animatedConnectionPoint = Offset.lerp(
              elbowPoint,
              intermediateConnectionPoint,
              horizontalProgress,
            )!;
            canvas.drawLine(elbowPoint, animatedConnectionPoint, linePaint);

            // Animate the underline itself, once the connection point is reached
            if (horizontalProgress == 1.0) {
              // If the connection to the text is fully drawn
              final animatedUnderlineEnd = Offset.lerp(
                underlineStart,
                underlineEnd,
                horizontalProgress,
              )!; // Use horizontalProgress for underline too
              canvas.drawLine(underlineStart, animatedUnderlineEnd, linePaint);
            } else {
              // If the connection is still animating, draw only the portion of the underline that the line has reached
              final currentUnderlineX = isRight
                  ? underlineStart.dx +
                        (underlineEnd.dx - underlineStart.dx) *
                            horizontalProgress
                  : underlineStart.dx -
                        (underlineStart.dx - underlineEnd.dx) *
                            horizontalProgress;
              final animatedUnderlineEndpoint = Offset(
                currentUnderlineX,
                underlineStart.dy,
              );

              if (isRight) {
                if (animatedConnectionPoint.dx >= underlineStart.dx) {
                  // Only draw underline if line reached its start
                  canvas.drawLine(
                    underlineStart,
                    animatedUnderlineEndpoint,
                    linePaint,
                  );
                }
              } else {
                if (animatedConnectionPoint.dx <= underlineStart.dx) {
                  // Only draw underline if line reached its start
                  canvas.drawLine(
                    underlineStart,
                    animatedUnderlineEndpoint,
                    linePaint,
                  );
                }
              }
            }
          } else {
            // For box labels: horizontal line from elbow to targetLabelConnectPoint
            final animatedTargetLabelConnectPoint = Offset.lerp(
              elbowPoint,
              targetLabelConnectPoint,
              horizontalProgress,
            )!;
            canvas.drawLine(
              elbowPoint,
              animatedTargetLabelConnectPoint,
              linePaint,
            );
          }
        }
      }
    }

    drawFixedLabelBoxes(leftLabels.reversed.toList(), false);
    drawFixedLabelBoxes(rightLabels, true);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if (oldDelegate is DonutChartPainter) {
      return oldDelegate.segments != segments ||
          oldDelegate.animationValue != animationValue ||
          oldDelegate.segmentWidth != segmentWidth ||
          oldDelegate.innerRadius != innerRadius ||
          oldDelegate.connectorLength != connectorLength ||
          oldDelegate.liftedSegment != liftedSegment;
    }
    return true;
  }
}
