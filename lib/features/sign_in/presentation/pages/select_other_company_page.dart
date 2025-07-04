import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_countrycodetextfield.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class SelectOtherCompanyPage extends StatefulWidget {
  const SelectOtherCompanyPage({super.key});

  @override
  State<SelectOtherCompanyPage> createState() => _SelectOtherCompanyPageState();
}

class _SelectOtherCompanyPageState extends State<SelectOtherCompanyPage> {
  String selectedCountry = 'IND';
  final TextEditingController phoneController = TextEditingController();
  bool isChecked = false;

  final Map<String, String> countryMap = {
    'IND': '+91',
    'USA': '+1',
    'INA': '+62',
  };

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            scrollControlDisabledMaxHeightRatio: 0.7 * getHeight(context),
            backgroundColor: Colors.transparent,
            context: context,
            isScrollControlled: true,
            builder: (context) => Container(
              height: 0.7 * getHeight(context),
              width: getWidth(context),
              decoration: BoxDecoration(
                color: AppColors.bgWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40 * getResponsive(context)),
                  topRight: Radius.circular(40 * getResponsive(context)),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 30 * getResponsive(context),
                  right: 30 * getResponsive(context),
                  top: 50 * getResponsive(context),
                  bottom: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "visit/sign_in/back_arrow.png",
                          height: 0.015 * getHeight(context),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 0.05 * getWidth(context)),
                        Text(
                          "Select Other Company",
                          style: TextStyle(
                            color: AppColors.textGray,
                            fontWeight: FontWeight.w800,
                            fontSize: 18 * getResponsiveText(context),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.015 * getHeight(context)),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 30 * getResponsiveText(context),
                              fontWeight: FontWeight.w900,
                              color: AppColors.textGray,
                            ),
                          ),
                          Text(
                            "Welcome To Delta Corporation",
                            style: TextStyle(
                              fontSize: 20 * getResponsiveText(context),
                              fontWeight: FontWeight.w800,
                              color: AppColors.textGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 0.015 * getHeight(context)),
                    Text("Phone number",style: TextStyle(
                      fontSize: 16 * getResponsiveText(context),
                      fontWeight: FontWeight.w600,
                      color: AppColors.textGray,
                    ),),
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
                        borderRadius: BorderRadius.circular(15*getResponsive(context)),
                        border: Border.all(color: AppColors.gray5),
                        color: AppColors.white
                      ),
                    ),
                    SizedBox(height: 0.015 * getHeight(context)),
                    MyCoButton(
                      onTap: () {},
                      textStyle: TextStyle(
                        color: AppColors.white,
                        fontSize: 18*getResponsiveText(context),
                        fontWeight: FontWeight.bold
                      ),
                      title: "Sign in",
                      boarderRadius: 30*getResponsive(context),
                      // isShadowBottomRight: true,
                      isShadowBottomLeft: true,
                    ),
                    SizedBox(height: 0.025 * getHeight(context)),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            height: 10,
                            color: AppColors.gray5,
                            thickness: 2,
                          ),
                        ),
                        SizedBox(width: 0.018 * getHeight(context)),
                        Text("OR"),
                        SizedBox(width: 0.018 * getHeight(context)),
                        Expanded(
                          child: Divider(
                            height: 10,
                            color: AppColors.gray5,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.025 * getHeight(context)),
                    MyCoButton(
                      onTap: () {},
                      title: "Sign In with Google",
                      textStyle: TextStyle(
                        color: AppColors.black.withOpacity(0.5),
                        fontSize: 20 * getResponsiveText(context),
                        fontWeight: FontWeight.w900,
                      ),
                      image: Image.asset(
                        "visit/sign_in/google_logo.png",
                        fit: BoxFit.contain,
                        height: 0.02 * getHeight(context),
                      ),
                      spacing: 10 * getResponsive(context),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(
                          40 * getResponsive(context),
                        ),
                      ),
                    ),
                    SizedBox(height: 0.015 * getHeight(context)),
                    MyCoButton(
                      onTap: () {},
                      title: "Sign In with Apple",
                      textStyle: TextStyle(
                        color: AppColors.black.withOpacity(0.5),
                        fontSize: 20 * getResponsiveText(context),
                        fontWeight: FontWeight.w900,
                      ),
                      image: Image.asset(
                        "visit/sign_in/apple_logo.png",
                        fit: BoxFit.contain,
                        height: 0.02 * getHeight(context),
                      ),
                      spacing: 10 * getResponsive(context),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          40 * getResponsive(context),
                        ),
                      ),
                    ),
                    SizedBox(height: 0.025 * getHeight(context)),
                    Center(
                      child: RichText(
                        text:TextSpan(
                          children: [
                            TextSpan(text: "Don’t have an account? ",style: TextStyle(
                              color: AppColors.black,
                              fontSize: 14*getResponsiveText(context),
                            ),),
                            TextSpan(text: "Sign Up Here",style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 14*getResponsiveText(context),
                            ),)
                          ]
                        )
                      ),
                    ),
                    SizedBox(height: 0.025 * getHeight(context)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customCheckbox(
                          value: isChecked,
                          onChanged: (val) {
                            setState(() {
                              isChecked = val;
                            });
                          },
                          borderColor: isChecked ? AppColors.primary : Colors.grey, // 🔁 dynamic
                          activeColor: AppColors.lightPurple,
                          checkColor: AppColors.primary,
                          height: 0.026*getHeight(context),
                          width: 0.056*getWidth(context),
                        ),
                        SizedBox(width: 0.015*getWidth(context),),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 14*getResponsiveText(context),
                              ),
                              children: [
                                TextSpan(
                                    text:
                                    "Please confirm that you agree to our ",style:
                                TextStyle(color: AppColors.black,fontSize: 14*getResponsiveText(context),fontWeight: FontWeight.w600),),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style:
                                  TextStyle(color: AppColors.primary,fontSize: 14*getResponsiveText(context),),
                                ),
                                TextSpan(text: ", "),
                                TextSpan(
                                  text: "Terms & Conditions",
                                  style:
                                  TextStyle(color: AppColors.primary),
                                ),
                                TextSpan(text: " & ",style:
                                TextStyle(color: AppColors.black,fontSize: 14*getResponsiveText(context),fontWeight: FontWeight.w600),),
                                TextSpan(
                                  text: "Cancellation & Refund Policy",
                                  style:
                                  TextStyle(color: AppColors.primary),
                                ),
                                TextSpan(text: ".",style:
                                TextStyle(color: AppColors.black,fontSize: 14*getResponsiveText(context),fontWeight: FontWeight.w900),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: Text("open"),
      ),
    ),
  );
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
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: value
          ? Icon(
        Icons.check,
        size: 18,
        color: checkColor,
      )
          : null,
    ),
  );
}