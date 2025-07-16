import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart'; // make sure to import

class CustomVisitTypeRadioButton extends StatelessWidget {
  final List<String> options;
  final String selectedValue;
  final Function(String) onChanged;

  // Customization params
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? tilePadding;
  final Color? activeColor;

  const CustomVisitTypeRadioButton({
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    super.key,
    this.height,
    this.width,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 10,
    this.textStyle,
    this.tilePadding,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.getColor(context);
    final screenWidth = Responsive.getWidth(context);
    final isTablet = screenWidth > 600;
    final responsiveWidth = isTablet ? screenWidth * 10 : screenWidth * 10;

    return Container(
      width: responsiveWidth,
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor ?? theme.primary),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10 * Responsive.getResponsive(context),
        horizontal: 10* Responsive.getResponsive(context),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: options
            .map(
              (option) => RadioListTile<String>(
                dense: true,
                contentPadding:
                    tilePadding ??
                    EdgeInsets.symmetric(
                      horizontal: 9 * Responsive.getResponsive(context),
                    ),
                visualDensity: VisualDensity.compact,
                activeColor: activeColor ?? theme.primary,
                title: CustomText(
                  option,
                  fontWeight: FontWeight.w600,
                  fontSize: 18 * Responsive.getResponsiveText(context),
                  color:
                      textStyle?.color ?? AppTheme.getColor(context).onSurface,
                ),
                value: option,
                groupValue: selectedValue,
                onChanged: (value) => onChanged(value!),
              ),
            )
            .toList(),
      ),
    );
  }
}
