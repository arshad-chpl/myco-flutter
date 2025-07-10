import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/show_date_time_widget.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class GpsAccuracyStatusWidget extends StatefulWidget {
  final String accuracyStatus;
  final Color accuracyStatusColor;
  const GpsAccuracyStatusWidget({required this.accuracyStatus, required this.accuracyStatusColor, super.key});

  @override
  State<GpsAccuracyStatusWidget> createState() => _GpsAccuracyStatusWidgetState();
}

class _GpsAccuracyStatusWidgetState extends State<GpsAccuracyStatusWidget> {
  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ShowDateTimeWidget(
          color: AppTheme.getColor(context).onSurface,
          weight: FontWeight.w600,
        ),
        const SizedBox(width: 14),
        CustomText(
          'GPS Accuracy : ',
          color: AppTheme.getColor(context).onSurface,
          fontWeight: FontWeight.w600,
          fontSize: 17 * Responsive.getResponsiveText(context),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: AppColors.spanishYellow,
              width: 5 * Responsive.getResponsiveOnWidth(context),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 13 * Responsive.getResponsive(context),
              vertical: 1 * Responsive.getResponsive(context),
            ),
            child: CustomText(
              widget.accuracyStatus,
              fontSize: 13 * Responsive.getResponsiveText(context),
              color: widget.accuracyStatusColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
}
