import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/di/modules/network_module.dart';
import 'package:myco_flutter/features/company_selector/domain/entites/society_response.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_event.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_state.dart';
import 'package:myco_flutter/features/company_selector/presentation/pages/sales_inquiry_dialog_page.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/text_field.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class SelectCompanyPage extends StatelessWidget {
  const SelectCompanyPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      color: AppColors.primary, // Set your desired background color here
      child: const SafeArea(child: _CompanySearchBody()),
    ),
  );
}

class _CompanySearchBody extends StatefulWidget {
  const _CompanySearchBody();

  @override
  State<_CompanySearchBody> createState() => _CompanySearchBodyState();
}

class _CompanySearchBodyState extends State<_CompanySearchBody> {
  PreferenceManager preference = GetIt.I<PreferenceManager>();

  final TextEditingController _controller = TextEditingController();
  Society? _selectedCompany;
  Timer? _debounce;

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (value.length >= 3) {
        context.read<CompanyBloc>().add(SearchCompany(value));
      } else {
        context.read<CompanyBloc>().add(InitialView());
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _onSearchChanged(_controller.text);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) => Container(
    color: AppTheme.getColor(context).surface,
    padding: EdgeInsets.symmetric(
      horizontal: 0.08 * Responsive.getWidth(context),
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
          fontSize: 13 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 0.01 * Responsive.getHeight(context)),
        MyCoTextField(
          controller: _controller,
          preFixImage: 'assets/search_society/company_icon.png',
          hintText: 'Enter Your Company Name',
          border: Border.all(color: AppTheme.getColor(context).outline),

          hintTextStyle: TextStyle(
            fontSize: 14 * Responsive.getResponsiveText(context),
            color: AppTheme.getColor(context).outline,
          ),
        ),
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
                              backgroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            // TODO: replace with actual text
                            child: const CustomText(
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
                return ListView.builder(
                  itemCount: state.companies.society!.length,
                  itemBuilder: (_, index) {
                    final company = state.companies.society![index];
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: ListTile(
                        selectedColor: AppColors.primary,
                        leading: Image.asset(AppAssets.myCoLogo),
                        title: CustomText(
                          company.societyName!,
                          fontWeight: FontWeight.w600,
                        ),
                        subtitle: CustomText(
                          company.societyAddress!,
                          fontSize: 10,
                        ),
                        selected: company == _selectedCompany,
                        onTap: () {
                          preference.setCompanyId(company.societyId.toString());
                          preference.setCompanyName(
                            company.societyName.toString(),
                          );
                          preference.setCompanyAddress(
                            company.societyAddress.toString(),
                          );
                          preference.setBaseUrl(company.subDomain.toString());
                          preference.setCompanyId(company.societyId.toString());
                          preference.setCompanyName(
                            company.societyName.toString(),
                          );
                          preference.setCompanyAddress(
                            company.societyAddress.toString(),
                          );
                          preference.setBaseUrl(company.subDomain.toString());

                          final companyJson = jsonEncode(company.toJson());

                          preference.writeString(
                            'selectedCompany',
                            companyJson,
                          );
                          final sl = GetIt.instance;
                          refreshApiServiceCompany(sl);

                          preference.setLoginSession(true);

                          context.pushNamed(RoutePaths.dashboard);

                          //   setState(() => _selectedCompany = company);
                        },
                      ),
                    );
                  },
                );
              } else if (state is CompanyError) {
                return Center(child: CustomText(state.message));
              }
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Replace with your actual image path
                      Image.asset(AppAssets.searchCompany, height: 180),
                      const SizedBox(height: 20),
                      const CustomText(
                        'Search Your Company',
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
              );
            },
          ),
        ),
      ],
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
