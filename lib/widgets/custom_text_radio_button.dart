import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class CustomTextRadioButton extends StatelessWidget {

  final String gender;
  final String selectedGender;
  final void Function(String) onSelect;

  // Responsive helpers
  final double height;
  final double width;

  // Optional customization
  final BoxDecoration? customDecoration;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;
  final Widget? leading;
  final Widget? trailing;


  const CustomTextRadioButton({
    super.key,
    required this.gender,
    required this.selectedGender,
    required this.onSelect,
    required this.height,
    required this.width,
    this.customDecoration,
    this.padding,
    this.margin,
    this.textStyle,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = gender == selectedGender;

    return GestureDetector(
      onTap: () {
        if (isSelected) {
          onSelect(''); // Deselect if tapped again
        } else {
          onSelect(gender); // Select new gender
        }
      },
      child: Container(
        height: height,
        width: width,
        // padding: padding ?? EdgeInsets.symmetric(vertical: 12 * Responsive.getResponsive(context)),
        // margin: margin ?? EdgeInsets.symmetric(horizontal: 6 * Responsive.getResponsive(context)),
        decoration:
            customDecoration ??
            BoxDecoration(
              border: Border.all(color: AppColors.gray, width: 1),
              borderRadius: BorderRadius.circular(
                10 * Responsive.getResponsive(context),
              ),
              color: Colors.white,
            ),
        child: Row(
          children: [
            leading ??
                Radio<String>(
                  value: gender,
                  groupValue: selectedGender,
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    if (value == selectedGender) {
                      onSelect(''); // Deselect
                    } else {
                      onSelect(value!); // Select
                    }
                  },
                ),
            Text(
              gender,
              style:
                  textStyle ??
                  TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray,
                    fontSize: 18 * Responsive.getResponsiveText(context),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
