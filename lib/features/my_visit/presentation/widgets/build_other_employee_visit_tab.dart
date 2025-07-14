import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/date_selection_row.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/employee_info_tile.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/get_common_row.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/reschedule_visit_row.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/visit_action_row.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/visit_detail_rows.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/visit_search_bar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

Widget buildOtherEmployeeVisitTab(
  BuildContext context,
  Size screenSize,
  double multiplier, {
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

      // Date
      DateSelectionRow(
        formattedDate: formattedDate,
        goToPreviousDate: goToPreviousDate,
        goToNextDate: goToNextDate,
        selectDateFromPicker: selectDateFromPicker,
      ),
      SizedBox(height: 16 * multiplier),

      // Search
      VisitSearchBar(
        controller: searchController,
        focusNode: searchFocus,
        hintText: 'Search with Customer',
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
              // Top Row
              RescheduleVisitRow(
                onTap: () {

                },
              ),
              SizedBox(height: screenSize.height * 0.02),

              // ListTile
              const EmployeeInfoTile(
                imagePath: AppAssets.user,
                name: 'Ajju k',
                role: 'QA',
              ),


              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.002,
                ),
                child: const Divider(color: AppColors.primary, thickness: 1.2),
              ),

              VisitDetailRows(
                visit: 'Physical',
                visitType: 'Visit Type',
                visitPurpose: 'Visit Purpose',
                address: '5XJ6F9J, Raipur, Gujarat 394325, India',
                onVisitTap: () {},
                onVisitTypeTap: () {},
                onVisitPurposeTap: () {},
                onAddressTap: () {},
              ),

              VisitActionRow(
                onTap: () {},
                buttonText: 'Visit Not Started',
              ),

            ],
          ),
        ),
      ),
    ],
  ),
);