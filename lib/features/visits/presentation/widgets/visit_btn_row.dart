import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class VisitBtnRow extends StatelessWidget {
  const VisitBtnRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 0.20 * getWidth(context),
      children: [
        MyCoButton(
          onTap: () {},
          backgroundColor: AppTheme.getColor(context).onPrimary,
          title: 'Visit Complete',
          width: 0.28 * getWidth(context),
          height: 0.025 * getHeight(context),
          boarderRadius: 20,
          textStyle: TextStyle(color: AppTheme.getColor(context).secondary),
          borderColor: AppTheme.getColor(context).secondary,
        ),

        CustomText(
          'View Attachment',
          color: AppTheme.getColor(context).secondary,
          fontSize: 14 * getResponsiveText(context),
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.underline,
          decorationColor: AppTheme.getColor(context).secondary,
        ),
      ],
    );
  }
}
