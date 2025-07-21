import 'dart:async';
import 'package:flutter/material.dart';

class HorizontalColorfulProgressBar extends StatefulWidget {
  final double height;
  final int totalSeconds;
  final List<(int start, int end, Color color)> colorRanges;
  final Color defaultColor;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;

  const HorizontalColorfulProgressBar({
    required this.height,
    required this.totalSeconds,
    required this.colorRanges,
    super.key,
    this.defaultColor = Colors.grey,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  State<HorizontalColorfulProgressBar> createState() => _HorizontalColorfulProgressBarState();
}

class _HorizontalColorfulProgressBarState extends State<HorizontalColorfulProgressBar> {
  late Timer _timer;
  int _elapsedSeconds = 0;

  @override
  void initState() {
    super.initState();
    _startProgress();
  }

  void _startProgress() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_elapsedSeconds >= widget.totalSeconds) {
        timer.cancel();
      } else {
        setState(() {
          _elapsedSeconds++;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Color _getColorForSecond(int second) {
    for (final (start, end, color) in widget.colorRanges) {
      if (second >= start && second <= end) {
        return color;
      }
    }
    return widget.defaultColor;
  }

  // @override
  // Widget build(BuildContext context) {
  //   return LayoutBuilder(
  //     builder: (context, constraints) {
  //       final double segmentWidth = constraints.maxWidth / widget.totalSeconds;

  //       return SizedBox(
  //         height: widget.height,
  //         child: ClipRRect(
  //           borderRadius: widget.borderRadius ?? BorderRadius.zero,
  //           child: Row(
  //             children: List.generate(widget.totalSeconds, (i) {
  //               final Color color =
  //                   i < _elapsedSeconds
  //                       ? _getColorForSecond(i)
  //                       : widget.backgroundColor ??
  //                           widget.defaultColor.withAlpha(20);

  //               return Container(
  //                 width: segmentWidth,
  //                 height: widget.height,
  //                 color: color,
  //               );
  //             }),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double segmentWidth = constraints.maxWidth / widget.totalSeconds;

        return SizedBox(
          height: widget.height,
          child: Stack(
            children: [
              // Base colorful progress bar
              ClipRRect(
                borderRadius: widget.borderRadius ?? BorderRadius.zero,
                child: Row(
                  children: List.generate(widget.totalSeconds, (i) {
                    final Color color =
                        i < _elapsedSeconds
                            ? _getColorForSecond(i)
                            : widget.backgroundColor ??
                                widget.defaultColor.withAlpha(20);

                    return Container(
                      width: segmentWidth,
                      height: widget.height,
                      color: color,
                    );
                  }),
                ),
              ),

              // Inner shadow overlay
              IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: widget.borderRadius ?? BorderRadius.zero,
                    gradient: const LinearGradient(
                      colors: [
                        Colors.white10,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.white10,
                      ],
                      stops: [0.0, 0.1, 0.95, 1.0],
                    ),
                  ),
                ),
              ),
              IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: widget.borderRadius ?? BorderRadius.zero,
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white30, Colors.transparent],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
