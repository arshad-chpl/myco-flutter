import 'dart:developer' as dev;

import 'package:badges/badges.dart' as badges;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/bottom_get_started.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/bottom_term_and_condition.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/customotp_bottomsheet.dart';
import 'package:myco_flutter/widgets/big_textfield.dart';
import 'package:myco_flutter/widgets/custom_checkbox.dart';
import 'package:myco_flutter/widgets/custom_countrycodetextfield.dart';
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

  final List<String> leaveTypes = [
    'Paid leave',
    'Unpaid leave',
    'Casual leave',
  ];
  String? selectedLeaveType;
  @override
  Widget build(BuildContext context) => Container(
    color: AppTheme.getColor(context).surface,
    child: SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.getColor(context).surface,
        body: Padding(
          padding: EdgeInsets.only(
            left: 20 * Responsive.getResponsive(context),
            right: 20 * Responsive.getResponsive(context),
            top: 5 * Responsive.getResponsive(context),
            bottom: 20 * Responsive.getResponsive(context),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0.05*Responsive.getHeight(context),),
                Center(
                  child: badges.Badge(
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: Colors.transparent,
                    ),
                    position: badges.BadgePosition.bottomEnd(
                      bottom: -22 * Responsive.getResponsive(context),
                      end: -15 * Responsive.getResponsive(context),
                    ),
                    badgeContent: Image.asset(
                      "assets/sign_in/camera_icon.png",
                      fit: BoxFit.contain,
                      height: 0.04 * Responsive.getHeight(context),
                    ),
                    child: Image.asset(
                      "assets/sign_in/contact_frame.png",
                      fit: BoxFit.contain,
                      height: 0.11 * Responsive.getHeight(context),
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
                    height: 0.025 * Responsive.getHeight(context),
                    fit: BoxFit.contain,
                  ),
                  border: Border.all(color: AppTheme.getColor(context).outline),
                ),
                SizedBox(height: 0.015 * Responsive.getHeight(context)),
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
                    height: 0.025 * Responsive.getHeight(context),
                    fit: BoxFit.contain,
                  ),
                  border: Border.all(color: AppTheme.getColor(context).outline),
                ),
                SizedBox(height: 0.015 * Responsive.getHeight(context)),
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
                    height: 0.025 * Responsive.getHeight(context),
                    fit: BoxFit.contain,
                  ),
                  border: Border.all(color: AppTheme.getColor(context).outline),
                ),
                SizedBox(height: 0.015 * Responsive.getHeight(context)),
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
                    height: 0.025 * Responsive.getHeight(context),
                    fit: BoxFit.contain,
                  ),
                  border: Border.all(color: AppTheme.getColor(context).outline),
                ),
                SizedBox(height: 0.015 * Responsive.getHeight(context)),
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
                    height: 0.025 * Responsive.getHeight(context),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 0.015 * Responsive.getHeight(context)),
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
                    height: 0.025 * Responsive.getHeight(context),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 0.015 * Responsive.getHeight(context)),
                Row(
                  children: [
                    LabeledTextField(
                      label: "First Name",
                      hint: "First Name",
                      textAlignment: TextAlign.start,
                      // controller: _firstNameController,
                      validator: (val) =>
                          val == null || val.isEmpty ? "Required" : null,
                      textInputType: TextInputType.name,
                      widthFactor: 0.43 * Responsive.getWidth(context),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppTheme.getColor(context).outline,
                        ),
                        borderRadius: BorderRadius.circular(
                          10 * Responsive.getResponsive(context),
                        ),
                      ),
                      textFieldHeight: 0.063 * Responsive.getHeight(context),
                      typingtextStyle: TextStyle(
                        color: AppTheme.getColor(context).onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    LabeledTextField(
                      typingtextStyle: TextStyle(
                        color: AppTheme.getColor(context).onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                      label: "Last Name",
                      hint: "Last Name",
                      textAlignment: TextAlign.start,
                      // controller: _firstNameController,
                      validator: (val) =>
                          val == null || val.isEmpty ? "Required" : null,
                      textInputType: TextInputType.name,
                      widthFactor: 0.43 * Responsive.getWidth(context),
                      textFieldHeight: 0.063 * Responsive.getHeight(context),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppTheme.getColor(context).outline,
                        ),
                        borderRadius: BorderRadius.circular(
                          10 * Responsive.getResponsive(context),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.015 * Responsive.getHeight(context)),
                CustomText(
                  "Gender",
                  color: AppTheme.getColor(context).onSurfaceVariant,
                  fontSize: 16 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 0.005 * Responsive.getHeight(context)),
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
                      height: 0.063 * Responsive.getHeight(context),
                      width: 0.43 * Responsive.getWidth(context),
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
                      height: 0.063 * Responsive.getHeight(context),
                      width: 0.43 * Responsive.getWidth(context),
                    ),
                  ],
                ),
                SizedBox(height: 0.015 * Responsive.getHeight(context)),
                CustomText(
                  "Phone Number",
                  color: AppTheme.getColor(context).onSurfaceVariant,
                  fontSize: 16 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 0.005 * Responsive.getHeight(context)),
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
                    border: Border.all(
                      color: AppTheme.getColor(context).outline,
                    ),
                    color: AppTheme.getColor(context).onPrimary,
                  ),
                ),
                SizedBox(height: 0.015 * Responsive.getHeight(context)),
                MyCoTextfield(
                  textAlignment: TextAlign.start,
                  hintText: "abc@gmail.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10 * Responsive.getResponsive(context),
                    ),
                    borderSide: BorderSide(
                      color: AppTheme.getColor(context).outline,
                    ),
                  ),
                  preFixImage: "assets/sign_in/email_icon.png",
                  prefixIconConstraints: BoxConstraints(
                    minHeight: 0.02 * Responsive.getHeight(context),
                    minWidth: 0.11 * Responsive.getWidth(context),
                  ),
                ),
                SizedBox(height: 0.015 * Responsive.getHeight(context)),
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
                      height: 0.026 * Responsive.getHeight(context),
                      width: 0.056 * Responsive.getWidth(context),
                      unCheckedBackground: AppTheme.getColor(
                        context,
                      ).primaryContainer,
                    ),
                    SizedBox(width: 0.015 * Responsive.getWidth(context)),
                    SizedBox(
                      width: 0.82 * Responsive.getWidth(context),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: AppTheme.getColor(context).onSurface,
                            fontSize:
                                14 * Responsive.getResponsiveText(context),
                          ),
                          children: [
                            TextSpan(
                              text: "Please confirm that you agree to our ",
                              style: TextStyle(
                                color: AppTheme.getColor(context).onSurface,
                                fontSize:
                                    14 * Responsive.getResponsiveText(context),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(
                                color: AppTheme.getColor(context).primary,
                                fontSize:
                                    14 * Responsive.getResponsiveText(context),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (_) => BottomTermAndCondition(url : 'url'),
                                  );
                                },
                            ),
                            TextSpan(text: ", "),
                            TextSpan(
                              text: "Terms & Conditions",
                              style: TextStyle(
                                color: AppTheme.getColor(context).primary,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (_) => BottomTermAndCondition(url : 'url'),
                                  );
                                },
                            ),
                            TextSpan(
                              text: " & ",
                              style: TextStyle(
                                color: AppTheme.getColor(context).onSurface,
                                fontSize:
                                    14 * Responsive.getResponsiveText(context),
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
                                    builder: (_) => BottomTermAndCondition(url : 'url'),
                                  );
                                },
                            ),
                            TextSpan(
                              text: ".",
                              style: TextStyle(
                                color: AppTheme.getColor(context).onSurface,
                                fontSize:
                                    14 * Responsive.getResponsiveText(context),
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.1 * Responsive.getWidth(context)),
                MyCoButton(
                  textStyle: TextStyle(
                    color: AppTheme.getColor(context).onPrimary,
                    fontSize: 20 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: () {
                    showCustomEmailVerificationSheet(
                      imageUrl: 'assets/sign_in/email.png',
                      imageHeight: 0.035 * Responsive.getHeight(context),
                      imageWidth: 0.09 * Responsive.getWidth(context),
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
                          builder: (context) => BottomGetStarted(),
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
                          builder: (context) => BottomGetStarted(),
                        );
                      },
                      length: 6,
                    );
                  },
                  title: "Sign Up",
                  boarderRadius: 30 * Responsive.getResponsive(context),
                  isShadowBottomLeft: true,
                ),
                SizedBox(height: 0.1 * Responsive.getWidth(context)),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        "Already have an account?",

                        fontSize: 18 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.bold,
                        color: AppTheme.getColor(context).onSurface,
                      ),
                      CustomText(
                        "Sign in here",

                        fontSize: 18 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.bold,
                        color: AppTheme.getColor(context).primary,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0.015 * Responsive.getHeight(context)),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
