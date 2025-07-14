import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CustomLabelGifs extends StatelessWidget {
  final String title;
  final String gifAssetPath;

  // Container Properties
  final double? heightFactor;
  final double? widthFactor;
  final double? paddingFactor;
  final Color? backgroundColor;
  final double? borderRadiusFactor;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;

  // ClipRRect Properties
  final double? clipBorderRadiusFactor;
  final double? gifHeightFactor;

  const CustomLabelGifs({
    super.key,
    required this.title,
    required this.gifAssetPath,
    this.heightFactor,
    this.widthFactor,
    this.paddingFactor,
    this.backgroundColor,
    this.borderRadiusFactor ,
    this.boxShadow,
    this.border,
    this.clipBorderRadiusFactor,
    this.gifHeightFactor ,
  });

  @override
  Widget build(BuildContext context) {
    final double borderRadiusValue =
        borderRadiusFactor ?? 10 * Responsive.getResponsive(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: paddingFactor ?? 14 * Responsive.getResponsive(context),
      ),
      height: heightFactor ?? 0.05 * Responsive.getHeight(context),
      width: widthFactor ?? 0.95 * Responsive.getWidth(context),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppTheme.getColor(context).secondary,
        borderRadius: BorderRadius.circular(borderRadiusValue),
        boxShadow: boxShadow,
        border: border,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            title,
            color: AppTheme.getColor(context).onPrimary,
            fontSize: 17 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.bold,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(
              clipBorderRadiusFactor ?? 10 *
                  Responsive.getResponsive(context),
            ),
            child: Image.asset(
              gifAssetPath,
              height:
              gifHeightFactor ?? 0.035 * Responsive.getHeight(context),
            ),
          ),
        ],
      ),
    );
  }
}