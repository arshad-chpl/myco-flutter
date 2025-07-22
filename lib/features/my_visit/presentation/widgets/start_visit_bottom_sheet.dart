import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

Widget startVisitBottomSheet(BuildContext context) => Padding(
  padding: EdgeInsets.only(
    left:
        VariableBag.bottomSheetLeftPadding * Responsive.getResponsive(context),
    right:
        VariableBag.bottomSheetRightPadding * Responsive.getResponsive(context),
    top: VariableBag.bottomSheetTopPadding * Responsive.getResponsive(context),
    bottom:
        VariableBag.bottomSheetBottomPadding *
        Responsive.getResponsive(context),
  ),
  child: Column(
    spacing:
        VariableBag.formContentSpacingVertical *
        Responsive.getResponsive(context),
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(
        'visit_face_alert',
        isKey: true,
        fontSize: 18 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w700,
      ),
      Center(child: Image.asset(AppAssets.faceMatch, fit: BoxFit.contain)),

      CustomText(
        'visit_face_alert_info',
        isKey: true,
        fontSize: 18 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w400,
        textAlign: TextAlign.center,
      ),

      Row(
        children: [
          Expanded(
            child: MyCoButton(
              onTap: () {
                Navigator.pop(context);
              },
              title: 'CLOSE',
              textStyle: TextStyle(
                color: AppColors.primary,
                fontSize: 14 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: Colors.transparent,
              boarderRadius:
                  VariableBag.buttonBorderRadius *
                  Responsive.getResponsive(context),
              wantBorder: true,
              borderColor: AppColors.primary,
            ),
          ),
          SizedBox(
            width:
                VariableBag.buttonRowSpacing *
                Responsive.getResponsive(context),
          ),
          Expanded(
            child: MyCoButton(
              onTap: () {
                Navigator.pop(context);
              },
              title: 'CONTINUE',
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 14 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: AppColors.primary,
              boarderRadius:
                  VariableBag.buttonBorderRadius *
                  Responsive.getResponsive(context),
              wantBorder: false,
              isShadowBottomLeft: true,
            ),
          ),
        ],
      ),
    ],
  ),
);
