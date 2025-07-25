import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

Stack getCommonRow(
    BuildContext context, {
      required String title,
      required String value,
      required VoidCallback onTap,
      bool showMap = false,
      Widget? valueWidget,
      Color textColor = AppColors.black,
      TextDecoration? decoration,
    }) => Stack(
  clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            Row(
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
                      fontWeight: FontWeight.w500,
                      fontSize: 13 * Responsive.getResponsiveText(context),
                    ),
              ),
            ),
              ],
            ),
          ],
        ),
        if (showMap)
          Positioned(
            left: 0,
            top: 25,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.secondary),
                borderRadius: BorderRadius.circular(6),
              ),
              padding:  EdgeInsets.all(6),
              child: SvgPicture.asset(
                AppAssets.map,
                height: 40 * Responsive.getResponsive(context),
                width: 40 * Responsive.getResponsive(context),
              ),
            ),
          )
      ],
    );
