import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

Widget startVisitBottomSheet(BuildContext context) {
  final double screenWidth = Responsive.getWidth(context);
  final double screenHeight = Responsive.getHeight(context);
  final double multiplier = Responsive.getResponsiveText(context);

  return Padding(
    padding: EdgeInsets.only(
      left: screenWidth * 0.05,
      right: screenWidth * 0.05,
      bottom: MediaQuery.of(context).viewInsets.bottom + screenHeight * 0.03,
      top: screenHeight * 0.03,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          'Face Match Alert!',
          fontSize: 18 * multiplier,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: screenHeight * 0.02),
        Center(
          child: Image.asset(
            'assets/visit/svgs/face_match.png',
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: screenHeight * 0.025),
        CustomText(
          'You will now required to match your face when you start or end the visit',
          fontSize: 18 * multiplier,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: screenHeight * 0.03),
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
                  fontSize: 14 * multiplier,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.transparent,
                boarderRadius: 30,
                wantBorder: true,
                borderColor: AppColors.primary,
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: MyCoButton(
                onTap: () {
                  Navigator.pop(context);
                },
                title: 'CONTINUE',
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 14 * multiplier,
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
}