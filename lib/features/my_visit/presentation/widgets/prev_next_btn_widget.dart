import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class PrevNextBtnWidget extends StatelessWidget {
  const PrevNextBtnWidget({super.key});

  @override
  Widget build(BuildContext context) => Row(
    spacing: 10 * Responsive.getResponsive(context),
    children: [
      Expanded(
        child: MyCoButton(
          onTap: () {
            Navigator.pop(context);
          },
          title: 'Prev',
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 16 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w600,
          ),
          backgroundColor: AppTheme.getColor(context).primary,
          boarderRadius: 30 * Responsive.getResponsive(context),
          isShadowBottomLeft: true,
        ),
      ),
      Expanded(
        child: MyCoButton(
          onTap: () {
            // Handle  click event
          },
          title: 'Next',
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 16 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w600,
          ),
          backgroundColor: AppTheme.getColor(context).primary,
          boarderRadius: 30 * Responsive.getResponsive(context),
          isShadowBottomLeft: true,
        ),
      ),
    ],
  );
}
