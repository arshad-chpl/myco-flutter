// ignore_for_file: deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:pinput/pinput.dart';

class OtpVerifyDialog extends StatefulWidget {
  const OtpVerifyDialog({super.key});

  @override
  State<OtpVerifyDialog> createState() => _OtpVerifyDialogState();
}

class _OtpVerifyDialogState extends State<OtpVerifyDialog> {
  void showOtpBottomSheet() {
    final defaultPinTheme = PinTheme(
      width: 55,
      height: 55,
      textStyle: TextStyle(
        fontSize: 30 * getResponsiveText(context),
        color: AppColors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8 * getResponsive(context)),
        border: Border.all(color: AppColors.textBorder300, width: 1.5),
      ),
    );

    showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20 * getResponsive(context)),
        ),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16 * getResponsive(context),
          right: 16 * getResponsive(context),
          top:
              24 *
              getResponsive(
                context,
              ), // Reduced top padding to accommodate the container
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip
              .none, // Allows the container to extend outside the bottom sheet
          children: [
            // Main content (shifted down to make space for the container)
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 65,
                  ), // Space for the phone icon container
                  // Title
                  Text(
                    'Sign In Phone Number',
                    style: TextStyle(
                      fontSize: 26 * getResponsiveText(context),
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: .01 * getHeight(context)),
                  // Description
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8.0 * getResponsive(context),
                    ),
                    child: Text(
                      'Sign in code has been sent to +6292121002200, check your inbox to continue the sign in process.',
                      style: TextStyle(
                        fontSize: 18 * getResponsiveText(context),
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // OTP Pinput
                  Pinput(
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    separatorBuilder: (index) => const SizedBox(width: 8),
                    preFilledWidget: Text(
                      '0',
                      style: TextStyle(
                        fontSize: 30 * getResponsiveText(context),
                        color: AppColors.textGrey200,
                      ),
                    ),
                    onCompleted: (pin) {
                      print('OTP entered: $pin');
                    },
                  ),
                  SizedBox(height: .01 * getHeight(context)),
                  // Timer
                  Text(
                    '00:25',
                    style: TextStyle(
                      fontSize: 18 * getResponsiveText(context),
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: .01 * getHeight(context)),
                  // Resend
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8.0 * getResponsive(context),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 18 * getResponsiveText(context),
                          ),
                          children: [
                            const TextSpan(
                              text: "Haven't received the sign in code? ",
                            ),
                            TextSpan(
                              text: 'Resend it.',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                                fontSize: 18 * getResponsiveText(context),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // handle resend
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: .015 * getHeight(context)),
                  // Email / Call
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 18 * getResponsiveText(context),
                        color: AppColors.textPrimary,
                      ),
                      children: [
                        TextSpan(
                          text: 'Email for OTP',
                          style: const TextStyle(
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationColor: AppColors.primary,
                            decorationThickness: 2,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // handle email OTP
                              print('Jemi in email');
                            },
                        ),
                        const TextSpan(
                          text: ' Or ',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Call for OTP',
                          style: const TextStyle(
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationColor: AppColors.primary,
                            decorationThickness: 2,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // handle call OTP
                              print('Jemi in Otp');
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: .02 * getHeight(context)),
                  // Submit button
                  MyCoButton(
                    onTap: () {},
                    title: 'Submit',
                    boarderRadius: 30 * getResponsive(context),
                    isShadowBottomLeft: true,
                  ),
                  SizedBox(height: .025 * getHeight(context)),
                  // Sign in with different method
                  GestureDetector(
                    onTap: () {
                      // handle sign in with different method
                    },
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18 * getResponsiveText(context),
                        ),
                        children: [
                          const TextSpan(
                            text: 'Sign in with different method ',
                            style: TextStyle(color: AppColors.textPrimary),
                          ),
                          TextSpan(
                            text: 'Here.',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                              fontSize: 18 * getResponsiveText(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: .03 * getHeight(context)),
                ],
              ),
            ),
            // Phone Icon Container (half outside, half inside)
            Positioned(
              top:
                  -80 *
                  getResponsive(
                    context,
                  ), // Half of the container height (100 / 2) above the top edge
              child: MyCoButton(
                onTap: () {},
                title: '',
                height: 0.11 * getHeight(context),
                width: .25 * getWidth(context),
                image: Image.asset('assets/sign_in/phone.png'),
                isShadowBottomLeft: true,
              ),
              // child: Container(
              //   height: 100,
              //   width: 100,
              //   decoration: BoxDecoration(
              //     color: AppColors.primary,
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black12,
              //         blurRadius: 8,
              //         offset: Offset(0, 2),
              //       ),
              //     ],
              //     borderRadius: BorderRadius.circular(
              //       20 * getResponsive(context),
              //     ),
              //   ),
              //   child: Image.asset('assets/sign_in/phone.png'),
              // ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.white,
    appBar: AppBar(
      title: const Text('OTP Verification'),
      centerTitle: true,
      backgroundColor: AppColors.white,
      elevation: 0,
      foregroundColor: AppColors.black,
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
      onPressed: showOtpBottomSheet,
      child: const Icon(Icons.message),
    ),
  );
}
