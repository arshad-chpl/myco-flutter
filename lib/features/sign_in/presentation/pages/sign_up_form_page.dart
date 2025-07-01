import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:badges/badges.dart' as badges;
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_countrycodetextfield.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_labeled_dropdown.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgWhite,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.white,
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
                    items: [],
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
                    border: Border.all(color: AppColors.gray),
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
                      "assets/sign_in/branch_icon.png",
                      height: 0.025 * getHeight(context),
                      fit: BoxFit.contain,
                    ),
                    border: Border.all(color: AppColors.gray),
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
                      "assets/sign_in/branch_icon.png",
                      height: 0.025 * getHeight(context),
                      fit: BoxFit.contain,
                    ),
                    border: Border.all(color: AppColors.gray),
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
                      "assets/sign_in/branch_icon.png",
                      height: 0.025 * getHeight(context),
                      fit: BoxFit.contain,
                    ),
                    border: Border.all(color: AppColors.gray),
                  ),
                  SizedBox(height: 0.015 * getHeight(context)),
                  LabeledDropdown<String>(
                    border: Border.all(color: AppColors.gray),
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
                      "assets/sign_in/branch_icon.png",
                      height: 0.025 * getHeight(context),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 0.015 * getHeight(context)),
                  LabeledDropdown<String>(
                    border: Border.all(color: AppColors.gray),
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
                      "assets/sign_in/branch_icon.png",
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
                          borderSide: BorderSide(color: AppColors.gray),
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
                          borderSide: BorderSide(color: AppColors.gray),
                          borderRadius: BorderRadius.circular(
                            10 * getResponsive(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.015 * getHeight(context)),
                  Text(
                    "Gender",
                    style: TextStyle(
                      color: AppColors.textGray,
                      fontSize: 16 * getResponsiveText(context),
                      fontWeight: FontWeight.bold,
                    ),
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
                  Text(
                    "Phone Number",
                    style: TextStyle(
                      color: AppColors.textGray,
                      fontSize: 16 * getResponsiveText(context),
                      fontWeight: FontWeight.bold,
                    ),
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
                      border: Border.all(color: AppColors.gray),
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 0.015 * getHeight(context)),
                  MyCoTextfield(
                    hintText: "abc@gmail.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10 * getResponsive(context),
                      ),
                      borderSide: BorderSide(color: AppColors.gray),
                    ),
                    preFixImage: "assets/sign_in/email_icon.png",
                  ),
                  SizedBox(height: 0.015 * getHeight(context)),
                  Row(
                    children: [
                      customCheckbox(
                        value: isChecked,
                        onChanged: (val) {
                          setState(() {
                            isChecked = val;
                          });
                        },
                        borderColor: isChecked
                            ? AppColors.primary
                            : Colors.grey, // 🔁 dynamic
                        activeColor: AppColors.lightPurple,
                        checkColor: AppColors.primary,
                        height: 0.026 * getHeight(context),
                        width: 0.056 * getWidth(context),
                      ),
                      SizedBox(width: 0.015 * getWidth(context)),
                      SizedBox(
                        width: 0.82 * getWidth(context),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 14 * getResponsiveText(context),
                            ),
                            children: [
                              TextSpan(
                                text: "Please confirm that you agree to our ",
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 14 * getResponsiveText(context),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 14 * getResponsiveText(context),
                                ),
                              ),
                              TextSpan(text: ", "),
                              TextSpan(
                                text: "Terms & Conditions",
                                style: TextStyle(color: AppColors.primary),
                              ),
                              TextSpan(
                                text: " & ",
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 14 * getResponsiveText(context),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: "Cancellation & Refund Policy",
                                style: TextStyle(color: AppColors.primary),
                              ),
                              TextSpan(
                                text: ".",
                                style: TextStyle(
                                  color: AppColors.black,
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
                    textStyle:TextStyle(
                      color: AppColors.white,
                      fontSize: 20*getResponsiveText(context),
                      fontWeight: FontWeight.bold
                    ),
                    onTap: () {},
                    title: "Sign Up",
                    boarderRadius: 30 * getResponsive(context),
                    isShadowBottomLeft: true,
                  ),
                  SizedBox(height: 0.1 * getWidth(context)),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?",style: TextStyle(
                          fontSize: 18*getResponsiveText(context),
                          fontWeight: FontWeight.bold,
                          color: AppColors.black
                        ),),
                        Text("Sign in here",style: TextStyle(
                            fontSize: 18*getResponsiveText(context),
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.015*getHeight(context),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget customCheckbox({
  required bool value,
  required Function(bool) onChanged,
  required Color borderColor,
  required Color activeColor,
  required Color checkColor,
  required double height,
  required double width,
}) {
  return GestureDetector(
    onTap: () => onChanged(!value),
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: value ? activeColor : Colors.transparent,
        border: Border.all(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: value ? Icon(Icons.check, size: 18, color: checkColor) : null,
    ),
  );
}
