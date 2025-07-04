import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/util.dart';

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
  });

  @override
  Widget build(BuildContext context) => Container(
      height: height,
      width: width,
      padding: padding ?? EdgeInsets.all(8.0),
      margin: margin ?? EdgeInsets.all(0.0),
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
                  color: Util.applyOpacity(AppTheme.getColor(context).onSurface, 0.1),
                  blurRadius: 5.0,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ]
            : [],
      ),
      child: child,
    );
}
