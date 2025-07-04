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
    }) {
  final double multiplier = getResponsiveText(context);
  final double spacing = 0.03 * getWidth(context);
  final double screenHeight = getHeight(context);
  final double screenWidth = getWidth(context);

  return Row(
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
              fontSize: 13.5 * multiplier,
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
                      height: 0.04 * screenHeight,
                      width: 0.05 * screenWidth,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      const CustomText(':'),
      SizedBox(width: spacing),
      Expanded(
        flex: 9,
        child: InkWell(
          onTap: onTap,
          child: valueWidget??
          CustomText(
            value,
            color: textColor,
            fontSize: 13.5 * multiplier,
            fontWeight: FontWeight.w500,
            decoration: decoration,
          ),
        ),
      ),
    ],
  );
}

