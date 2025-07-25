import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
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
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

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
      width: Responsive.getWidth(context),
      decoration: BoxDecoration(
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
                      color: AppTheme.getColor(context).onSurface,
                    ),
                    SizedBox(width: 0.05 * Responsive.getWidth(context)),
                    CustomText(
                      LanguageManager().get('select_other_company'),
                      color: AppTheme.getColor(context).onSurface,
                      fontWeight: FontWeight.w600,
                      fontSize: 15 * Responsive.getResponsiveText(context),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0.015 * Responsive.getHeight(context)),
              Center(
                child: Column(
                  children: [
                    CustomText(
                      LanguageManager().get('sign_in'),
                      fontSize: 30 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w900,
                    ),
                    CustomText(
                      '${LanguageManager().get('welcome_to')} ${selectedCompany?.societyName ?? ''}',
                      fontSize: 16 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w600,
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
                  final contactInfo = isEmailLogin
                      ? emailController.text.trim()
                      : phoneController.text.trim();

                  // Empty check
                  if (contactInfo.isEmpty) {
                    final String text = isEmailLogin
                        ? LanguageManager().get('please_enter_email_id')
                        : LanguageManager().get('please_enter_mobile_number');
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(text)));
                    return;
                  }

                  // Email format validation
                  if (isEmailLogin) {
                    final emailRegex = RegExp(
                      r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                    );
                    if (!emailRegex.hasMatch(contactInfo)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            LanguageManager().get('please_enter_email_id'),
                          ),
                        ),
                      );
                      return;
                    }
                  }

                  // Terms and Conditions check
                  if (!isChecked) {
                    Fluttertoast.showToast(
                      msg: LanguageManager().get(
                        'please_agree_to_are_user_policy_to_continue',
                      ),
                    );
                    return;
                  }

                  // Build request model
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

                  // Send OTP event to Bloc
                  context.read<LoginBloc>().add(SendOtpEvent(model: model));
                },
                title: LanguageManager().get('sign_in'),
                boarderRadius: 30 * Responsive.getResponsive(context),
                isShadowBottomLeft: true,
              ),
              SizedBox(height: 0.025 * Responsive.getHeight(context)),
              const DividerWithText(text: 'OR'),
              SizedBox(height: 0.025 * Responsive.getHeight(context)),
              _buildSocialButton(
                context,
                'Google',
                'assets/sign_in/google_logo.png',
              ),
              SizedBox(height: 0.015 * Responsive.getHeight(context)),
              _buildSocialButton(
                context,
                'Apple',
                'assets/sign_in/apple_logo.png',
              ),
              SizedBox(height: 0.025 * Responsive.getHeight(context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    LanguageManager().get('don_t_have_an_account'),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  InkWell(
                    onTap: () {
                      context.go(RoutePaths.signUpForm);
                    },
                    child: CustomText(
                      LanguageManager().get('sign_up_here'),
                      fontSize: 12 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getColor(context).primary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.025 * Responsive.getHeight(context)),
              _buildPolicyAgreement(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    String provider,
    String asset,
  ) {
    String title;

    if (provider == 'Google') {
      title = LanguageManager().get('sign_in_with_google');
    } else if (provider == 'Apple') {
      title = LanguageManager().get('sign_in_with_apple');
    } else {
      title = '';
    }

    return MyCoButton(
      onTap: () {},
      title: title,
      textStyle: TextStyle(
        color: AppTheme.getColor(context).onSurface.withOpacity(0.5),
        fontSize: 20 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w900,
      ),
      image: Image.asset(
        asset,
        fit: BoxFit.contain,
        height: 0.02 * Responsive.getHeight(context),
      ),
      spacing: 10 * Responsive.getResponsive(context),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.getColor(context).primary),
        color: AppTheme.getColor(context).surfaceBright,
        borderRadius: BorderRadius.circular(
          40 * Responsive.getResponsive(context),
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
        checkColor: AppTheme.getColor(context).primary,
        height: 20,
        width: 20,
        unCheckedBackground: AppTheme.getColor(context).surface,
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
                text: '${LanguageManager().get('i_agree_to_fincasys')} ',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              _linkSpan(context, LanguageManager().get('privacy_policy'), VariableBag.URL_PRIVACY + "privacyPolicy.php?app=" + 'Myco'),
              const TextSpan(text: ', '),
              _linkSpan(context, LanguageManager().get('terms_and_condition'), VariableBag.URL_PRIVACY + "termsConditions.php?app=" + 'MyCo'),
              TextSpan(text: ' ${LanguageManager().get('and')} '),
              _linkSpan(
                context,
                LanguageManager().get('cancellation_refund_policy'), VariableBag.CP_URL ,
              ),
              const TextSpan(text: '.'),
            ],
          ),
        ),
      ),
    ],
  );

  TextSpan _linkSpan(BuildContext context, String text, String url) => TextSpan(
    text: text,
    style: TextStyle(color: AppTheme.getColor(context).primary),
    recognizer: TapGestureRecognizer()
      ..onTap = () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => BottomTermAndCondition(url : url),
      ),
  );
}

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({required this.text, super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      const Expanded(child: Divider(color: AppColors.gray5, thickness: 2)),
      SizedBox(width: 0.018 * Responsive.getHeight(context)),
      Text(text),
      SizedBox(width: 0.018 * Responsive.getHeight(context)),
      const Expanded(child: Divider(color: AppColors.gray5, thickness: 2)),
    ],
  );
}

class _EmailInput extends StatelessWidget {
  final TextEditingController emailController;

  const _EmailInput({required this.emailController});

  @override
  Widget build(BuildContext context) => NewTextField(
    label: LanguageManager().get('email_id'),
    hintText: LanguageManager().get('please_enter_email_id'),
    controller: emailController,
    keyboardType: TextInputType.emailAddress,
    isRequired: true,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return LanguageManager().get('please_enter_email_id');
      }
      final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
      if (!emailRegex.hasMatch(value)) {
        return LanguageManager().get('please_enter_email_id');
      }
      return null;
    },
  );
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
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(
        LanguageManager().get('phone_number'),
        fontWeight: FontWeight.w600,
      ),
      PhoneNumberField(
        selectedCountry: selectedCountry!,
        countries: countryMap.keys.toList(),
        onCountryChanged: onCountryChanged,
        countryDialCodes: countryMap,
        phoneController: phoneController,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15 * Responsive.getResponsive(context),
          ),
          border: Border.all(color: AppColors.gray5),
        ),
      ),
    ],
  );
}
