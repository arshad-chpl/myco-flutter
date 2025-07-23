import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/verify_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/domain/entites/company_response_entity.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/login/login_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/login/login_event.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/login/login_state.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/select_company_step/select_company_step_bloc.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/customotp_bottomsheet.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class OtpVerificationUi extends StatelessWidget {
  final String contactValue;
  final String countryCode;
  final bool isEmail;
  final CommonResponseModelEntity? otpResponse;
  final SocietyEntity? selectedCompany;

  const OtpVerificationUi({
    super.key,
    required this.otpResponse,
    required this.selectedCompany,
    required this.contactValue,
    required this.countryCode,
    this.isEmail = true,
  });

  @override
  Widget build(BuildContext context) {
    final String title = isEmail ? 'Sign In Email' : 'Sign In Phone Number';
    final String message = isEmail
        ? 'Sign in code has been sent to $contactValue, check your inbox to continue.'
        : 'Sign in code has been sent to $countryCode $contactValue, check your messages to continue.';
    final String imagePath = isEmail
        ? 'assets/sign_in/email.png'
        : 'assets/sign_in/phone.png';
    String currentOtp = '';

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is OtpVerifiedState) {
          final PreferenceManager preference = GetIt.I<PreferenceManager>();
          preference.setLoginSession(true);
          preference.setUserId(state.response.userId ?? '');
          preference.setCountryId(state.response.countryId ?? '');
          context.go(RoutePaths.home);
        } else if (state is OtpVerificationFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.response.message ?? 'OTP Verification Failed',
              ),
            ),
          );
          // You can add more complex dialog logic here if needed based on the response
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
        child: SingleChildScrollView(
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
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomText(
                      title,
                      fontSize: 24 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w900,
                    ),
                    const SizedBox(height: 8),
                    CustomText(
                      message,
                      textAlign: TextAlign.center,
                      fontSize: 16 * Responsive.getResponsiveText(context),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30 * Responsive.getResponsiveText(context)),
              OTPInputField(
                length: 6,
                onCompleted: (otp) {
                  currentOtp = otp;
                  // Optionally auto-submit when completed
                },
                onChanged: (code) {
                  currentOtp = code;
                },
              ),
              SizedBox(height: 30 * Responsive.getResponsiveText(context)),
              // ... Resend code logic can be added here, dispatching a SendOtpEvent again
              SizedBox(height: 30 * Responsive.getResponsiveText(context)),
              MyCoButton(
                height: .05 * Responsive.getHeight(context),
                onTap: () {
                  if (currentOtp.length == 6) {
                    final model = VerifyOtpRequestModel(
                      societyId: selectedCompany?.societyId ?? '',
                      userMobile: contactValue,
                      countryCode: countryCode,
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
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a valid 6-digit OTP.'),
                      ),
                    );
                  }
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
                    fontSize: 16 * Responsive.getResponsiveText(context),
                  ),
                  InkWell(
                    onTap: () => context.read<SelectCompanyStepBloc>().add(
                      GoToPreviousStep(),
                    ),
                    child: CustomText(
                      'Here.',
                      fontSize: 16 * Responsive.getResponsiveText(context),
                      color: AppTheme.getColor(context).primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
