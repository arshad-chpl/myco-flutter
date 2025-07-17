import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/features/company_selector/data/models/society_response_model.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/device_change/device_change_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/login/login_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/login/login_state.dart';
import 'package:myco_flutter/features/company_selector/presentation/widgets/get_reason_ui.dart';
import 'package:myco_flutter/features/company_selector/presentation/widgets/login_ui.dart';
import 'package:myco_flutter/features/company_selector/presentation/widgets/otp_verification_ui.dart';
import 'package:myco_flutter/features/company_selector/presentation/widgets/select_company_ui.dart';
import 'package:myco_flutter/widgets/custom_alert_dialog.dart';

class SelectCompanyPage extends StatelessWidget {
  const SelectCompanyPage({super.key});

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: SafeArea(child: _CompanySearchBody()));
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
  final ValueNotifier<bool> isChecked = ValueNotifier(false);

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
    isChecked.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep == 0) {
      phoneController.clear();
      emailController.clear();
    }

    if (_currentStep < 2) {
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
        return SelectCompanyUi(controller: _controller, nextStep: _nextStep);
      case 1:
        return FutureBuilder<String?>(
          future: preference.readString('selectedCompany'),
          builder: (context, instance) {
            if (instance.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (instance.hasError || instance.data == null) {
              return const Center(
                child: Text('Failed to load selected company.'),
              );
            } else {
              final companyJson = instance.data!;
              final selectedCompany = SocietyModel.fromJson(
                jsonDecode(companyJson),
              );

              return BlocProvider(
                create: (BuildContext context) => GetIt.I<LoginBloc>(),
                child: BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) async {
                    if (state is OtpSentState) {
                      final prefs = GetIt.I<PreferenceManager>();
                      await prefs.writeString(
                        'otpResponse',
                        jsonEncode(state.response.toJson()),
                      );
                      _nextStep();
                    } else if (state is OtpNotSentState) {
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
                                    create: (context) =>
                                        GetIt.I<DeviceChangeBloc>(),
                                    child: const GetReasonUi(
                                      title: 'Change Request *',
                                    ),
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
                  child: LoginUi(
                    previousStep: _previousStep,
                    nextStep: _nextStep,
                    // You can remove this if not used inside LoginUi
                    selectedCountry: selectedCountry,
                    countryMap: countryMap,
                    onCountryChanged: (value, index) {
                      setState(() {
                        selectedCountry = value!;
                      });
                    },
                    phoneController: phoneController,
                    emailController: emailController,
                    isChecked: isChecked,
                    // ✅ pass ValueNotifier
                    onCheckChanged: (val) => isChecked.value = val,
                    selectedCompany: selectedCompany,
                  ),
                ),
              );
            }
          },
        );
      case 2:
        return FutureBuilder<List<String?>>(
          future: Future.wait([
            preference.readString('otpResponse'),
            preference.readString('selectedCompany'),
          ]),
          builder: (context, instance) {
            if (instance.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (instance.hasError ||
                instance.data == null ||
                instance.data!.any((e) => e == null)) {
              return const Center(child: Text('Failed to load required data.'));
            } else {
              final otpResponseJson = instance.data![0]!;
              final selectedCompanyJson = instance.data![1]!;

              final otpResponse = CommonResponse.fromJson(
                jsonDecode(otpResponseJson),
              );
              final selectedCompany = SocietyModel.fromJson(
                jsonDecode(selectedCompanyJson),
              );

              final bool isEmail = selectedCompany.loginVia == '1';
              final String contactValue = isEmail
                  ? emailController.text
                  : phoneController.text;

              return BlocProvider(
                create: (context) => GetIt.I<LoginBloc>(),
                child: OtpVerificationUi(
                  contactValue: contactValue,
                  countryCode: countryMap[selectedCountry] ?? '',
                  isEmail: isEmail,
                  otpResponse: otpResponse,
                  selectedCompany: selectedCompany,
                  onSubmit: (otp) {},
                  previousStep: _previousStep,
                  onResend: () {
                    // Handle resend OTP logic if needed
                  },
                  onEmailOtp: () {
                    // Handle email OTP logic if needed
                  },
                  onCallOtp: () {
                    // Handle call OTP logic if needed
                  },
                ),
              );
            }
          },
        );
      default:
        return const Text('Unknown step');
    }
  }
}
