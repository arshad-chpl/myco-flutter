import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class CommonContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const CommonContainer(BuildContext context, {
    super.key,
    required this.child,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) => Container(
    margin: margin,
    padding: padding,
    decoration: BoxDecoration(
      color: AppTheme.getColor(context).onPrimary,
      border: Border.all(color: AppTheme.getColor(context).outline),
      borderRadius: BorderRadius.circular(12 * getResponsive(context)),
    ),
    child: child,
  );
}
