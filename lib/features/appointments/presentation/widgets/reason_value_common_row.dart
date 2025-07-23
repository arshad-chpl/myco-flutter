import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class ReasonValueCommonRow extends StatefulWidget {
  final String heading;
  final String value;

  const ReasonValueCommonRow({
    required this.heading,
    required this.value,
    super.key,
  });

  @override
  State<ReasonValueCommonRow> createState() =>
      _ReasonValueCommonRowState();
}

class _ReasonValueCommonRowState
    extends State<ReasonValueCommonRow> {
  @override
  Widget build(BuildContext context) {
    final double headingColumnWidth = Responsive.getWidth(context) * 0.42;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: headingColumnWidth,
          child: CustomText(
            widget.heading,
            fontWeight: FontWeight.w600,
            fontSize: 14 * Responsive.getResponsiveText(context),
            textAlign: TextAlign.start,
          ),
        ),
        CustomText(
          ' :',
          fontWeight: FontWeight.w600,
          fontSize: 14 * Responsive.getResponsiveText(context),
          color: AppTheme.getColor(context).primary,
        ),
        SizedBox(width: 0.04 * Responsive.getWidth(context)),
        Expanded(
          child: CustomText(
            widget.value,
            fontWeight: FontWeight.w600,
            fontSize: 14 * Responsive.getResponsiveText(context),
            color: AppColors.textGray,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}