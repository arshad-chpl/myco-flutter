import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/reschedule_visit_page.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/date_selection_row.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/common_row.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';
import 'package:myco_flutter/widgets/custom_text.dart';


Widget buildOtherEmployeeVisitTab(
  BuildContext context,
  Size screenSize, {
  required TextEditingController searchController,
  required FocusNode searchFocus,
  required String formattedDate,
  required VoidCallback goToPreviousDate,
  required VoidCallback goToNextDate,
  required VoidCallback selectDateFromPicker,
}) => SingleChildScrollView(
  padding: EdgeInsets.all(screenSize.width * 0.04),
  child: Column(
    children: [
      // DateSelectionRow
      DateSelectionRow(
        formattedDate: formattedDate,
        goToPreviousDate: goToPreviousDate,
        goToNextDate: goToNextDate,
        selectDateFromPicker: selectDateFromPicker,
      ),
      SizedBox(height: 16 * Responsive.getResponsiveText(context)),

      // Search Field
      CustomSearchField(
        controller: searchController,
        hintText: 'Search With Customer',
      ),

      SizedBox(height: screenSize.height * 0.012),

      // CommonCard
      CommonCard(
        title: 'Supreme Auto garge - Kadodra(RT67542)',
        subTitle: '03:42 PM 05th Jun 2025',
        subTitleIcon: SvgPicture.asset(AppAssets.calendar),
        showHeaderPrefixIcon: false,
        showBlackShadowInChild: true,
        headerColor: AppTheme.getColor(context).primary,
        borderColor: AppColors.textfieldBorder,
        bottomWidget: Padding(
          padding: EdgeInsets.all(screenSize.width * 0.035),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    'visit_added_for',
                    isKey: true,
                    color: AppTheme.getColor(context).onSurface,
                    fontWeight: FontWeight.w600,
                    fontSize: 14 * Responsive.getResponsive(context),
                  ),
                  GestureDetector(
                    child: InkWell(
                      child: CustomText(
                        'Reschedule Visit?',
                        color: AppTheme.getColor(context).primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14 * Responsive.getResponsive(context),
                        decoration: TextDecoration.underline,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RescheduleVisitPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              ListTile(
                leading: SvgPicture.asset(AppAssets.smart_car),
                title: CustomText(
                  'Ajju k',
                  color: AppTheme.getColor(context).primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14 * Responsive.getResponsiveText(context),
                ),
                subtitle: CustomText(
                  "QA",
                  color: AppTheme.getColor(context).outline,
                  fontWeight: FontWeight.w500,
                  fontSize: 12 * Responsive.getResponsiveText(context),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.002,
                ),
                child: Divider(
                  color: AppTheme.getColor(context).primary,
                  thickness: 1.2,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonRow(
                    title: 'Visit',
                    value: 'Physical',
                    textColor: AppTheme.getColor(context).outline,
                  ),
                  CommonRow(
                    title: 'Visit Type',
                    value: 'Visit Type',
                    textColor: AppTheme.getColor(context).outline,
                  ),
                  CommonRow(
                    title: 'Visit Purpose',
                    value: 'Visit Purpose',
                    textColor: AppTheme.getColor(context).outline,
                  ),
                  CommonRow(
                    title: 'Address',
                    value: '5XJ6F9J, Haripura, Gujrat 394325,\nIndia',
                    textColor: AppTheme.getColor(context).onSurface,
                  ),
                ],
              ),
              SizedBox(height: 0.01 * Responsive.getHeight(context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 20 * Responsive.getResponsive(context),
                    children: [
                      InkWell(
                        child: SvgPicture.asset(AppAssets.whatsapp),
                        onTap: () {
                          // Handle whatsapp tap
                        },
                      ),
                      InkWell(
                        child: SvgPicture.asset(AppAssets.share),
                        onTap: () {
                          // Handle share tap
                        },
                      ),
                      InkWell(
                        child: SvgPicture.asset(AppAssets.delete),
                        onTap: () {
                          // Handle delete tap
                        },
                      ),
                    ],
                  ),
                  MyCoButton(
                    onTap: () {
                      // Handle visit not started tap
                    },
                    textStyle: TextStyle(
                      color: AppColors.spanishYellow,
                      fontWeight: FontWeight.w500,
                      fontSize: 13 * Responsive.getResponsiveText(context),
                    ),
                    boarderRadius: 30 * Responsive.getResponsive(context),
                    height: 0.04 * Responsive.getHeight(context),
                    width: 0.4 * Responsive.getWidth(context),
                    borderColor: AppColors.spanishYellow,
                    borderWidth: 1.2 * Responsive.getResponsive(context),
                    backgroundColor: Colors.transparent,
                    wantBorder: true,
                    title: 'Visit Not Started',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);
