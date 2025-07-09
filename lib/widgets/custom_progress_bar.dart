import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_inner_shadow.dart';


class CustomSegmentedProgressBar extends StatelessWidget {
  final int totalSegments;
  final int percentComplete;
  final List<Color> gradientColors;
  final double? height;
  final double? width;
  final double spacing;
  final Color? defaultColor;
  final bool? isShadowBottomRight;
  final bool? isShadowBottomLeft;
  final bool? isShadowTopLeft;
  final bool? isShadowTopRight;

  const CustomSegmentedProgressBar({
    super.key,
    required this.totalSegments,
    required this.percentComplete,
    required this.gradientColors,
    this.height = 12,
    this.spacing = 2,
    this.width = double.infinity,
    this.defaultColor,
    this.isShadowBottomRight = true,
    this.isShadowBottomLeft = false,
    this.isShadowTopLeft = false,
    this.isShadowTopRight = false,
  });

  @override
  Widget build(BuildContext context) {
    // if (percentComplete > 100) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(
    //         content: Text("Progress cannot exceed 100%"),
    //         backgroundColor: Colors.red,
    //       ),
    //     );
    //   });
    // }

    final progress = (percentComplete.clamp(0, 100)) / 100.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final segmentWidth =
            (totalWidth - spacing * (totalSegments - 1)) / totalSegments;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(totalSegments, (index) {
                return Container(
                  width: segmentWidth,
                  height: height,
                  decoration: BoxDecoration(
                    color: defaultColor ?? Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(height ?? 12 / 2),
                  ),
                );
              }),
            ),
            ClipRect(
              child: Align(
                alignment: Alignment.centerLeft,
                widthFactor: progress.clamp(0.0, 1.0),
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(colors: gradientColors).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(totalSegments, (index) {
                      return InnerShadowContainer(
                        height: height,
                        width: segmentWidth,
                        borderRadius: (height ?? 12 / 2),
                        // backgroundColor: Colors.grey,
                        isShadowBottomRight: isShadowBottomRight ?? false,
                        isShadowTopLeft: isShadowTopLeft ?? false,
                        isShadowTopRight: isShadowTopRight ?? false,
                        isShadowBottomLeft: isShadowBottomLeft ?? false,
                        alignment: Alignment.center,
                        child: const SizedBox(),
                      );
                    }),
                  ),
                ),
              ),
            ),

            Positioned(
              left: (progress * totalWidth) - 20,
              top: -50,
              child: Column(
                children: [
                  InnerShadowContainer(
                    height: 40,
                    width: 40,
                    backgroundColor: AppColors.primary,
                    borderRadius: 50,
                    isShadowBottomLeft: true,

                    child: Text(
                      "$percentComplete",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // isShadowTopRight: true,
                  ),
                  CustomPaint(
                    size: const Size(10, 8),
                    painter: _BubblePointerPainter(),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _BubblePointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF0F4C75);
    final path = Path()
      ..moveTo(0, -2)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, -2)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}