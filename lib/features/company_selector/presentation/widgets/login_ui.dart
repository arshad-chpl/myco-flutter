import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/request_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/domain/entites/company_response_entity.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/login/login_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/login/login_event.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/bottom_term_and_condition.dart';
import 'package:myco_flutter/widgets/custom_checkbox.dart';
import 'package:myco_flutter/widgets/custom_countrycodetextfield.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class LoginUi extends StatelessWidget {
  final VoidCallback previousStep;
  final VoidCallback nextStep;
  final String? selectedCountry;
  final Map<String, String> countryMap;
  final Function(String?, int) onCountryChanged;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final bool isChecked;
  final Function(bool) onCheckChanged;
  final SocietyEntity? selectedCompany;

  const LoginUi({
    required this.previousStep,
    required this.nextStep,
    required this.selectedCountry,
    required this.countryMap,
    required this.onCountryChanged,
    required this.phoneController,
    required this.emailController,
    required this.isChecked,
    required this.onCheckChanged,
    required this.selectedCompany,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEmailLogin = selectedCompany?.loginVia == '1';

    return Container(
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
        padding: EdgeInsets.symmetric(
          horizontal: 30 * Responsive.getResponsive(context),
          vertical: 30,
        ).copyWith(top: 50 * Responsive.getResponsive(context)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: previousStep,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/sign_in/back_arrow.png',
                      height: 0.015 * Responsive.getHeight(context),
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 0.05 * Responsive.getWidth(context)),
                    CustomText(
                      'Select Other Company',
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
                  children: [
                    CustomText(
                      'Sign in',
                      fontSize: 30 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w900,
                    ),
                    CustomText(
                      'Welcome to ${selectedCompany?.societyName ?? "Your Company"}',
                      fontSize: 20 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w800,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0.015 * Responsive.getHeight(context)),
              isEmailLogin
                  ? _EmailInput(emailController: emailController)
                  : _PhoneInput(
                      selectedCountry: selectedCountry,
                      countryMap: countryMap,
                      onCountryChanged: onCountryChanged,
                      phoneController: phoneController,
                    ),
              const SizedBox(height: 20),
              MyCoButton(
                onTap: () {
                  final contactInfo = isEmailLogin ? emailController.text : phoneController.text;

                  if (contactInfo.isEmpty) {
                    final String text = isEmailLogin ? 'Please enter your Email Address' : 'Please enter your Phone Number';
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
                    return;
                  }

                  if (isEmailLogin && !_isValidEmail(contactInfo)) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a valid Email Address')));
                    return;
                  }

                  if (!isChecked) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please agree to the terms and conditions to continue.')));
                    return;
                  }

                  final model = RequestOtpRequestModel(
                    societyId: selectedCompany?.societyId.toString() ?? '',
                    countryCode: countryMap[selectedCountry] ?? '',
                    otpType: isEmailLogin ? '2' : '0',
                    userMobile: contactInfo,
                    isFirebase: true,
                    userMacAddress: '',
                    loginVia: selectedCompany?.loginVia ?? '1',
                    languageId: '1',
                  );
                  // Dispatch event to the LoginBloc to send the OTP
                  context.read<LoginBloc>().add(SendOtpEvent(model: model));
                },
                title: 'Sign in',
                boarderRadius: 30 * Responsive.getResponsive(context),
                isShadowBottomLeft: true,
              ),
              SizedBox(height: 0.025 * Responsive.getHeight(context)),
              // ... Social Buttons and other UI elements
              _buildPolicyAgreement(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPolicyAgreement(BuildContext context) => Row(
        children: [
          CustomCheckbox(
            value: isChecked,
            onChanged: onCheckChanged,
            borderColor: isChecked ? AppColors.primary : Colors.grey,
            activeColor: AppTheme.getColor(context).primaryContainer,
            checkColor: AppTheme.getColor(context).primary, height: 20, width: 20, unCheckedBackground: AppTheme.getColor(context).surface,
          ),
          SizedBox(width: 0.015 * Responsive.getWidth(context)),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: AppTheme.getColor(context).onSurface, fontSize: 14 * Responsive.getResponsiveText(context)),
                children: [
                  const TextSpan(text: 'Please confirm that you agree to our ', style: TextStyle(fontWeight: FontWeight.w600)),
                  _linkSpan(context, 'Privacy Policy'),
                  const TextSpan(text: ', '),
                  _linkSpan(context, 'Terms & Conditions'),
                  const TextSpan(text: ' & '),
                  _linkSpan(context, 'Cancellation & Refund Policy'),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
          ),
        ],
      );

  TextSpan _linkSpan(BuildContext context, String text) => TextSpan(
        text: text,
        style: TextStyle(color: AppTheme.getColor(context).primary),
        recognizer: TapGestureRecognizer()
          ..onTap = () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => const BottomTermAndCondition(),
              ),
      );

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailRegex.hasMatch(email);
  }
}

class _EmailInput extends StatelessWidget {
  final TextEditingController emailController;
  const _EmailInput({required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText('Email Id', fontWeight: FontWeight.w600),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15 * Responsive.getResponsive(context)),
            border: Border.all(color: AppColors.gray5),
          ),
          child: TextField(
            controller: emailController,
            decoration: const InputDecoration(hintText: 'Please Enter Email Id', border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}

class _PhoneInput extends StatelessWidget {
  final String? selectedCountry;
  final Map<String, String> countryMap;
  final Function(String?, int) onCountryChanged;
  final TextEditingController phoneController;

  const _PhoneInput({
    required this.selectedCountry,
    required this.countryMap,
    required this.onCountryChanged,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText('Phone number', fontWeight: FontWeight.w600),
        PhoneNumberField(
          selectedCountry: selectedCountry!,
          countries: countryMap.keys.toList(),
          onCountryChanged: onCountryChanged,
          countryDialCodes: countryMap,
          phoneController: phoneController,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15 * Responsive.getResponsive(context)),
            border: Border.all(color: AppColors.gray5),
          ),
        ),
      ],
    );
  }
}
