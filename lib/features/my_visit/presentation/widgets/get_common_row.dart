import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  TextDecoration? decoration,
  bool showMap = false,
}) => Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title,
            fontWeight: FontWeight.w700,
            fontSize: 13.5 * Responsive.getResponsiveText(context),
          ),
          if (showMap)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.secondary),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/visit/svgs/map.svg',
                    height: 0.04 * Responsive.getHeight(context),
                    width: 0.05 * Responsive.getWidth(context),
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
    const CustomText(':'),
    SizedBox(width: 0.03 * Responsive.getWidth(context)),
    Expanded(
      flex: 9,
      child: InkWell(
        onTap: onTap,
        child:
            valueWidget ??
            CustomText(
              value,
              color: textColor,
              fontSize: 13.5 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w500,
              decoration: decoration,
            ),
      ),
    ),
  ],
);
