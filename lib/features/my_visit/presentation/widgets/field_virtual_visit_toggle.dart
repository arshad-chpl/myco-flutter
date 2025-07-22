import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text_radio_button.dart';

class FieldVirtualVisitToggle extends StatelessWidget {
  final String selectedValue;
  final ValueChanged<String> onChanged;

  const FieldVirtualVisitToggle({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final double responsive = Responsive.getResponsive(context);

    return Row(
      spacing: VariableBag.buttonRowSpacing * Responsive.getResponsive(context),
      children: [
        Expanded(
          child: CustomTextRadioButton(
            gender: 'Field Visit',
            selectedGender: selectedValue,
            onSelect: onChanged,
            height: 0.06 * Responsive.getHeight(context),
            width: double.infinity,
            customDecoration: BoxDecoration(
              color: selectedValue == 'Field Visit'
                  ? AppTheme.getColor(context).surfaceContainer
                  : AppTheme.getColor(context).onPrimary,
              border: Border.all(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(10 * responsive),
            ),
          ),
        ),
        Expanded(
          child: CustomTextRadioButton(
            gender: 'Virtual Visit',
            selectedGender: selectedValue,
            onSelect: onChanged,
            height: 0.06 * Responsive.getHeight(context),
            width: double.infinity,
            customDecoration: BoxDecoration(
              color: selectedValue == 'Virtual Visit'
                  ? AppTheme.getColor(context).surfaceContainer
                  : AppTheme.getColor(context).onPrimary,
              border: Border.all(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(10 * responsive),
            ),
          ),
        ),
      ],
    );
  }
}
