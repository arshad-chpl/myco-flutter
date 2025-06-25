import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';

class ColorRange {
  final double startMinutes;
  final double endMinutes;
  final Color color;

  ColorRange(this.startMinutes, this.endMinutes, this.color);
}

class CustomTimer extends StatefulWidget {
  final double maxMinutes;
  final double minutesPerSegment;
  final double strokeWidth;
  final double sectionGap;
  final Color backgroundColor;
  final List<Color> primaryColor;
  final List<ColorRange> colorRanges;
  final VoidCallback? onCompleted;

  const CustomTimer({
    Key? key,
    this.maxMinutes = 10,
    this.minutesPerSegment = 2,
    this.strokeWidth = 20,
    this.sectionGap = 2,
    this.backgroundColor = Colors.grey,
    this.primaryColor = const [Colors.teal],
    this.colorRanges = const [],
    this.onCompleted,
  }) : super(key: key);

  @override
  State<CustomTimer> createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  late Timer _timer;
  double currentMinutes = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentMinutes += 1 / 60.0;
        if (currentMinutes >= widget.maxMinutes) {
          currentMinutes = widget.maxMinutes;
          _timer.cancel();
          widget.onCompleted?.call();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalSeconds = (currentMinutes * 60).toInt();
    final displayHours = (totalSeconds ~/ 3600).toString().padLeft(2, '0');
    final displayMinutes = ((totalSeconds % 3600) ~/ 60).toString().padLeft(
      2,
      '0',
    );
    final displaySeconds = (totalSeconds % 60).toString().padLeft(2, '0');
    final timeText = "$displayHours:$displayMinutes:$displaySeconds";

    return SizedBox(
      width: 250,
      height: 250,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Main Background Shadow Circle
          Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Color(0xFF2FBBA4), blurRadius: 25)],
            ),
          ),
          // Inner White Circle Shadow
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                // BoxShadow(color: Color(0xFF2FBBA4)),
                BoxShadow(
                  color: AppColors.white,
                  spreadRadius: 14,
                  blurRadius: 15,
                ),
              ],
            ),
            alignment: Alignment.center,
          ),

          // Custom Timer Circle
          SizedBox(
            height: 200,
            width: 200,
            child: CustomPaint(
              painter: _CustomTimerPainter(
                maxMinutes: widget.maxMinutes,
                currentMinutes: currentMinutes,
                minutesPerSegment: widget.minutesPerSegment,
                strokeWidth: widget.strokeWidth,
                sectionGap: widget.sectionGap,
                backgroundColor: widget.backgroundColor,
                primaryColor: widget.primaryColor,
                colorRanges: widget.colorRanges,
              ),
              foregroundPainter: InnerShadowPainter(
                strokeWidth: 5,
                // blurRadius: 10,
                shadowColor: Colors.black26,
              ),
            ),
          ),

          // Timer Text
          Text(
            timeText,
            style: const TextStyle(
              fontFamily: "Gilroy-Medium",
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomTimerPainter extends CustomPainter {
  final double maxMinutes;
  final double currentMinutes;
  final double minutesPerSegment;
  final double strokeWidth;
  final double sectionGap;
  final Color backgroundColor;
  final List<Color> primaryColor;
  final List<ColorRange> colorRanges;

  _CustomTimerPainter({
    required this.maxMinutes,
    required this.currentMinutes,
    required this.minutesPerSegment,
    required this.strokeWidth,
    required this.sectionGap,
    required this.backgroundColor,
    required this.primaryColor,
    required this.colorRanges,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (min(size.width, size.height) / 2) - strokeWidth / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final totalSegments = (maxMinutes / minutesPerSegment).ceil();
    final totalGapAngle = totalSegments * sectionGap;
    final totalAvailableAngle = 360.0 - totalGapAngle;
    final anglePerMinute = totalAvailableAngle / maxMinutes;

    final backgroundPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = backgroundColor;

    final colorPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    double globalStartAngle = -90;

    for (int i = 0; i < totalSegments; i++) {
      final segmentStartMinutes = i * minutesPerSegment;
      final segmentDuration = min(
        minutesPerSegment,
        maxMinutes - segmentStartMinutes,
      );
      final segmentAngle = segmentDuration * anglePerMinute;

      canvas.drawArc(
        rect,
        _degToRad(globalStartAngle),
        _degToRad(segmentAngle),
        false,
        backgroundPaint,
      );

      double localStartAngle = globalStartAngle;
      double m = segmentStartMinutes;

      while (m < segmentStartMinutes + segmentDuration) {
        if (m >= currentMinutes) break;

        final progress = min(1.0, currentMinutes - m);
        final sweepAngle = anglePerMinute * progress;

        final customColor = _findColorForMinute(m);
        if (customColor != null) {
          colorPaint.shader = null;
          colorPaint.color = customColor;
        } else if (primaryColor.length > 1) {
          colorPaint.shader = SweepGradient(
            colors: primaryColor,
            startAngle: 0.0,
            endAngle: 2 * pi,
            transform: GradientRotation(-pi / 2),
          ).createShader(rect);
        } else {
          colorPaint.shader = null;
          colorPaint.color = primaryColor.first;
        }

        canvas.drawArc(
          rect,
          _degToRad(localStartAngle),
          _degToRad(sweepAngle),
          false,
          colorPaint,
        );

        localStartAngle += sweepAngle;
        m += progress;
      }

      globalStartAngle += segmentAngle + sectionGap;
    }
  }

  Color? _findColorForMinute(double minute) {
    for (var range in colorRanges) {
      if (minute >= range.startMinutes && minute < range.endMinutes) {
        return range.color;
      }
    }
    return null;
  }

  double _degToRad(double degrees) => degrees * pi / 180;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class InnerShadowPainter extends CustomPainter {
  final double strokeWidth;
  final double blurRadius;
  final Color shadowColor;

  InnerShadowPainter({
    required this.strokeWidth,
    this.blurRadius = 10.0,
    this.shadowColor = Colors.black12,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final outerRadius = (min(size.width, size.height) / 2);
    final innerRadius = outerRadius - strokeWidth;
    final center = size.center(Offset.zero);

    final outerPath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: outerRadius));
    final innerPath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: innerRadius));
    final ringPath = Path.combine(
      PathOperation.difference,
      outerPath,
      innerPath,
    );

    canvas.saveLayer(Offset.zero & size, Paint());

    canvas.drawPath(
      ringPath,
      Paint()
        ..color = shadowColor
        ..maskFilter = MaskFilter.blur(BlurStyle.inner, blurRadius),
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
