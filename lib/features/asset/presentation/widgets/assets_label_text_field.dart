import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class AssetsTextFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final String image;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const AssetsTextFieldWidget({
    required this.label,
    required this.image,
    required this.hintText,
    super.key,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      CustomText(
        label,

        fontSize: 14 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w600,
        color: AppTheme.getColor(context).onSurfaceVariant,
      ),
      SizedBox(height: 0.002 * Responsive.getHeight(context)),

      MyCoTextfield(
        controller: controller,
        hintText: LanguageManager().get(hintText),
        boarderRadius: 10,
        textAlignment: TextAlign.start,
        hintTextStyle: TextStyle(
          fontFamily: 'Gilroy-semibold',
          fontWeight: FontWeight.w400,
          fontSize: 16 * Responsive.getResponsiveText(context),
          color: AppColors.gray,
        ),
        typingtextStyle: TextStyle(
          fontFamily: 'Gilroy-semiBold',
          fontWeight: FontWeight.w400,
          fontSize: 16 * Responsive.getResponsiveText(context),
          // color: AppColors.gray,
        ),
        maxLines: 1,
        prefix: Padding(
          padding: EdgeInsets.all(
            16.0 * Responsive.getResponsive(context),
          ), // Adjust as needed
          child: image.endsWith('.svg')
              ? SvgPicture.asset(
                  image,
                  height: 0.01 * Responsive.getWidth(context),
                )
              : Image.asset(
                  image,
                  height: 0.01 * Responsive.getWidth(context),
                  fit: BoxFit.contain,
                ),
        ),
        validator: validator,
        contentPadding: EdgeInsets.symmetric(
          vertical: 14 * Responsive.getResponsive(context),
        ),
      ),
      SizedBox(height: 0.024 * Responsive.getHeight(context)),
    ],
  );
}
