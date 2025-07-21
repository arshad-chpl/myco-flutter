import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/date_selection_row.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/employee_info_tile.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/get_common_row.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/reschedule_visit_row.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/visit_action_row.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';

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

        CustomSearchField(controller: searchController,
          hintText: 'Search with Customer',),
        SizedBox(height: screenSize.height * 0.012),

        // CommonCard
        CommonCard(
          title: 'Supreme Auto garge - Kadodra(RT67542)',
          subTitle: '03:42 PM 05th Jun 2025',
          subTitleIcon: SvgPicture.asset('assets/visit/svgs/calendar.svg'),
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

                // User Info
                const EmployeeInfoTile(
                  imagePath: 'assets/visit/svgs/user1.png',
                  name: 'Ajju K',
                  role: 'QA',
                ),


                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.002),
                  child: const Divider(
                    color: AppColors.primary,
                    thickness: 1.2,
                  ),
                ),

                // Info Rows
                getCommonRow(context, title: 'Visit', value: 'Physical', onTap: () {}, textColor: AppTheme.getColor(context).outline),
                getCommonRow(context, title: 'Visit Type', value: 'Visit Type', onTap: () {}, textColor: AppTheme.getColor(context).outline),
                getCommonRow(context, title: 'Visit Purpose', value: 'Visit Purpose', onTap: () {}, textColor: AppTheme.getColor(context).outline),
                getCommonRow(
                  context,
                  title: 'Address',
                  value: '5XJ6F9J, Raipur, Gujarat 394325, India',
                  onTap: () {},
                  textColor: AppTheme.getColor(context).onSurface,
                ),

                SizedBox(height: screenSize.height * 0.02),

                // 3 icons + Visit not started
                VisitActionRow(
                  onTap: () {
                    print('Visit action button tapped');
                  },
                  buttonText: 'Visit Not Started',
                ),

              ],
            ),
          ),
        ),
      ],
    ),
  );

