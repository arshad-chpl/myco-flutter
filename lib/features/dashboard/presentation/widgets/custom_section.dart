import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CustomSection extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? count;
  final Widget? icon;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final bool? isShadow;
  final bool? isBorder;
  final bool? hasViewMoreButton;
  final VoidCallback? onViewMore;
  final TextStyle? titleStyle;
  const CustomSection({
    super.key,
    required this.title,
    this.subtitle,
    this.count,
    this.icon,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.isShadow = false,
    this.isBorder = false,
    this.hasViewMoreButton = false,
    this.onViewMore,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding:
        padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    margin: margin,
    decoration: BoxDecoration(
      color: backgroundColor ?? AppTheme.getColor(context).surface,
      borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
      border: isBorder == true
          ? Border.all(
              color: borderColor ?? AppTheme.getColor(context).outlineVariant,
              width: borderWidth ?? 1.0,
            )
          : null,
      boxShadow: isShadow == true
          ? [
              BoxShadow(
                color: Util.applyOpacity(
                  AppTheme.getColor(context).onSurface,
                  0.1,
                ),
                blurRadius: 5.0,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ]
          : [],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,
              children: [
                SizedBox(
                  width: 160,
                  child: CustomText(
                    title,
                    fontSize:
                        16 * Responsive.getDashboardResponsiveText(context),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                // Display icon if provided
                if (icon != null) icon!,

                // Display count if provided
                if (count != null)
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Util.applyOpacity(
                        AppTheme.getColor(context).secondary,
                        0.15,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: CustomText(
                      '$count',
                      fontSize:
                          12 * Responsive.getDashboardResponsiveText(context),
                      fontWeight: FontWeight.w500,
                      color: AppColors.spanishYellow,
                    ),
                  ),
              ],
            ),
            if (hasViewMoreButton == true)
              GestureDetector(
                onTap: onViewMore,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 6.0,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.getColor(context).surfaceContainerHigh,

                    borderRadius: BorderRadius.circular(8.0),
                  ),

                  child: CustomText(
                    'View All',
                    fontSize:
                        13 * Responsive.getDashboardResponsiveText(context),
                    fontWeight: FontWeight.w500,
                    color: AppTheme.getColor(context).secondary,
                  ),
                ),
              ),
          ],
        ),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: CustomText(
              subtitle!,
              fontSize: 12 * Responsive.getDashboardResponsiveText(context),
              fontWeight: FontWeight.w500,
            ),
          ),
        const SizedBox(height: 12.0),
        child,
      ],
    ),
  );
}
