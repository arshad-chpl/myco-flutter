import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CustomShadowContainer extends StatelessWidget {
  final Widget image;
  final String? title;
  final TextStyle? titleStyle;
  final FontWeight? titleWeight;
  final Color? titleColor;
  final double? height,
      width,
      boxPadding,
      titleFontSize,
      borderRadius,
      imageTitleBetweenSpace;

  const CustomShadowContainer({
    required this.image,
    this.title,
    super.key,
    this.titleStyle,
    this.height,
    this.width,
    this.borderRadius,
    this.titleFontSize,
    this.titleColor,
    this.imageTitleBetweenSpace,
    this.titleWeight,
    this.boxPadding,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
      width: width ?? 70,
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(boxPadding ?? 15),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(
                      borderRadius ?? 20 * Responsive.getResponsive(context),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(2, 1.5),
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Center(child: image),
                ),
              ),
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? 20 * Responsive.getResponsive(context),
                  ),
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
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? 20 * Responsive.getResponsive(context),
                  ),
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
          CustomText(
            title,
            fontSize: 11 * Responsive.getResponsive(context),
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
}
