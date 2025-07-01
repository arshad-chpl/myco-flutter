import 'package:flutter/material.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';



class CustomShadowContainer extends StatelessWidget {
  final Widget image;
  final String title;
  final TextStyle? titleStyle;
  final double? height;
  final double? width;
  final double? containerHeight;
  final double? borderRadius;

  const CustomShadowContainer({
    required this.image,
    required this.title,
    super.key,
    this.titleStyle,
    this.height,
    this.width,
    this.borderRadius,
    this.containerHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 70,
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: width ?? 70,
                height: containerHeight ?? 70,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius ?? 20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(2.5, 2),
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Center(child: image),
              ),
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius ?? 20),
                  child: CustomPaint(
                    painter: InnerShadowPainter(
                      shadowColor: const Color.fromARGB(50, 0, 0, 0),
                      blur: 4,
                      offset: const Offset(3, -3.5),
                      borderRadius: 20,
                      isShadowBottomRight: true,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius ?? 20),
                  child: CustomPaint(
                    painter: InnerShadowPainter(
                      shadowColor: const Color.fromARGB(50, 0, 0, 0),
                      blur: 4,
                      offset: const Offset(3, -3.5),
                      borderRadius: 20,
                      isShadowBottomLeft: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style:
                titleStyle ??
                const TextStyle(fontSize: 11, fontFamily: 'Gilroy-semiBold'),
          ),
        ],
      ),
    );
  }
}
