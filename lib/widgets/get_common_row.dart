import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

Row getCommonRow(
  BuildContext context, {
  required String title,
  required String value,
  required VoidCallback onTap,
  Widget? valueWidget,
  Color textColor = AppColors.black,
  FontWeight? fontWeight,
  TextDecoration? decoration,
}) => Row(
  crossAxisAlignment: CrossAxisAlignment.baseline,
  textBaseline: TextBaseline.alphabetic,
  children: [
    Expanded(
      flex: 7,
      child: CustomText(
        title,
        fontWeight: FontWeight.w700,
        fontSize: 17 * Responsive.getResponsiveText(context),
      ),
    ),
    const CustomText(':'),
    SizedBox(width: 0.03 * Responsive.getWidth(context)),
    Expanded(
      flex: 5,
      child: InkWell(
        onTap: onTap,
        child:
            valueWidget ??
            CustomText(
              value,
              decoration: decoration,
              color: textColor,
              fontWeight: fontWeight ?? FontWeight.w500,
              fontSize: 13 * Responsive.getResponsiveText(context),
            ),
      ),
    ),
  ],
);
