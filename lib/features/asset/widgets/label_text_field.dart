import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class LabelTextFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final String image;
  final TextEditingController? controller;
  const LabelTextFieldWidget({
    required this.label,
    required this.image,
    required this.hintText,
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      CustomText(
        label,
        fontSize: 16 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w600,
        color: AppTheme.getColor(context).onSurfaceVariant,
      ),
      SizedBox(height: 0.002 * Responsive.getHeight(context)),

      MyCoTextfield(
        controller: controller,
        hintText: hintText,
        boarderRadius: 10,
        textAlignment: TextAlign.start,
        hintTextStyle: TextStyle(
          fontFamily: 'Gilroy-semibold',
          fontWeight: FontWeight.w400,
          fontSize: 18 * Responsive.getResponsiveText(context),
          color: AppColors.gray,
        ),
        maxLines: 1,
        prefix: Padding(
          padding: EdgeInsets.all(
            16.0 * Responsive.getResponsive(context),
          ), // Adjust as needed
          child: Image.asset(
            image,
            height: 0.01 * Responsive.getWidth(context),
            fit: BoxFit.contain,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 14 * Responsive.getResponsive(context),
        ),
      ),
      SizedBox(height: 0.024 * Responsive.getHeight(context)),
    ],
  );
}
