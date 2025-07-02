import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class BottomTermAndCondition extends StatelessWidget {
  const BottomTermAndCondition({super.key});

  @override
  Widget build(BuildContext context) => Container(
      height: getHeight(context) * 0.92,
      padding: EdgeInsets.only(
        top: 20 * getResponsive(context),
        left: 20 * getResponsive(context),
        right: 20 * getResponsive(context),
      ),
      decoration: BoxDecoration(
        color: AppTheme.getColor(context).onPrimary,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30 * getResponsive(context)),
        ),
      ),
      child: Padding(
        padding:  EdgeInsets.only(
          left: 14.0 * getResponsive(context),
          right: 14.0 * getResponsive(context),
          top: 20.0 * getResponsive(context),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              'Terms & Conditions and Privacy Policy',

              fontSize: 24 * getResponsiveText(context),
              fontWeight: FontWeight.w800,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20 * getResponsive(context)),
            Scrollbar(
              thumbVisibility: true,
              trackVisibility: true,
              child: Container(
                height: getHeight(context) * 0.58,
                decoration:  BoxDecoration(
                  color: AppTheme.getColor(context).onSecondaryContainer,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                    right: 12.0,
                    top: 12.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          '1. Introduction',

                          fontSize: 18 * getResponsiveText(context),
                          fontWeight: FontWeight.w600,

                        ),
                        SizedBox(height: 10 * getResponsive(context)),
                        CustomText(
                          'Welcome to MyCo! By using our app, you agree to the following terms and conditions...',

                          fontSize: 16 * getResponsiveText(context),

                        ),
                        SizedBox(height: 20 * getResponsive(context)),
                        CustomText(
                          '2. Privacy Policy',

                          fontSize: 18 * getResponsiveText(context),
                          fontWeight: FontWeight.w600,

                        ),
                        SizedBox(height: 10 * getResponsive(context)),
                        CustomText(
                          'We value your privacy. Please read our privacy policy to understand how we handle your data...',

                          fontSize: 16 * getResponsiveText(context),

                        ),
                        SizedBox(height: 10 * getResponsive(context)),
                        CustomText( '3. User Responsibilities',

                          fontSize: 18 * getResponsiveText(context),
                          fontWeight: FontWeight.w600,

                        ),
                        // SizedBox(height: 500),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 0.026 * getHeight(context)),
            MyCoButton(
              onTap: () {},
              title: "I Agree",
              height: 0.065 * getHeight(context),
              boarderRadius: 30,
              textStyle:  TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color:AppTheme.getColor(context).onPrimary,
              ),
              backgroundColor: AppTheme.getColor(context).primary,
              isShadowBottomLeft: true,
            ),
            SizedBox(height: 20 * getResponsive(context)),
            MyCoButton(
              onTap: () {},
              title: "Decline",
              height: 0.065 * getHeight(context),
              boarderRadius: 30,
              textStyle:  TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.getColor(context).primary,
              ),
              backgroundColor: AppTheme.getColor(context).onPrimary,
            ),
          ],
        ),
      ),
    );
}
