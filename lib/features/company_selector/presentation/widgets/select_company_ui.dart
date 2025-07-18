import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/di/modules/network_module.dart';
import 'package:myco_flutter/features/company_selector/domain/entites/company_response_entity.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_event.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_state.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/select_company_step/select_company_step_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/pages/sales_inquiry_dialog_page.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class SelectCompanyUi extends StatelessWidget {
  const SelectCompanyUi({super.key});

  @override
  Widget build(BuildContext context) {
    // The controller is managed locally within this stateless widget.
    // It doesn't need to be part of a State object as its lifecycle
    // is contained within this build method.
    final TextEditingController controller = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30 * Responsive.getResponsive(context),
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
            controller: controller,
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
            height: 50,
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
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CompanyLoaded) {
                  if (state.companies.society == null || state.companies.society!.isEmpty) {
                    return const _NoCompanyFoundWidget();
                  }
                  return _CompanyList(
                    companies: state.companies.society!,
                    selectedIndex: state.selectedIndex,
                  );
                } else if (state is CompanyError) {
                  return Center(child: CustomText(state.message));
                }
                // Initial "Search Your Society" view
                return const _InitialSearchWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}

// --- Extracted Widgets for Clarity and Reusability ---

class _CompanyList extends StatelessWidget {
  final List<SocietyEntity> companies;
  final int selectedIndex;

  const _CompanyList({required this.companies, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: companies.length,
            itemBuilder: (_, index) {
              final company = companies[index];
              final isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () => context.read<CompanyBloc>().add(CompanyIndex(index)),
                child: _CompanyListItem(company: company, isSelected: isSelected),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0 * Responsive.getResponsive(context)),
          child: Row(
            children: [
              Expanded(
                child: MyCoButton(
                  title: 'Close',
                  onTap: () => Navigator.pop(context),
                  backgroundColor: Colors.white,
                  border: Border.all(color: AppTheme.getColor(context).primary),
                  textStyle: TextStyle(color: AppTheme.getColor(context).primary),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: MyCoButton(
                  title: 'Submit',
                  isShadowBottomLeft: true,
                  onTap: selectedIndex >= 0
                      ? () {
                          final company = companies[selectedIndex];
                          final preference = GetIt.I<PreferenceManager>();
                          
                          // Save company details
                          preference.setCompanyId(company.societyId.toString());
                          preference.setCompanyName(company.societyName.toString());
                          preference.setCompanyAddress(company.societyAddress.toString());
                          preference.setBaseUrl(company.subDomain.toString());
                          preference.setLoginSession(false);
                          refreshApiServiceCompany(GetIt.instance);

                          dev.log("Company details saved for ${company.societyName}", name: "CompanyPref");

                          // Add event to the step BLoC to move to the next page
                          context.read<SelectCompanyStepBloc>().add(GoToLoginStep(company));
                        }
                      : null, // Button is disabled if no company is selected
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CompanyListItem extends StatelessWidget {
  const _CompanyListItem({required this.company, required this.isSelected});
  final SocietyEntity company;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppTheme.getColor(context);
    return Container(
      width: Responsive.getWidth(context),
      padding: EdgeInsets.all(12.0 * Responsive.getResponsive(context)),
      margin: EdgeInsets.only(bottom: 12 * Responsive.getResponsive(context)),
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.outline),
        borderRadius: BorderRadius.circular(14 * Responsive.getResponsive(context)),
        color: isSelected ? colorScheme.primary : colorScheme.surface,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: colorScheme.primary,
            radius: 20 * Responsive.getResponsive(context),
            child: CircleAvatar(
              backgroundColor: colorScheme.onPrimary,
              radius: 17 * Responsive.getResponsive(context),
              child: Center(
                child: CustomText(
                  company.societyName!.substring(0, 1),
                  fontWeight: FontWeight.w600,
                  color: colorScheme.primary,
                  fontSize: 18 * Responsive.getResponsiveText(context),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(width: 0.02 * Responsive.getWidth(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  company.societyName!,
                  fontWeight: FontWeight.w600,
                  fontSize: 16 * Responsive.getResponsiveText(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
                ),
                CustomText(
                  company.societyAddress!,
                  fontSize: 14 * Responsive.getResponsiveText(context),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InitialSearchWidget extends StatelessWidget {
  const _InitialSearchWidget();
  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppAssets.searchCompany, height: 180),
                const SizedBox(height: 20),
                const CustomText('Search Your Society', fontSize: 18, fontWeight: FontWeight.bold, textAlign: TextAlign.center),
                const SizedBox(height: 8),
                const CustomText('Start typing your company name in the box above and select it to continue.', fontSize: 14, textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      );
}

class _NoCompanyFoundWidget extends StatelessWidget {
  const _NoCompanyFoundWidget();
  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAssets.noCompany, height: 180),
              const SizedBox(height: 20),
              const CustomText('Your company is not listed?', fontSize: 18, fontWeight: FontWeight.bold, textAlign: TextAlign.center),
              const SizedBox(height: 8),
              const CustomText("If your company doesn't appear in the list, you can request to add it.", fontSize: 14, textAlign: TextAlign.center),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => showModalBottomSheet(context: context, isScrollControlled: true, builder: (_) => const SalesInquiryForm()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.getColor(context).primary,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const CustomText('Request Your Society', color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      );
}
