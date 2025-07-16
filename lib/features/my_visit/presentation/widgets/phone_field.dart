import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class PhoneField extends StatelessWidget {
  final String selectedCountry;
  final List<String> countries;
  final void Function(String?)? onCountryChanged;
  final TextEditingController controller;
  final Map<String, String> countryDialCodes;
  final double? textFieldHeight;
  final double? borderRadius;
  final Color? borderColor;
  final double? countryFontSize;
  final double? countryCodeFontSize;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextStyle? countryCodeTextStyle;
  final FontWeight? phoneFontWeight;

  const PhoneField({
    super.key,
    required this.selectedCountry,
    required this.countries,
    required this.onCountryChanged,
    required this.controller,
    required this.countryDialCodes,
    this.textFieldHeight,
    this.borderRadius,
    this.borderColor,
    this.countryFontSize,
    this.countryCodeFontSize,
    this.hintText,
    this.hintTextStyle,
    this.countryCodeTextStyle,
    this.phoneFontWeight,
  });

  @override
  Widget build(BuildContext context) => Container(
    height: textFieldHeight ?? 50 * Responsive.getResponsive(context),
    decoration: BoxDecoration(
      color: AppTheme.getColor(context).onPrimary,
      border: Border.all(color: borderColor ?? AppTheme.getColor(context).outline),
      borderRadius: BorderRadius.circular(borderRadius ?? 10 * Responsive.getResponsive(context)),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0 * Responsive.getResponsive(context)),
      child: Row(
        children: [
          PopupMenuButton<String>(
            itemBuilder: (context) => countries
                .map((country) => PopupMenuItem<String>(
              value: country,
              child: CustomText(
                country,
                fontWeight: FontWeight.w700,
                fontSize: countryFontSize ?? 16 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).primary,
              ),
            ))
                .toList(),
            onSelected: (value) => onCountryChanged?.call(value),
            color: AppTheme.getColor(context).onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10 * Responsive.getResponsive(context)),
              side: BorderSide(
                color: AppTheme.getColor(context).primary,
                width: 0.002 * Responsive.getWidth(context),
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 7 * Responsive.getResponsive(context),
                vertical: 8 * Responsive.getResponsive(context),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8 * Responsive.getResponsive(context)),
                color: AppTheme.getColor(context).onPrimary,
              ),
              child: Row(
                children: [
                  CustomText(
                    selectedCountry,
                    fontWeight: FontWeight.w700,
                    fontSize: countryFontSize ?? 16 * Responsive.getResponsiveText(context),
                    color: AppTheme.getColor(context).onSurface,
                  ),
                  SizedBox(width: 4 * Responsive.getResponsive(context)),
                  // Icon(
                  //   Icons.keyboard_arrow_down_rounded,
                  //   size: .070 * getWidth(context),
                  //   color: AppTheme.getColor(context).primary,
                  // ),
                  SvgPicture.asset(AppAssets.downArrow)
                ],
              ),
            ),
          ),
          SizedBox(width: 2 * Responsive.getResponsive(context)),
          Expanded(
            child: Row(
              children: [
                CustomText(
                  countryDialCodes[selectedCountry] ?? '',
                  fontSize: countryCodeFontSize ?? 16 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w500,
                  color: countryCodeTextStyle?.color ?? AppTheme.getColor(context).outline,
                ),
                SizedBox(width: 5 * Responsive.getResponsive(context)),
                Expanded(
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(
                      fontSize: countryCodeFontSize,
                      fontWeight: phoneFontWeight ?? FontWeight.w600,
                      color: AppTheme.getColor(context).primary,
                    ),
                    decoration: InputDecoration(
                      isCollapsed: true,
                      hintText: hintText ?? 'Enter Mobile Number',
                      hintStyle: hintTextStyle ??
                          TextStyle(
                            fontSize: countryCodeFontSize,
                            fontWeight: phoneFontWeight,
                            color: borderColor,
                          ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
