import 'dart:ui';

import 'package:flutter/material.dart';

class DottedLineWidget extends StatelessWidget {
  final double height;
  final Color color;
  final double topPadding;
  final double bottomPadding;

  const DottedLineWidget({
    this.height = 1,
    this.color = Colors.black54,
    this.topPadding = 12.0,
    this.bottomPadding = 15.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final boxWidth = constraints.constrainWidth();
      const dashWidth = 8.0;
      const dashSpace = 3.0;
      final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();
      return Padding(
        padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            dashCount,
            (_) => SizedBox(
              width: dashWidth,
              height: height,
              child: DecoratedBox(decoration: BoxDecoration(color: color)),
            ),
          ),
        ),
      );
    },
  );
}
