import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_checkbox.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AutoStartCheckboxRow extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const AutoStartCheckboxRow({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final double responsive = Responsive.getResponsive(context);
    final double textSize = Responsive.getResponsiveText(context);

    return Row(
      children: [
        CustomCheckbox(
          value: isChecked,
          onChanged: onChanged,
          borderColor: AppTheme.getColor(context).primary,
          activeColor: AppColors.primary,
          checkColor: Colors.white,
          height: 24 * responsive,
          width: 24 * responsive,
          unCheckedBackground: Colors.transparent,
        ),
        SizedBox(width: 10 * responsive),
        Expanded(
          child: CustomText(
            'auto_start_visit',
            isKey: true,
            fontSize: 14 * textSize,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
