import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/di/modules/network_module.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_event.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_state.dart';
import 'package:myco_flutter/features/company_selector/presentation/pages/sales_inquiry_dialog_page.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/bottom_term_and_condition.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/customotp_bottomsheet.dart';
import 'package:myco_flutter/widgets/custom_checkbox.dart';
import 'package:myco_flutter/widgets/custom_countrycodetextfield.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class SelectCompanyPage extends StatelessWidget {
  const SelectCompanyPage({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: const SafeArea(child: _CompanySearchBody()));
}

class _CompanySearchBody extends StatefulWidget {
  const _CompanySearchBody();

  @override
  State<_CompanySearchBody> createState() => _CompanySearchBodyState();
}

class _CompanySearchBodyState extends State<_CompanySearchBody> {
  PreferenceManager preference = GetIt.I<PreferenceManager>();
  String selectedCountry = 'IND';
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isChecked = false;

  final Map<String, String> countryMap = {
    'IND': '+91',
    'USA': '+1',
    'INA': '+62',
  };

  int _currentStep = 0;

  final TextEditingController _controller = TextEditingController();

  Timer? _debounce;

  // void _onSearchChanged(String value) {
  //   if (_debounce?.isActive ?? false) _debounce!.cancel();

  //   _debounce = Timer(const Duration(milliseconds: 300), () {
  //     if (value.length >= 3) {
  //       context.read<CompanyBloc>().add(SearchCompany(value));
  //     } else {
  //       context.read<CompanyBloc>().add(InitialView());
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // _controller.addListener(() {
    //   _onSearchChanged(_controller.text);
    // });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < 1) {
      setState(() => _currentStep++);
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

  @override
  Widget build(BuildContext buildContext) {
    switch (_currentStep) {
      case 0:
        return _SelectCompanyUi();
      case 1:
        return _LoginUi();
      default:
        return const Text('Unknown step');
    }
  }

  Container _SelectCompanyUi() => Container(
    color: AppTheme.getColor(context).surface,
    padding: EdgeInsets.symmetric(
      horizontal: 0.05 * Responsive.getWidth(context),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(16),
        //   child: TextField(
        //     controller: _controller,
        //     decoration: InputDecoration(
        //       // labelText: LanguageManager().get('search_your_society'),
        //       disabledBorder: const OutlineInputBorder(),
        //       enabledBorder: const OutlineInputBorder(),
        //       border: const OutlineInputBorder(),
        //     ),
        //   ),
        // ),
        SizedBox(height: 0.03 * Responsive.getHeight(context)),
        CustomText(
          'Company Name',
          fontSize: 15 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w600,
          color: AppTheme.getColor(context).onSurfaceVariant,
        ),

        SizedBox(height: 0.01 * Responsive.getHeight(context)),

        // search bar
        MyCoTextfield(
          controller: _controller,
          preFixImage: 'assets/search_society/company_icon.png',
          onChanged: (value) {
            if (value.length >= 3) {
              context.read<CompanyBloc>().add(SearchCompany(value));
            } else {
              context.read<CompanyBloc>().add(InitialView());
            }
          },
          isSuffixIconOn: true,
          hintText: "Enter Company Name",
          hintTextStyle: TextStyle(
            fontSize: 14 * Responsive.getResponsiveText(context),
            color: AppTheme.getColor(context).outline,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Color(0xFF98A2B3), width: 1),
          ),
        ),
        SizedBox(height: 0.025 * Responsive.getHeight(context)),
        Expanded(
          child: BlocBuilder<CompanyBloc, CompanyState>(
            builder: (blocContext, state) {
              if (state is CompanyLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.getColor(context).primary,
                  ),
                );
              } else if (state is CompanyLoaded) {
                if (state.companies.society == null ||
                    state.companies.society!.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Replace with your own image asset path
                          Image.asset(AppAssets.noCompany, height: 180),
                          const SizedBox(height: 20),
                          const CustomText(
                            'Your company is not listed?',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          const CustomText(
                            "If your company doesn't appear in the list, you can request to add it.",
                            fontSize: 14,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (_) => const SalesInquiryForm(),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.getColor(
                                context,
                              ).primary,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            // TODO: replace with actual text
                            child: CustomText(
                              'Request Your Society',
                              // LanguageManager().get('request_your_society'),
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Column(
                  children: [
                    // society list(API call)
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.companies.society!.length,
                        itemBuilder: (_, index) {
                          final company = state.companies.society![index];
                          final isSelected = state.selectedIndex == index;

                          return GestureDetector(
                            onTap: () {
                              // adding index
                              context.read<CompanyBloc>().add(
                                CompanyIndex(index),
                              );
                            },
                            child: Container(
                              width: Responsive.getWidth(context),
                              padding: EdgeInsets.all(
                                12.0 * Responsive.getResponsive(context),
                              ),
                              margin: EdgeInsets.only(
                                bottom: 12 * Responsive.getResponsive(context),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppTheme.getColor(context).outline,
                                ),
                                borderRadius: BorderRadius.circular(
                                  14 * Responsive.getResponsive(context),
                                ),
                                color: isSelected
                                    ? AppTheme.getColor(context).primary
                                    : AppTheme.getColor(context).surface,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // logo circle
                                  CircleAvatar(
                                    backgroundColor: AppTheme.getColor(
                                      context,
                                    ).primary,
                                    radius:
                                        20 * Responsive.getResponsive(context),
                                    child: CircleAvatar(
                                      backgroundColor: AppTheme.getColor(
                                        context,
                                      ).onPrimary,
                                      radius:
                                          17 *
                                          Responsive.getResponsive(context),
                                      child: Center(
                                        child: CustomText(
                                          company.societyName!.substring(0, 1),
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.getColor(
                                            context,
                                          ).primary,
                                          fontSize:
                                              18 *
                                              Responsive.getResponsiveText(
                                                context,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    width: 0.02 * Responsive.getWidth(context),
                                  ),

                                  // name + address
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // name
                                        CustomText(
                                          company.societyName!,
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              16 *
                                              Responsive.getResponsiveText(
                                                context,
                                              ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          color: isSelected
                                              ? AppTheme.getColor(
                                                  context,
                                                ).onPrimary
                                              : AppTheme.getColor(
                                                  context,
                                                ).onSurface,
                                        ), // address
                                        CustomText(
                                          company.societyAddress!,
                                          fontSize:
                                              14 *
                                              Responsive.getResponsiveText(
                                                context,
                                              ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          color: isSelected
                                              ? AppTheme.getColor(
                                                  context,
                                                ).onPrimary
                                              : AppTheme.getColor(
                                                  context,
                                                ).onSurface,
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),

                                  //  Circle to be pending
                                  // Center(
                                  //   child: Container(
                                  //     width:
                                  //         24 *
                                  //         Responsive.getResponsive(context),
                                  //     height:
                                  //         24 *
                                  //         Responsive.getResponsive(context),
                                  //     decoration: BoxDecoration(
                                  //       shape: BoxShape.circle,
                                  //       border: Border.all(
                                  //         color: isSelected
                                  //             ? Colors.transparent
                                  //             : AppColors.gray,
                                  //         width: 2,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // bottom buttons
                    Padding(
                      padding: EdgeInsets.only(
                        top: 14.0 * Responsive.getResponsive(context),
                        bottom: 10.0 * Responsive.getResponsive(context),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: MyCoButton(
                              title: 'Close',
                              boarderRadius:
                                  30 * Responsive.getResponsive(context),
                              width: Responsive.getWidth(context) * .450,
                              backgroundColor: AppColors.white,
                              border: Border.all(
                                color: AppTheme.getColor(context).primary,
                                width: 1,
                              ),
                              textStyle:
                                  MyCoButtonTheme.getWhiteBackgroundTextStyle(
                                    context,
                                  ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: MyCoButton(
                              title: 'Submit',
                              isShadowBottomLeft: true,
                              boarderRadius: 30,
                              width: Responsive.getWidth(context) * .450,
                              onTap: state.selectedIndex >= 0
                                  ? () {
                                      final company = state
                                          .companies
                                          .society![state.selectedIndex];

                                      preference.setCompanyId(
                                        company.societyId.toString(),
                                      );
                                      preference.setCompanyName(
                                        company.societyName.toString(),
                                      );
                                      preference.setCompanyAddress(
                                        company.societyAddress.toString(),
                                      );
                                      preference.setBaseUrl(
                                        company.subDomain.toString(),
                                      );
                                      preference.setCompanyId(
                                        company.societyId.toString(),
                                      );
                                      preference.setCompanyName(
                                        company.societyName.toString(),
                                      );
                                      preference.setCompanyAddress(
                                        company.societyAddress.toString(),
                                      );
                                      preference.setBaseUrl(
                                        company.subDomain.toString(),
                                      );

                                      final companyJson = jsonEncode(
                                        company.toJson(),
                                      );

                                      preference.writeString(
                                        'selectedCompany',
                                        companyJson,
                                      );
                                      final sl = GetIt.instance;
                                      refreshApiServiceCompany(sl);

                                      preference.setLoginSession(true);

                                      dev.log(
                                        "Company ID saved: ${company.societyId}",
                                        name: "CompanyPref",
                                      );

                                      dev.log(
                                        "Company Name saved: ${company.societyName}",
                                        name: "CompanyPref",
                                      );

                                      dev.log(
                                        "Company Address saved: ${company.societyAddress}",
                                        name: "CompanyPref",
                                      );

                                      dev.log(
                                        'Base URL saved: ${company.subDomain}',
                                        name: "CompanyPref",
                                      );

                                      preference.writeString(
                                        'selectedCompany',
                                        companyJson,
                                      );
                                      dev.log(
                                        'Full company JSON saved: $companyJson',
                                        name: "CompanyPref",
                                      );

                                      // context.go('/login');

                                      _nextStep();

                                      /*showModalBottomSheet(
                                        scrollControlDisabledMaxHeightRatio:
                                            0.7 * Responsive.getHeight(context),
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) =>
                                            SelectOtherCompanyScreen(),
                                      );*/
                                    }
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (state is CompanyError) {
                return Center(child: CustomText(state.message));
              }
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Replace with your actual image path
                        Image.asset(AppAssets.searchCompany, height: 180),
                        const SizedBox(height: 20),
                        const CustomText(
                          'Search Your Society',
                          // LanguageManager().get('search_your_society'),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        const CustomText(
                          'Start typing your company name in the box above and select it to continue.',
                          fontSize: 14,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );

  Container _LoginUi() => Container(
    height: 0.8 * Responsive.getHeight(context),
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
          InkWell(
            onTap: _previousStep,
            child: Row(
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
            'Phone number',
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

          CustomText(
            'Email Id',
            fontSize: 16 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w600,
            color: AppTheme.getColor(context).onSurface,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                15 * Responsive.getResponsive(context),
              ),
              border: Border.all(color: AppColors.gray5),
              color: AppTheme.getColor(context).onPrimary,
            ),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Please Enter Email Id',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 20),

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
                  context.push("/dashboard");
                },
                onResend: () {
                  //for here
                  dev.log("Resend OTP");
                  context.pop();
                  context.pop();
                  context.push("/sign-up-form");
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
                borderColor: isChecked ? AppColors.primary : Colors.grey,
                // 🔁 dynamic
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

// Padding(
//                   padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
//                   child: ListView.builder(
//                     itemCount: state.companies.society!.length,
//                     itemBuilder: (_, index) {
//                       final company = state.companies.society![index];
//                       return Card(
//                         color: Colors.grey[100],
//                         elevation: 1,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8),
//                           child: ListTile(
//                             selectedColor: AppColors.primary,
//                             leading: Image.asset(AppAssets.myCoLogo),
//                             title: CustomText(
//                               company.societyName!,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             subtitle: CustomText(
//                               company.societyAddress!,
//                               fontSize: 10,
//                             ),
//                             selected: company == _selectedCompany,
//                             onTap: () {
//                               preference.setCompanyId(
//                                 company.societyId.toString(),
//                               );
//                               preference.setCompanyName(
//                                 company.societyName.toString(),
//                               );
//                               preference.setCompanyAddress(
//                                 company.societyAddress.toString(),
//                               );
//                               preference.setBaseUrl(
//                                 company.subDomain.toString(),
//                               );
//                               preference.setCompanyId(
//                                 company.societyId.toString(),
//                               );
//                               preference.setCompanyName(
//                                 company.societyName.toString(),
//                               );
//                               preference.setCompanyAddress(
//                                 company.societyAddress.toString(),
//                               );
//                               preference.setBaseUrl(
//                                 company.subDomain.toString(),
//                               );

//                               final companyJson = jsonEncode(company.toJson());

//                               preference.writeString(
//                                 'selectedCompany',
//                                 companyJson,
//                               );
//                               // TODO: refreshApiServiceCompany
//                               // refreshApiServiceCompany();

//                               preference.setLoginSession(true);

//                               context.go('/login');

//                               //   setState(() => _selectedCompany = company);
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 );
