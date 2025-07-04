import 'dart:developer' as dev;

import 'package:badges/badges.dart' as badges;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/bottom_get_started.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/bottom_term_and_condition.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/customotp_bottomsheet.dart';
import 'package:myco_flutter/widgets/custom_checkbox.dart';
import 'package:myco_flutter/widgets/custom_countrycodetextfield.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_labeled_dropdown.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';
import 'package:myco_flutter/widgets/custom_text_radio_button.dart';

class SignupFormPage extends StatefulWidget {
  const SignupFormPage({super.key});

  @override
  State<SignupFormPage> createState() => _SignupFormPageState();
}

class _SignupFormPageState extends State<SignupFormPage> {
  String? selectedBranch;
  String selectedGender = '';
  bool gender = false;
  String selectedCountry = 'IND';
  bool isChecked = false;
  final TextEditingController phoneController = TextEditingController();
  final Map<String, String> countryMap = {
    'IND': '+91',
    'USA': '+1',
    'INA': '+62',
  };
  String? _selectedValue;

  final List<String> _dropdownItems = ['Option 1', 'Option 2', 'Option 3'];

  final List<String> leaveTypes = ['Paid leave', 'Unpaid leave', 'Casual leave'];
  String? selectedLeaveType;
  @override
  Widget build(BuildContext context) => Container(
      color: AppTheme.getColor(context).surface,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppTheme.getColor(context).surface,
          body: Padding(
            padding: EdgeInsets.only(
              left: 20 * getResponsive(context),
              right: 20 * getResponsive(context),
              top: 20 * getResponsive(context),
              bottom: 20 * getResponsive(context),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: badges.Badge(
                      badgeStyle: badges.BadgeStyle(
                        badgeColor: Colors.transparent,
                      ),
                      position: badges.BadgePosition.bottomEnd(
                        bottom: -22 * getResponsive(context),
                        end: -15 * getResponsive(context),
                      ),
                      badgeContent: Image.asset(
                        "assets/sign_in/camera_icon.png",
                        fit: BoxFit.contain,
                        height: 0.04 * getHeight(context),
                      ),
                      child: Image.asset(
                        "assets/sign_in/contact_frame.png",
                        fit: BoxFit.contain,
                        height: 0.11 * getHeight(context),
                      ),
                    ),
                  ),
                  LabeledDropdown<String>(
                    label: "Select Branch",
                    isRequired: true,
                    items: _dropdownItems,
                    selectedItem: selectedBranch,
                    itemToString: (item) => item,
                    onChanged: (val, index) {
                      setState(() {
                        selectedBranch = val;
                      });
                    },
                    prefix: Image.asset(
                      "assets/sign_in/branch_icon.png",
                      height: 0.025 * getHeight(context),
                      fit: BoxFit.contain,
                    ),
                    border: Border.all(color: AppTheme.getColor(context).outline,
                  ),
                  ),
                  SizedBox(height: 0.015 * getHeight(context)),
                  LabeledDropdown<String>(
                    label: "Select Department",
                    isRequired: false,
                    items: [],
                    selectedItem: selectedBranch,
                    itemToString: (item) => item,
                    onChanged: (val, index) {
                      setState(() {
                        selectedBranch = val;
                      });
                    },
                    prefix: Image.asset(
                      "assets/sign_in/department_icon.png",
                      height: 0.025 * getHeight(context),
                      fit: BoxFit.contain,
                    ),
                    border: Border.all(color: AppTheme.getColor(context).outline),
                  ),
                  SizedBox(height: 0.015 * getHeight(context)),
                  LabeledDropdown<String>(
                    label: "Select Sub Department",
                    isRequired: false,
                    items: [],
                    selectedItem: selectedBranch,
                    itemToString: (item) => item,
                    onChanged: (val, index) {
                      setState(() {
                        selectedBranch = val;
                      });
                    },
                    prefix: Image.asset(
                      "assets/sign_in/sub_department_icon.png",
                      height: 0.025 * getHeight(context),
                      fit: BoxFit.contain,
                    ),
                    border: Border.all(color: AppTheme.getColor(context).outline),
                  ),
                  SizedBox(height: 0.015 * getHeight(context)),
                  LabeledDropdown<String>(
                    label: "Shift Time",
                    isRequired: false,
                    items: [],
                    selectedItem: selectedBranch,
                    itemToString: (item) => item,
                    onChanged: (val, index) {
                      setState(() {
                        selectedBranch = val;
                      });
                    },
                    prefix: Image.asset(
                      "assets/sign_in/clock_icon.png",
                      height: 0.025 * getHeight(context),
                      fit: BoxFit.contain,
                    ),
                    border: Border.all(color: AppTheme.getColor(context).outline),
                  ),
                  SizedBox(height: 0.015 * getHeight(context)),
                  LabeledDropdown<String>(
                    border: Border.all(color: AppTheme.getColor(context).outline),
                    label: "Designation",
                    isRequired: false,
                    items: [],
                    selectedItem: selectedBranch,
                    itemToString: (item) => item,
                    onChanged: (val, index) {
                      setState(() {
                        selectedBranch = val;
                      });
                    },
                    prefix: Image.asset(
                      "assets/sign_in/designation_icon.png",
                      height: 0.025 * getHeight(context),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 0.015 * getHeight(context)),
                  LabeledDropdown<String>(
                    border: Border.all(color: AppTheme.getColor(context).outline),
                    label: "Joining Date",
                    isRequired: false,
                    items: [],
                    selectedItem: selectedBranch,
                    itemToString: (item) => item,
                    onChanged: (val, index) {
                      setState(() {
                        selectedBranch = val;
                      });
                    },
                    prefix: Image.asset(
                      "assets/sign_in/joining_date_icon.png",
                      height: 0.025 * getHeight(context),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 0.015 * getHeight(context)),
                  Row(
                    children: [
                      LabeledTextField(
                        label: "First Name",
                        hint: "First Name",
                        // controller: _firstNameController,
                        validator: (val) =>
                        val == null || val.isEmpty ? "Required" : null,
                        textInputType: TextInputType.name,
                        widthFactor: 0.42 * getWidth(context),
                        textFieldHeight: 0.0165 * getHeight(context),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.getColor(context).outline),
                          borderRadius: BorderRadius.circular(
                            10 * getResponsive(context),
                          ),
                        ),
                      ),
                      Spacer(),
                      LabeledTextField(
                        label: "Last Name",
                        hint: "Last Name",
                        // controller: _firstNameController,
                        validator: (val) =>
                            val == null || val.isEmpty ? "Required" : null,
                        textInputType: TextInputType.name,
                        widthFactor: 0.42 * getWidth(context),
                        textFieldHeight: 0.0165 * getHeight(context),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.getColor(context).outline),
                          borderRadius: BorderRadius.circular(
                            10 * getResponsive(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.015 * getHeight(context)),
                  CustomText(
                    "Gender",
                      color: AppTheme.getColor(context).onSurface,
                      fontSize: 16 * getResponsiveText(context),
                      fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 0.005 * getHeight(context)),
                  Row(
                    children: [
                      CustomTextRadioButton(
                        gender: "MALE",
                        selectedGender: selectedGender,
                        onSelect: (val) {
                          setState(() {
                            selectedGender = val;
                          });
                        },
                        height: 0.063 * getHeight(context),
                        width: 0.43 * getWidth(context),
                      ),
                      Spacer(),
                      CustomTextRadioButton(
                        gender: "FEMALE",
                        selectedGender: selectedGender,
                        onSelect: (val) {
                          setState(() {
                            selectedGender = val;
                          });
                        },
                        height: 0.06 * getHeight(context),
                        width: 0.42 * getWidth(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.015 * getHeight(context)),
                  CustomText(
                    "Phone Number",
                      color: AppTheme.getColor(context).onSurface,
                      fontSize: 16 * getResponsiveText(context),
                      fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 0.005 * getHeight(context)),
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
                        15 * getResponsive(context),
                      ),
                      border: Border.all(color: AppTheme.getColor(context).outline),
                      color: AppTheme.getColor(context).onPrimary,
                    ),
                  ),
                  SizedBox(height: 0.015 * getHeight(context)),
                  MyCoTextfield(
                    hintText: "abc@gmail.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10 * getResponsive(context),
                      ),
                      borderSide: BorderSide(color: AppTheme.getColor(context).outline),
                    ),
                    preFixImage: "assets/sign_in/email_icon.png",
                  ),
                  SizedBox(height: 0.015 * getHeight(context)),
                  Row(
                    children: [
                      CustomCheckbox(
                        value: isChecked,
                        onChanged: (val) {
                          setState(() {
                            isChecked = val;
                          });
                        },
                        borderColor: isChecked
                            ? AppTheme.getColor(context).primary
                            : AppTheme.getColor(context).primary, // 🔁 dynamic
                        activeColor: AppTheme.getColor(context).primaryContainer,
                        checkColor: AppTheme.getColor(context).primary,
                        height: 0.026 * getHeight(context),
                        width: 0.056 * getWidth(context),
                        unCheckedBackground: AppTheme.getColor(context).primaryContainer
                      ),
                      SizedBox(width: 0.015 * getWidth(context)),
                      SizedBox(
                        width: 0.82 * getWidth(context),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: AppTheme.getColor(context).onSurface,
                              fontSize: 14 * getResponsiveText(context),
                            ),
                            children: [
                              TextSpan(
                                text: "Please confirm that you agree to our ",
                                style: TextStyle(
                                  color: AppTheme.getColor(context).onSurface,
                                  fontSize: 14 * getResponsiveText(context),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(
                                  color: AppTheme.getColor(context).primary,
                                  fontSize: 14 * getResponsiveText(context),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (_) => BottomTermAndCondition()
                                    );
                                  },
                              ),
                              TextSpan(text: ", "),
                              TextSpan(
                                text: "Terms & Conditions",
                                style: TextStyle(color: AppTheme.getColor(context).primary),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (_) => BottomTermAndCondition()
                                    );
                                  },
                              ),
                              TextSpan(
                                text: " & ",
                                style: TextStyle(
                                  color: AppTheme.getColor(context).onSurface,
                                  fontSize: 14 * getResponsiveText(context),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: "Cancellation & Refund Policy",
                                style: TextStyle(color: AppTheme.getColor(context).primary),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (_) => BottomTermAndCondition()
                                    );
                                  },
                              ),
                              TextSpan(
                                text: ".",
                                style: TextStyle(
                                  color: AppTheme.getColor(context).onSurface,
                                  fontSize: 14 * getResponsiveText(context),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.1 * getWidth(context)),
                  MyCoButton(
                    textStyle: TextStyle(
                      color: AppTheme.getColor(context).onPrimary,
                      fontSize: 20 * getResponsiveText(context),
                      fontWeight: FontWeight.bold,
                    ),
                    onTap: () {
                      showCustomEmailVerificationSheet(
                            imageUrl: 'assets/sign_in/email.png',
                            imageHeight: 0.035 * getHeight(context),
                            imageWidth: 0.09 * getWidth(context),
                            // isDialog: true,
                            context: context,
                            title: 'Email Verification Sent!',
                            description:
                                'A verification code will be sent to the email Hello@work.com for your account verification process.',
                            emailAddress: "example@example.com",
                            onSubmit: (String otp) {
                              dev.log("OTP submitted: $otp");
                              // context.pop();
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: AppTheme.getColor(context).onPrimary,
                                  builder: (context) => BottomGetStarted()
                              );
                            },
                            onResend: () {
                              dev.log("Resend OTP");
                            },
                            onVerifyButtonPressed: () {
                              dev.log("Verify button pressed");
                              context.pop();
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: AppTheme.getColor(context).onPrimary,
                                  builder: (context) => BottomGetStarted()
                              );
                            },
                            length: 6,
                          );
                    },
                    title: "Sign Up",
                    boarderRadius: 30 * getResponsive(context),
                    isShadowBottomLeft: true,
                  ),
                  SizedBox(height: 0.1 * getWidth(context)),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          "Already have an account?",

                            fontSize: 18 * getResponsiveText(context),
                            fontWeight: FontWeight.bold,
                            color: AppTheme.getColor(context).onSurface,

                        ),
                        CustomText(
                          "Sign in here",

                            fontSize: 18 * getResponsiveText(context),
                            fontWeight: FontWeight.bold,
                            color: AppTheme.getColor(context).primary,

                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.015 * getHeight(context)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
}
