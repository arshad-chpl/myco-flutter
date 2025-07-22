import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AutoClosedTimerWidgets extends StatefulWidget {
  final String remainingTime;

  const AutoClosedTimerWidgets({required this.remainingTime, super.key});

  @override
  State<AutoClosedTimerWidgets> createState() => _AutoClosedTimerWidgetsState();
}

class _AutoClosedTimerWidgetsState extends State<AutoClosedTimerWidgets> {
  @override
  Widget build(BuildContext context) => Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          'auto_close_in',
          fontSize: 17 * Responsive.getDashboardResponsiveText(context),
          isKey: true,
          color: AppTheme.getColor(context).primary,
        ),
        SizedBox(width: 0.01 * Responsive.getWidth(context),),
        CustomText(
          widget.remainingTime,
          fontSize: 17 * Responsive.getDashboardResponsiveText(context),
          isKey: true,
          color: AppTheme.getColor(context).primary,
        ),
      ],
    ),
  );
}
