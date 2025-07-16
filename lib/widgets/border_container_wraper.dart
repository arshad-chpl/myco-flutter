import 'package:flutter/cupertino.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

/// A customizable container widget with optional border, shadow, padding,
/// and a top-right notification badge.
// ignore: must_be_immutable
class BorderContainerWraper extends StatelessWidget {
  Color? borderColor;
  Color? backgroundColor;
  double? borderWidth;
  double? borderRadius;
  double? height;
  double? width;
  EdgeInsets? padding;
  EdgeInsets? margin;
  bool? isShadow;
  bool? isBorder;
  Widget child;
  bool isNotificationBadge;
  String? notificationCount;

  BorderContainerWraper({
    super.key,
    required this.child,
    this.borderColor,
    this.backgroundColor,
    this.borderWidth,
    this.borderRadius,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.isShadow = false,
    this.isBorder = true,
    this.isNotificationBadge = false,
    this.notificationCount,
  });

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      // Main container with border, background, shadow, and padding
      Container(
        height: height,
        width: width,
        padding: padding ?? const EdgeInsets.all(8.0),
        margin: margin ?? const EdgeInsets.all(0.0),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppTheme.getColor(context).surface,
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          border: isBorder == true
              ? Border.all(
                  color:
                      borderColor ?? AppTheme.getColor(context).outlineVariant,
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
        child: child,
      ),

      // Top-right corner badge showing a notification count
      if (isNotificationBadge)
        // displayed top right notification
        Positioned(
          top: 0,
          right: 1,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppTheme.getColor(context).secondary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(borderRadius ?? 0),
                bottomLeft: Radius.circular(
                  16 * Responsive.getResponsive(context),
                ),
              ),
            ),
            child: CustomText(
              notificationCount.toString(),
              color: AppTheme.getColor(context).surface,
              fontSize: 10 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
          ),
        ),
    ],
  );
}
