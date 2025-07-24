import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/di/modules/network_module.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/verify_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/domain/entites/company_response_entity.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/device_change/device_change_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/login/login_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/login/login_event.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/login/login_state.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/select_company_step/select_company_step_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/widgets/get_reason_ui.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/customotp_bottomsheet.dart';
import 'package:myco_flutter/widgets/custom_alert_dialog.dart';
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

    final bool isEmailOtp = otpResponse?.isEmailOtp ?? false;
    final bool isVoiceOtp = otpResponse?.isVoiceOtp ?? false;

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is OtpVerifiedState) {
          final PreferenceManager preference = GetIt.I<PreferenceManager>();
          preference.setLoginSession(true);
          preference.setUserId(state.response.userId ?? '');
          preference.setUserMobileNo(state.response.userMobile ?? '');
          preference.setCountryId(state.response.countryId ?? '');
          preference.setCompanyId(state.response.societyId ?? '');
          preference.setCompanyAddress(state.response.societyAddress ?? '');
          preference.setCompanyName(state.response.societyName ?? '');

          context.go(RoutePaths.dashboard);
        } else if (state is OtpVerificationFailedState) {
          if (state.response.viewDialogApiCall == true) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: CustomAlertDialog(
                  alertType: AlertType.custom,
                  icon: 'assets/login/device_change_icon.svg',
                  content: state.response.message,
                  cancelText: 'Cancel',
                  confirmText: 'Request',
                  onConfirm: () {
                    Navigator.of(context).pop();
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => BlocProvider(
                        create: (context) => GetIt.I<DeviceChangeBloc>(),
                        child: const GetReasonUi(title: 'Change Request *'),
                      ),
                    );
                  },
                  onCancel: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            );
          } else if (state.response.viewDialog == true) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: CustomAlertDialog(
                  alertType: AlertType.defaultType,
                  content: state.response.message,
                  confirmText: 'Ok',
                  onConfirm: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            );
          } else {
            Fluttertoast.showToast(msg: state.response.message ?? '');
          }
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24 * Responsive.getResponsive(context),
          vertical: 36,
        ),
        width: Responsive.getWidth(context),
        decoration: BoxDecoration(
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
                      fontSize: 22 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 8),
                    CustomText(
                      message,
                      textAlign: TextAlign.center,
                      fontSize: 16 * Responsive.getResponsiveText(context),
                      color: AppTheme.getColor(context).onSurface,
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
              Row(
                children: [
                  CustomText(
                    "Haven't received the code? ",
                    fontSize: 16 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w500,
                    color: AppTheme.getColor(context).onSurface,
                  ),
                  InkWell(
                    onTap: () {},
                    child: CustomText(
                      'Resend it.',
                      fontSize: 16 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w500,
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
                        onTap: () {},
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
                        onTap: () {},
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
