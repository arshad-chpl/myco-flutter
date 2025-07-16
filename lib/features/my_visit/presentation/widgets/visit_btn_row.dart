import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class VisitBtnRow extends StatelessWidget {
  const VisitBtnRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyCoButton(
          onTap: () {},
          backgroundColor: AppTheme.getColor(context).onPrimary,
          title: LanguageManager().get('visit_complete'),
          width: 0.33 * Responsive.getWidth(context),
          height: 0.033 * Responsive.getHeight(context),
          boarderRadius: 20,
          textStyle: TextStyle(color: AppTheme.getColor(context).secondary),
          borderColor: AppTheme.getColor(context).secondary,
        ),
        SizedBox(width: 0.14 * Responsive.getWidth(context)),
        CustomText(
          LanguageManager().get('view_attachment'),
          color: AppTheme.getColor(context).secondary,
          fontSize: 17 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.underline,
          decorationColor: AppTheme.getColor(context).secondary,
        ),
      ],
    );
  }
}
