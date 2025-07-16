import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class SelectCompanyUi extends StatelessWidget {
  final TextEditingController _controller;
  final Function _nextStep;

  const SelectCompanyUi({
    super.key,
    required TextEditingController controller,
    required Function nextStep,
  }) : _controller = controller,
       _nextStep = nextStep;

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.only(
        left: 30 * Responsive.getResponsive(context),
        right: 30 * Responsive.getResponsive(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 0.03 * Responsive.getHeight(context)),
          CustomText(
            'Company Name',
            fontSize: 15 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w600,
            color: AppTheme.getColor(context).onSurfaceVariant,
          ),
          SizedBox(height: 0.01 * Responsive.getHeight(context)),
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
                              child: CustomText(
                                'Request Your Society',
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
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.companies.society!.length,
                          itemBuilder: (_, index) {
                            final company = state.companies.society![index];
                            final isSelected = state.selectedIndex == index;

                            return GestureDetector(
                              onTap: () {
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
                                  bottom:
                                      12 * Responsive.getResponsive(context),
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
                                    CircleAvatar(
                                      backgroundColor: AppTheme.getColor(
                                        context,
                                      ).primary,
                                      radius:
                                          20 *
                                          Responsive.getResponsive(context),
                                      child: CircleAvatar(
                                        backgroundColor: AppTheme.getColor(
                                          context,
                                        ).onPrimary,
                                        radius:
                                            17 *
                                            Responsive.getResponsive(context),
                                        child: Center(
                                          child: CustomText(
                                            company.societyName!.substring(
                                              0,
                                              1,
                                            ),
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
                                      width:
                                          0.02 * Responsive.getWidth(context),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
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
                                          ),
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
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
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
                                        final PreferenceManager preference =
                                            GetIt.I<PreferenceManager>();
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

                                        preference.setLoginSession(false);

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
                                          "Base URL saved: ${company.subDomain}",
                                          name: "CompanyPref",
                                        );
                                        preference.writeString(
                                          'selectedCompany',
                                          companyJson,
                                        );
                                        dev.log(
                                          "Full company JSON saved: $companyJson",
                                          name: "CompanyPref",
                                        );

                                        _nextStep();
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
                          Image.asset(AppAssets.searchCompany, height: 180),
                          const SizedBox(height: 20),
                          const CustomText(
                            'Search Your Society',
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
}
