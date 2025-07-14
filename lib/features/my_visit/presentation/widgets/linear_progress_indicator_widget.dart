import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class LinearProgressIndicatorWidget extends StatefulWidget {
  final double progress;

  const LinearProgressIndicatorWidget({required this.progress, super.key});

  @override
  State<LinearProgressIndicatorWidget> createState() =>
      _LinearProgressIndicatorWidgetState();
}

class _LinearProgressIndicatorWidgetState
    extends State<LinearProgressIndicatorWidget> {
  @override
  Widget build(BuildContext context) => Container(
    height: 0.021 * Responsive.getHeight(context),
    decoration: BoxDecoration(
      border: Border.all(
        width: 5 * Responsive.getResponsiveOnWidth(context),
        color: AppTheme.getColor(context).primary,
      ),
      borderRadius: BorderRadius.circular(
        13 * Responsive.getResponsive(context),
      ),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(
        11 * Responsive.getResponsive(context),
      ),
      child: LinearProgressIndicator(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(13 * Responsive.getResponsive(context)),
        ),
        value: widget.progress,
        backgroundColor: AppColors.containerHigh,
        color: AppTheme.getColor(context).primary,
      ),
    ),
  );
}
