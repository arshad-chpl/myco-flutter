import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
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
  final bool? wantCount;
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
    this.wantCount = false,
    this.onViewMore,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: padding ?? const EdgeInsets.all(16.0),
    margin: margin,
    decoration: BoxDecoration(
      color: backgroundColor ?? Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
      border: isBorder == true
          ? Border.all(
              color:
                  borderColor ?? Theme.of(context).colorScheme.outlineVariant,
              width: borderWidth ?? 1.0,
            )
          : null,
      boxShadow: isShadow == true
          ? [
              BoxShadow(
                color: Util.applyOpacity(
                  Theme.of(context).colorScheme.onSurface,
                  0.1,
                ),
                blurRadius: 5.0,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ]
          : [],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Row(
              children: [
                CustomText(
                  title,
                  fontSize: 16 * getResponsiveText(context),
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(width: 8.0),
                if (icon != null) icon!,
                if (wantCount == true && count != null)
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: AppTheme.getColor(context).secondary,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: CustomText(
                      '($count)',
                      fontSize: 14 * getResponsiveText(context),
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
            if (hasViewMoreButton == true)
              TextButton(onPressed: onViewMore, child: const Text('View More')),
          ],
        ),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: CustomText(
              subtitle!,
              fontSize: 12 * getResponsiveText(context),
              fontWeight: FontWeight.w500,
            ),
          ),
        const SizedBox(height: 12.0),
        child,
      ],
    ),
  );
}
