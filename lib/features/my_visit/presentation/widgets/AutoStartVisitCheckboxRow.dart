import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_checkbox.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AutoStartVisitCheckboxRow extends StatelessWidget {
  final bool autoStartVisit;
  final ValueChanged<bool?> onChanged;

  const AutoStartVisitCheckboxRow({
    Key? key,
    required this.autoStartVisit,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    spacing: 10 * Responsive.getResponsive(context),
    children: [
      CustomCheckbox(
        value: autoStartVisit,
        onChanged: onChanged,
        borderColor: AppTheme.getColor(context).onSurface,
        activeColor: AppTheme.getColor(context).primary,
        checkColor: Colors.white,
        height: 20 * Responsive.getResponsive(context),
        width: 20 * Responsive.getResponsive(context),
        unCheckedBackground: Colors.white,
      ),
      Expanded(
        child: CustomText(
          LanguageManager().get('auto_start_visit'),
        ),
      ),
    ],
  );
}
