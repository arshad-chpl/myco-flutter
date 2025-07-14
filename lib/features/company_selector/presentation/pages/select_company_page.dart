import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/features/company_selector/data/models/society_response_model.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/login/login_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/widgets/login_ui.dart';
import 'package:myco_flutter/features/company_selector/presentation/widgets/otp_verification_ui.dart';
import 'package:myco_flutter/features/company_selector/presentation/widgets/select_company_ui.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/di/modules/network_module.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_event.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_state.dart';
import 'package:myco_flutter/features/company_selector/presentation/pages/sales_inquiry_dialog_page.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

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
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError || snapshot.data == null) {
              return const Center(
                child: Text('Failed to load selected company.'),
              );
            } else {
              final companyJson = snapshot.data!;
              final selectedCompany = SocietyModel.fromJson(
                jsonDecode(companyJson),
              );

              return BlocProvider(
                create: (BuildContext context) =>GetIt.I<LoginBloc>(),
                child: LoginUi(
                  previousStep: _previousStep,
                  nextStep: _nextStep,
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
                  onCheckChanged: (val) {
                    setState(() {
                      isChecked = val;
                    });
                  },
                  selectedCompany: selectedCompany,
                ),
              );
            }
          },
        );
      case 2:
        return FutureBuilder<String?>(
          future: preference.readString('selectedCompany'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError || snapshot.data == null) {
              return const Center(
                child: Text('Failed to load selected company.'),
              );
            } else {
              final companyJson = snapshot.data!;
              final selectedCompany = SocietyModel.fromJson(
                jsonDecode(companyJson),
              );

              final bool isEmail = selectedCompany.loginVia == '1';
              final String contactValue = isEmail ? emailController.text : phoneController.text;

              return OtpVerificationUi(
                contactValue: contactValue,
                isEmail: isEmail,
                onSubmit: (otp) {
                  // Verify OTP, then navigate or whatever
                },
                previousStep: _previousStep,
                onResend: () {},
                onEmailOtp: () {},
                onCallOtp: () {},
              );
            }
          },
        );
      default:
        return const Text('Unknown step');
    }
  }
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
