import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/pages/select_company_page.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class SearchCompanyScreen extends StatelessWidget {
  const SearchCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Function to show the bottom sheet, reusable for both widgets.
    void showCompanySearchSheet() {
      showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.hardEdge,
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (bottomSheetContext) => BlocProvider(
          create: (_) => GetIt.I<CompanyBloc>(),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: 0.9 * Responsive.getHeight(context),
            ),
            child: const SelectCompanyPage(),
          ),
        ),
      );
    }

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              AppTheme.getColor(context).primary,
              AppTheme.getColor(context).surface,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 26 * Responsive.getResponsive(context),
            right: 26 * Responsive.getResponsive(context),
            top: 180 * Responsive.getResponsive(context),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/search_society/search-company.png',
                width: 0.8 * Responsive.getWidth(context),
              ),
              SizedBox(height: 0.055 * Responsive.getHeight(context)),
              CustomText(
                'select_your_company',
                isKey: true,
                fontSize: 30 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w600,
                color: AppTheme.getColor(context).onSurface,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 0.014 * Responsive.getHeight(context)),
              CustomText(
                'select_your_company_desc',
                isKey: true,
                fontSize: 15 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).onSurfaceVariant,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 0.04 * Responsive.getHeight(context)),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  'company_name',
                  isKey: true,
                  fontSize: 15 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getColor(context).onSurfaceVariant,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 0.017 * Responsive.getHeight(context)),
              // --- START: Updated Widget ---
              InkWell(
                onTap: showCompanySearchSheet, // Trigger the bottom sheet
                child: AbsorbPointer(
                  // Prevents the text field from gaining focus
                  child: MyCoTextfield(
                    hintText: LanguageManager().get('search_your_company'),
                    hintTextStyle: TextStyle(
                      fontSize: 18 * Responsive.getResponsiveText(context),
                      color: AppTheme.getColor(context).outline,
                    ),
                    preFixImage: 'assets/search_society/company_icon.png',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Color(0xFF98A2B3)),
                    ),
                    height: 0.06 * Responsive.getHeight(context),
                    // These properties make it look like a button
                    isReadOnly: true,
                  ),
                ),
              ),
              // --- END: Updated Widget ---
              SizedBox(height: 0.02 * Responsive.getHeight(context)),
              MyCoButton(
                onTap: showCompanySearchSheet,
                // Use the same function
                title: LanguageManager().get('search'),
                width: Responsive.getWidth(context),
                height: 0.065 * Responsive.getHeight(context),
                boarderRadius: 30,
                textStyle: TextStyle(
                  fontSize: 18 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getColor(context).onPrimary,
                ),
                backgroundColor: AppTheme.getColor(context).primary,
                isShadowBottomLeft: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
