import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/company_selector/data/models/society_response_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/verify_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/login/login_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/login/login_event.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/login/login_state.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/customotp_bottomsheet.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class OtpVerificationUi extends StatelessWidget {
  final String contactValue;
  final bool isEmail;
  final CommonResponse? otpResponse;
  final SocietyModel? selectedCompany;
  final int length;
  final void Function(String otp) onSubmit;
  final VoidCallback previousStep;
  final VoidCallback onResend;
  final VoidCallback onEmailOtp;
  final VoidCallback onCallOtp;

  const OtpVerificationUi({
    super.key,
    required this.otpResponse,
    required this.selectedCompany,
    required this.contactValue,
    required this.onSubmit,
    required this.previousStep,
    required this.onResend,
    required this.onEmailOtp,
    required this.onCallOtp,
    this.isEmail = true,
    this.length = 6,
  });

  @override
  Widget build(BuildContext context) {
    final String title = isEmail ? 'Sign In Email' : 'Sign In Phone Number';
    final String message = isEmail
        ? 'Sign in code has been sent to $contactValue, check your inbox to continue.'
        : 'Sign in code has been sent to $contactValue, check your messages to continue.';

    final String imagePath = isEmail
        ? 'assets/sign_in/email.png'
        : 'assets/sign_in/phone.png';

    String currentOtp = '';

    final bool isEmailOtp = otpResponse?.isEmailOtp ?? false;
    final bool isVoiceOtp = otpResponse?.isVoiceOtp ?? false;

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is OtpVerifiedState) {
          final PreferenceManager preference = GetIt.I<PreferenceManager>();
          preference.setLoginSession(true);
          preference.setUserId(state.response.userId ?? '');
          preference.setCountryId(state.response.countryId ?? '');
          context.go(RoutePaths.dashboard);
        } else if (state is OtpVerificationFailedState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24 * Responsive.getResponsive(context),
          vertical: 36,
        ),
        height: 0.7 * Responsive.getHeight(context),
        width: Responsive.getWidth(context),
        decoration: BoxDecoration(
          color: AppTheme.getColor(context).onPrimary,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40 * Responsive.getResponsive(context)),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30 * Responsive.getResponsiveText(context)),
            Center(
              child: Column(
                children: [
                  MyCoButton(
                    onTap: () {},
                    title: '',
                    height: 0.088 * Responsive.getHeight(context),
                    width: 0.21 * Responsive.getWidth(context),
                    isShadowBottomLeft: true,
                    image: Image.asset(
                      imagePath,
                      height: 0.035 * Responsive.getHeight(context),
                      width: 0.035 * Responsive.getHeight(context),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomText(
                    title,
                    fontSize: 24 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w900,
                    color: AppTheme.getColor(context).onSurface,
                  ),
                  const SizedBox(height: 8),
                  CustomText(
                    message,
                    textAlign: TextAlign.center,
                    fontSize: 16 * Responsive.getResponsiveText(context),
                    color: AppTheme.getColor(context).onSurfaceVariant,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30 * Responsive.getResponsiveText(context)),
            OTPInputField(
              length: length,
              onCompleted: (_) {},
              onChanged: (code) {
                currentOtp = code;
              },
            ),
            SizedBox(height: 30 * Responsive.getResponsiveText(context)),
            Row(
              children: [
                CustomText(
                  "Haven't received the code? ",
                  fontSize: 20 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).onSurface,
                ),
                InkWell(
                  onTap: onResend,
                  child: CustomText(
                    'Resend it.',
                    fontSize: 20 * Responsive.getResponsiveText(context),
                    color: AppTheme.getColor(context).primary,
                  ),
                ),
              ],
            ),
            if (isEmailOtp || isVoiceOtp)
              SizedBox(height: 30 * Responsive.getResponsiveText(context)),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isEmailOtp)
                    InkWell(
                      onTap: onEmailOtp,
                      child: Text(
                        'Email for OTP',
                        style: TextStyle(
                          color: AppTheme.getColor(context).primary,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  if (isEmailOtp && isVoiceOtp) const Text(' or '),
                  if (isVoiceOtp)
                    InkWell(
                      onTap: onCallOtp,
                      child: Text(
                        'Call for OTP',
                        style: TextStyle(
                          color: AppTheme.getColor(context).primary,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 30 * Responsive.getResponsiveText(context)),
            MyCoButton(
              height: .05 * Responsive.getHeight(context),
              onTap: () {
                final model = VerifyOtpRequestModel(
                  societyId: selectedCompany?.societyId ?? '',
                  userMobile: contactValue,
                  countryCode: '',
                  userToken: '',
                  device: Platform.operatingSystem,
                  otp: currentOtp,
                  isFirebase: otpResponse?.isFirebase ?? false,
                  userMacAddress: '',
                  macAddressDevice: '',
                  macAddressPhoneModal: '',
                  androidSdkVersion: '',
                  androidVersion: '',
                  androidOsName: '',
                  loginVia: selectedCompany?.loginVia ?? '0',
                  languageId: '1',
                );

                context.read<LoginBloc>().add(VerifyOtpEvent(model: model));
              },
              title: 'Submit',
              boarderRadius: 50 * Responsive.getResponsive(context),
              isShadowBottomLeft: true,
            ),
            SizedBox(height: 30 * Responsive.getResponsiveText(context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  'Sign in with different method ',
                  fontSize: 20 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).onSurface,
                ),
                InkWell(
                  onTap: previousStep,
                  child: CustomText(
                    'Here.',
                    fontSize: 20 * Responsive.getResponsiveText(context),
                    color: AppTheme.getColor(context).primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
