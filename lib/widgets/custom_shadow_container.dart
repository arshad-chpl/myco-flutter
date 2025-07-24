import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CustomShadowContainer extends StatelessWidget {
  final Widget image;
  final String? title;
  final TextStyle? titleStyle;
  final TextAlign? titleAlign;
  final FontWeight? titleWeight;
  final Color? titleColor, boxColor;
  final double? height,
      boxTextBetweenSpace,
      width,
      boxPadding,
      imagePadding,
      imgTitleSpacing,
      titleFontSize,
      borderRadius;

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
    this.titleWeight,
    this.boxPadding,
    this.titleAlign,
    this.boxColor,
    this.boxTextBetweenSpace,
    this.imagePadding,
    this.imgTitleSpacing,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
    width: width ?? 0.02 * Responsive.getWidth(context),
    height: height,
    child: Column(
      mainAxisAlignment: imgTitleSpacing != null
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      spacing: imgTitleSpacing ?? 0,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: boxPadding ?? 14,
            right: boxPadding ?? 14,
            left: boxPadding ?? 14,
          ),
          child: Stack(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(imagePadding ?? 15),
                  decoration: BoxDecoration(
                    color: boxColor ?? AppTheme.getColor(context).onPrimary,
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
        ),

        CustomText(
          title ?? '',
          textAlign: TextAlign.center,
          fontSize: 14 * Responsive.getDashboardResponsiveText(context),
          fontWeight: FontWeight.w600,
        ),
      ],
    ),
  );
}
