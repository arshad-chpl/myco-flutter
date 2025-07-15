import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/colors.dart';
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
      children: [
        CustomText(
          'visit_face_alert',
          isKey: true,
          fontSize: 18 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 0.02 * Responsive.getHeight(context)),
        Center(
          child: Image.asset(
            AppAssets.faceMatch,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 0.025 * Responsive.getHeight(context)),
        CustomText(
          'visit_face_alert_info',
          isKey: true,
          fontSize: 18 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 0.03 * Responsive.getHeight(context)),
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
                boarderRadius: 30,
                wantBorder: true,
                borderColor: AppColors.primary,
              ),
            ),
            SizedBox(width: 0.04 * Responsive.getWidth(context)),
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
                boarderRadius: 30,
                wantBorder: false,
                isShadowBottomLeft: true,
              ),
            ),
          ],
        ),
      ],
    ),
  );
