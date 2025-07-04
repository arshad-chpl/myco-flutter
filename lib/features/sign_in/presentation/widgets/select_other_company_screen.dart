import 'dart:developer' as dev;

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/bottom_term_and_condition.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/customotp_bottomsheet.dart';
import 'package:myco_flutter/widgets/custom_checkbox.dart';
import 'package:myco_flutter/widgets/custom_countrycodetextfield.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class SelectOtherCompanyScreen extends StatefulWidget {
  const SelectOtherCompanyScreen({super.key});

  @override
  State<SelectOtherCompanyScreen> createState() =>
      _SelectOtherCompanyScreenState();
}

class _SelectOtherCompanyScreenState extends State<SelectOtherCompanyScreen> {
  String selectedCountry = 'IND';
  final TextEditingController phoneController = TextEditingController();
  bool isChecked = false;

  final Map<String, String> countryMap = {
    'IND': '+91',
    'USA': '+1',
    'INA': '+62',
  };
  @override
  Widget build(BuildContext context) => Container(
    height: 0.7 * Responsive.getHeight(context),
    width: Responsive.getWidth(context),
    decoration: BoxDecoration(
      color: AppTheme.getColor(context).onPrimary,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40 * Responsive.getResponsive(context)),
        topRight: Radius.circular(40 * Responsive.getResponsive(context)),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.only(
        left: 30 * Responsive.getResponsive(context),
        right: 30 * Responsive.getResponsive(context),
        top: 50 * Responsive.getResponsive(context),
        bottom: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/sign_in/back_arrow.png",
                height: 0.015 * Responsive.getHeight(context),
                fit: BoxFit.cover,
              ),
              SizedBox(width: 0.05 * Responsive.getWidth(context)),
              CustomText(
                "Select Other Company",
                color: AppTheme.getColor(context).onSurface,
                fontWeight: FontWeight.w800,
                fontSize: 18 * Responsive.getResponsiveText(context),
              ),
            ],
          ),
          SizedBox(height: 0.015 * Responsive.getHeight(context)),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  "Sign in",
                  fontSize: 30 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w900,
                  color: AppTheme.getColor(context).onSurface,
                ),
                CustomText(
                  "Welcome To Delta Corporation",
                  fontSize: 20 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w800,
                  color: AppTheme.getColor(context).onSurface,
                ),
              ],
            ),
          ),
          SizedBox(height: 0.015 * Responsive.getHeight(context)),
          CustomText(
            "Phone number",
            fontSize: 16 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w600,
            color: AppTheme.getColor(context).onSurface,
          ),
          PhoneNumberField(
            selectedCountry: selectedCountry,
            countries: countryMap.keys.toList(),
            onCountryChanged: (value, index) {
              if (value != null) {
                setState(() {
                  selectedCountry = value;
                });
              }
            },
            countryDialCodes: countryMap,
            phoneController: phoneController,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                15 * Responsive.getResponsive(context),
              ),
              border: Border.all(color: AppColors.gray5),
              color: AppTheme.getColor(context).onPrimary,
            ),
          ),
          SizedBox(height: 0.015 * Responsive.getHeight(context)),
          MyCoButton(
            onTap: () {
              showCustomEmailVerificationSheet(
                imageUrl: 'assets/sign_in/phone.png',
                imageHeight: 0.035 * Responsive.getHeight(context),
                imageWidth: 0.09 * Responsive.getWidth(context),
                // isDialog: true,
                context: context,
                title: 'Sign In Phone Number',
                description:
                    'Sign in code has been sent to +6292121002200, check your inbox to continue the sign in process.',
                emailAddress: "example@example.com",
                onSubmit: (String otp) {
                  dev.log("OTP submitted: $otp");
                },
                onResend: () {
                  //for here
                  dev.log("Resend OTP");
                  context.pushNamed("select-other-company");
                },
                onVerifyButtonPressed: () {
                  dev.log("Verify button pressed");
                },
                length: 6,
              );
            },
            textStyle: TextStyle(
              color: AppTheme.getColor(context).onPrimary,
              fontSize: 18 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.bold,
            ),
            title: "Sign in",
            boarderRadius: 30 * Responsive.getResponsive(context),
            // isShadowBottomRight: true,
            isShadowBottomLeft: true,
          ),
          SizedBox(height: 0.025 * Responsive.getHeight(context)),
          Row(
            children: [
              Expanded(
                child: Divider(
                  height: 10,
                  color: AppColors.gray5,
                  thickness: 2,
                ),
              ),
              SizedBox(width: 0.018 * Responsive.getHeight(context)),
              Text("OR"),
              SizedBox(width: 0.018 * Responsive.getHeight(context)),
              Expanded(
                child: Divider(
                  height: 10,
                  color: AppColors.gray5,
                  thickness: 2,
                ),
              ),
            ],
          ),
          SizedBox(height: 0.025 * Responsive.getHeight(context)),
          MyCoButton(
            onTap: () {},
            title: "Sign In with Google",
            textStyle: TextStyle(
              color: AppTheme.getColor(
                context,
              ).onSurface.withValues(alpha: 0.5),
              fontSize: 20 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w900,
            ),
            image: Image.asset(
              "assets/sign_in/google_logo.png",
              fit: BoxFit.contain,
              height: 0.02 * Responsive.getHeight(context),
            ),
            spacing: 10 * Responsive.getResponsive(context),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppTheme.getColor(context).primary),
              borderRadius: BorderRadius.circular(
                40 * Responsive.getResponsive(context),
              ),
            ),
          ),
          SizedBox(height: 0.015 * Responsive.getHeight(context)),
          MyCoButton(
            onTap: () {},
            title: "Sign In with Apple",
            textStyle: TextStyle(
              color: AppTheme.getColor(
                context,
              ).onSurface.withValues(alpha: 0.5),
              fontSize: 20 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w900,
            ),
            image: Image.asset(
              "assets/sign_in/apple_logo.png",
              fit: BoxFit.contain,
              height: 0.02 * Responsive.getHeight(context),
            ),
            spacing: 10 * Responsive.getResponsive(context),
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.getColor(context).primary),
              color: AppColors.white,
              borderRadius: BorderRadius.circular(
                40 * Responsive.getResponsive(context),
              ),
            ),
          ),
          SizedBox(height: 0.025 * Responsive.getHeight(context)),
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don’t have an account? ",
                    style: TextStyle(
                      color: AppTheme.getColor(context).onSurface,
                      fontSize: 14 * Responsive.getResponsiveText(context),
                    ),
                  ),
                  TextSpan(
                    text: "Sign Up Here",
                    style: TextStyle(
                      color: AppTheme.getColor(context).primary,
                      fontSize: 14 * Responsive.getResponsiveText(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 0.025 * Responsive.getHeight(context)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomCheckbox(
                value: isChecked,
                onChanged: (val) {
                  setState(() {
                    isChecked = val;
                  });
                },
                borderColor: isChecked
                    ? AppColors.primary
                    : Colors.grey, // 🔁 dynamic
                activeColor: AppTheme.getColor(context).primaryContainer,
                checkColor: AppTheme.getColor(context).primary,
                height: 0.026 * Responsive.getHeight(context),
                width: 0.056 * Responsive.getWidth(context),
                unCheckedBackground: AppTheme.getColor(
                  context,
                ).primaryContainer,
              ),
              SizedBox(width: 0.015 * Responsive.getWidth(context)),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: AppTheme.getColor(context).onSurface,
                      fontSize: 14 * Responsive.getResponsiveText(context),
                    ),
                    children: [
                      TextSpan(
                        text: "Please confirm that you agree to our ",
                        style: TextStyle(
                          color: AppTheme.getColor(context).onSurface,
                          fontSize: 14 * Responsive.getResponsiveText(context),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                          color: AppTheme.getColor(context).primary,
                          fontSize: 14 * Responsive.getResponsiveText(context),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) => BottomTermAndCondition(),
                            );
                          },
                      ),
                      TextSpan(text: ", "),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) => BottomTermAndCondition(),
                            );
                          },
                        text: "Terms & Conditions",
                        style: TextStyle(
                          color: AppTheme.getColor(context).primary,
                        ),
                      ),
                      TextSpan(
                        text: " & ",
                        style: TextStyle(
                          color: AppTheme.getColor(context).onSurface,
                          fontSize: 14 * Responsive.getResponsiveText(context),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: "Cancellation & Refund Policy",
                        style: TextStyle(
                          color: AppTheme.getColor(context).primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) => BottomTermAndCondition(),
                            );
                          },
                      ),
                      TextSpan(
                        text: ".",
                        style: TextStyle(
                          color: AppTheme.getColor(context).onSurface,
                          fontSize: 14 * Responsive.getResponsiveText(context),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
