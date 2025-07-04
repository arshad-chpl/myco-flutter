// ignore_for_file: deprecated_member_use

import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/custom_dialog.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/custom_request_bottom_sheet.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/customotp_bottomsheet.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class OtpVerifyDialog extends StatefulWidget {
  const OtpVerifyDialog({super.key});

  @override
  State<OtpVerifyDialog> createState() => _OtpVerifyDialogState();
}

class _OtpVerifyDialogState extends State<OtpVerifyDialog> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('OTP Verification'),
      centerTitle: true,
      elevation: 0,
    ),
    body: Center(
      child: CustomText(
        'Press the button to verify OTP',
        fontSize: 18 * getResponsiveText(context),
        color: AppTheme.getColor(context).onSurface,
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        // lets get started bottom sheet

        showModalBottomSheet(
          context: context,
          backgroundColor: AppTheme.getColor(context).onPrimary,
          builder: (context) => Container(
            height: .52 * getHeight(context),
            width: getWidth(context),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 45.0 * getResponsive(context),
                horizontal: 30 * getResponsive(context),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/sign_in/myco_logo.png',
                    height: .095 * getHeight(context),
                    width: .5 * getWidth(context),
                  ),
                  SizedBox(height: .02 * getHeight(context)),
                  CustomText(
                    'Let’s Get Started',
                    fontSize: 30 * getResponsiveText(context),
                    color: AppTheme.getColor(context).onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: .02 * getHeight(context)),
                  CustomText(
                    'To enhance your user experience, please set up your profile first. This will help us tailor the app to your needs and ensure you get the most out of our features!',
                    fontSize: 16 * getResponsiveText(context),
                    color: AppTheme.getColor(context).onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: .035 * getHeight(context)),
                  MyCoButton(
                    onTap: () {},
                    title: 'Set Up My Profile',
                    boarderRadius: 30 * getResponsive(context),
                    isShadowBottomLeft: true,
                  ),
                  SizedBox(height: .02 * getHeight(context)),
                  MyCoButton(
                    onTap: () {},
                    boarderRadius: 30 * getResponsive(context),
                    title: 'Explore The App First',
                    backgroundColor: AppTheme.getColor(context).onPrimary,
                    textStyle: MyCoButtonTheme.getWhiteBackgroundTextStyle(
                      context,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        // otp and email bottom sheet

        // showCustomEmailVerificationSheet(
        //   imageUrl: 'assets/sign_in/email.png',
        //   imageHeight: 0.035 * getHeight(context),
        //   imageWidth: 0.09 * getWidth(context),
        //   // isDialog: true,
        //   context: context,
        //   title: 'Sign In Phone Number',
        //   description:
        //       'Sign in code has been sent to +6292121002200, check your inbox to continue the sign in process.',
        //   emailAddress: "example@example.com",
        //   onSubmit: (String otp) {
        //     dev.log("OTP submitted: $otp");
        //   },
        //   onResend: () {
        //     dev.log("Resend OTP");
        //   },
        //   onVerifyButtonPressed: () {
        //     dev.log("Verify button pressed");
        //   },
        //   length: 6,
        // );

        // device change bottom sheet

        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppTheme.getColor(context).onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20 * getResponsive(context)),
            ),
          ),
          builder: (_) => CustomRequestBottomSheet()
        );
      },
      child: const Icon(Icons.message),
    ),
  );
}
