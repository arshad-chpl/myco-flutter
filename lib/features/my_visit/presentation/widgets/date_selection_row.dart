import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class DateSelectionRow extends StatelessWidget {
  final String formattedDate;
  final VoidCallback goToPreviousDate;
  final VoidCallback goToNextDate;
  final VoidCallback selectDateFromPicker;

  const DateSelectionRow({
    super.key,
    required this.formattedDate,
    required this.goToPreviousDate,
    required this.goToNextDate,
    required this.selectDateFromPicker,
  });

  @override
  Widget build(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DateArrowButton(icon: Icons.chevron_left_rounded, onTap: goToPreviousDate),
        GestureDetector(
          onTap: selectDateFromPicker,
          child: Row(
            children: [
              Baseline(
                baselineType: TextBaseline.alphabetic,
                baseline: 20 * Responsive.getResponsiveText(context),
                child: CustomText(
                  formattedDate,
                  fontSize: 16 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w700,
                  color: AppTheme.getColor(context).onSurface,
                ),
              ),
              Baseline(
                baselineType: TextBaseline.alphabetic,
                baseline: 20 * Responsive.getResponsiveText(context),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 22 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).onSurface,
                ),
              ),
            ],
          ),
        ),
        DateArrowButton(icon: Icons.chevron_right_rounded, onTap: goToNextDate),
      ],
    );
}

class DateArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const DateArrowButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8 * Responsive.getResponsiveText(context)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15 * Responsive.getResponsiveText(context)),
          color: AppTheme.getColor(context).primary.withOpacity(0.25),
        ),
        child: Icon(icon, size: 22 * Responsive.getResponsiveText(context)),
      ),
    );
}
