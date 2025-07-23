import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class CustomVisitTypeRadioButton extends StatelessWidget {
  final List<String> options;
  final String selectedValue;
  final Function(String) onChanged;

  // Customization parameters
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? tilePadding;
  final Color? activeColor;

  const CustomVisitTypeRadioButton({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
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
    final responsiveWidth = width ?? screenWidth * (isTablet ? 1 : 1);

    return Container(
      width: responsiveWidth,
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.primary.withOpacity(0.02),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ?? theme.primary,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10 * Responsive.getResponsive(context),
        horizontal: 10 * Responsive.getResponsive(context),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: options.map(
              (option) => RadioListTile<String>(
            dense: true,
            contentPadding: tilePadding ?? const EdgeInsets.symmetric(horizontal: 0),
            visualDensity: VisualDensity.compact,
            activeColor: activeColor ?? theme.primary,
            title: Text(
              option,
              style: textStyle ??
                  TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18 * Responsive.getResponsiveText(context),
                  ),
            ),
            value: option,
            groupValue: selectedValue,
            onChanged: (value) => onChanged(value!),
          ),
        ).toList(),
      ),
    );
  }
}
