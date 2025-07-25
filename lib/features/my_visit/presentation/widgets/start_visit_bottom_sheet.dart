import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

Widget startVisitBottomSheet(BuildContext context) => Padding(
  padding: EdgeInsets.only(
    left: 0.05 * Responsive.getWidth(context),
    right: 0.05 * Responsive.getWidth(context),
    bottom: MediaQuery.of(context).viewInsets.bottom + 0.03 * Responsive.getHeight(context),
    top: 0.03 * Responsive.getHeight(context),
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: VariableBag.formContentSpacingVertical * Responsive.getResponsive(context),
    children: [
      CustomText(
        'visit_face_alert',
        isKey: true,
        fontSize: 18 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w700,
      ),
      Center(
        child: Image.asset(
          AppAssets.faceMatch,
          fit: BoxFit.contain,
        ),
      ),
      CustomText(
        'visit_face_alert_info',
        isKey: true,
        fontSize: 18 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w400,
        textAlign: TextAlign.center,
      ),
      Row(
        children: [
          MyCoButton(
            onTap: () {
              Navigator.pop(context);
            },
            title: LanguageManager().get('close'),
            textStyle: TextStyle(
              color: AppColors.primary,
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.transparent,
            boarderRadius: 30,
            wantBorder: true,
            borderColor: AppColors.primary,
            height: 0.055 * Responsive.getHeight(context),
            width: 0.40 * Responsive.getWidth(context),
          ),
          Spacer(),
          MyCoButton(
            onTap: () {
              context.pushNamed('faceDetection');
            },
            title: LanguageManager().get('Continue'),
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: AppColors.primary,
            boarderRadius: 30,
            wantBorder: false,
            isShadowBottomLeft: true,
            height: 0.055 * Responsive.getHeight(context),
            width: 0.40 * Responsive.getWidth(context),

          ),
        ],
      ),
    ],
  ),
);
