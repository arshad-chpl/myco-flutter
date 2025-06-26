// ignore_for_file: deprecated_member_use

import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/custom_dialog.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/customotp_bottomsheet.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';

class OtpVerifyDialog extends StatefulWidget {
  const OtpVerifyDialog({super.key});

  @override
  State<OtpVerifyDialog> createState() => _OtpVerifyDialogState();
}

class _OtpVerifyDialogState extends State<OtpVerifyDialog> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppTheme.lightTheme(context).colorScheme.onPrimary,
    appBar: AppBar(
      title: const Text('OTP Verification'),
      centerTitle: true,
      backgroundColor: AppTheme.lightTheme(context).appBarTheme.backgroundColor,
      elevation: 0,
      foregroundColor: AppTheme.lightTheme(context).appBarTheme.foregroundColor,
    ),
    body: Center(
      child: Text(
        'Press the button to verify OTP',
        style: TextStyle(
          fontSize: 18 * getResponsiveText(context),
          color: AppColors.textPrimary,
        ),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        // lets get started bottom sheet

        showModalBottomSheet(
          context: context,
          backgroundColor: AppTheme.getColor(context).onPrimary,
          builder: (context) => Container(
            height: .5 * getHeight(context),
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
                  Text(
                    'Let’s Get Started',
                    style: TextStyle(
                      fontSize: 30 * getResponsiveText(context),
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: .02 * getHeight(context)),
                  Text(
                    'To enhance your user experience, please set up your profile first. This will help us tailor the app to your needs and ensure you get the most out of our features!',
                    style: TextStyle(
                      fontSize: 17 * getResponsiveText(context),
                      color: AppColors.textPrimary2,
                      fontWeight: FontWeight.w500,
                    ),
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
                    backgroundColor: AppColors.white,
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

        // showModalBottomSheet(
        //   context: context,
        //   isScrollControlled: true,
        //   backgroundColor: AppColors.white,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(
        //       top: Radius.circular(20 * getResponsive(context)),
        //     ),
        //   ),
        //   builder: (_) => MyCoDialog(
        //     isBottomSheet: true,
        //     image: Image.asset(
        //       'assets/sign_in/update.png',
        //       height: .15 * getHeight(context),
        //       width: .5 * getWidth(context),
        //     ),
        //     isDescriptionThere: false,
        //     title:
        //         'You were registered with Google - sdk_gphonr64_arm64, please contact to \nadmin or request for new phone registration.',
        //     actions: [
        //       MyCoButton(
        //         onTap: () {},
        //         title: 'Close',
        //         height: 0.068 * getHeight(context),
        //         width: .7 * getWidth(context),
        //         backgroundColor: AppColors.white,
        //         textStyle: MyCoButtonTheme.getWhiteBackgroundTextStyle(context),
        //         boarderRadius: 30 * getResponsive(context),
        //       ),
        //       MyCoButton(
        //         onTap: () {},
        //         title: 'Request',
        //         height: 0.068 * getHeight(context),
        //         width: .7 * getWidth(context),
        //         boarderRadius: 30 * getResponsive(context),
        //         isShadowBottomLeft: true,
        //       ),
        //     ],
        //   ),
        // );
      },
      child: const Icon(Icons.message),
    ),
  );
}
