import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
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
    spacing: 10 * getResponsive(context),
    children: [
      CustomCheckbox(
        value: autoStartVisit,
        onChanged: onChanged,
        borderColor: AppTheme.getColor(context).onSurface,
        activeColor: AppTheme.getColor(context).primary,
        checkColor: Colors.white,
        height: 20 * getResponsive(context),
        width: 20 * getResponsive(context),
        unCheckedBackground: Colors.white,
      ),
      Expanded(
        child: CustomText(
          'Please agree to automatically start the visit',
          fontSize: 14 * getResponsiveText(context),
          color: AppTheme.getColor(context).onSurface,
        ),
      ),
    ],
  );
}
