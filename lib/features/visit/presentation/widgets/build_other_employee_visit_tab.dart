import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/features/visit/presentation/widgets/get_common_row.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            dateArrowButton(Icons.chevron_left_rounded, goToPreviousDate, multiplier,context),
            GestureDetector(
              onTap: selectDateFromPicker,
              child: Row(
                children: [
                  Baseline(
                    baselineType: TextBaseline.alphabetic,
                    baseline: 20 * multiplier,
                    child: CustomText(
                      formattedDate,
                      fontSize: 16 * multiplier,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.getColor(context).onSurface,
                    ),
                  ),
                  Baseline(
                    baselineType: TextBaseline.alphabetic,
                    baseline: 20 * multiplier,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 22 * multiplier,
                      color: AppTheme.getColor(context).onSurface,
                    ),
                  ),
                ],
              ),
            ),
            dateArrowButton(Icons.chevron_right_rounded, goToNextDate, multiplier,context),
          ],
        ),

        SizedBox(height: 16 * multiplier),

        // Search
        SizedBox(
          height: 45 * multiplier,
          child: MyCoTextfield(
            controller: searchController,
            focusNode: searchFocus,
            hintText: 'Search with Customer',
            fillColor: Colors.white,
            boarderRadius: 10,
            contentPadding: EdgeInsets.symmetric(vertical: 12 * multiplier),
            prefix: Padding(
              padding: EdgeInsets.only(left: 12 * multiplier, right: 8 * multiplier),
              child: Icon(CupertinoIcons.search,
                  color: AppColors.primary, size: 24 * multiplier),
            ),
            typingtextStyle: TextStyle(fontSize: 14 * multiplier),
            hintTextStyle: TextStyle(
              fontSize: 14 * multiplier,
              color: AppColors.textPrimary,
            ),
            textAlignment: TextAlign.start,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10 * multiplier)),
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
            ),
          ),
        ),

        SizedBox(height: screenSize.height * 0.012),

        // CommonCard
        CommonCard(
          title: 'Supreme Auto garge - Kadodra(RT67542)',
          subTitle: '03:42 PM 05th Jun 2025',
          subTitleIcon: SvgPicture.asset(
            'assets/visit/svgs/calendar.svg',
          ),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        'Visit Added For',
                        color: AppTheme.getColor(context).onSurface,
                        fontWeight: FontWeight.w600,
                        fontSize: 14 * multiplier,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: CustomText(
                          'Reschedule Visit?',
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 14 * multiplier,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),

                // ListTile
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Image.asset(
                      'assets/visit/svgs/user.png',
                      width: 80 * multiplier,
                      height: 80 * multiplier,
                      fit: BoxFit.contain,
                    ),
                    title: CustomText(
                      'Ajju k',
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14 * multiplier,
                    ),
                    subtitle: CustomText(
                      'QA',
                      color: AppColors.textfieldBorder,
                      fontSize: 12 * multiplier,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.002),
                  child: const Divider(
                    color: AppColors.primary,
                    thickness: 1.2,
                  ),
                ),

                getCommonRow(context, title: 'Visit', value: 'Physical', onTap: () {}, textColor: AppTheme.getColor(context).outline),
                getCommonRow(context, title: 'Visit Type', value: 'Visit Type', onTap: () {},textColor: AppTheme.getColor(context).outline),
                getCommonRow(context, title: 'Visit Purpose', value: 'Visit Purpose', onTap: () {},textColor: AppTheme.getColor(context).outline),
                getCommonRow(
                  context,
                  title: 'Address',
                  value: '5XJ6F9J, Raipur, Gujarat 394325, India',
                  onTap: () {},
                    textColor: AppTheme.getColor(context).onSurface
                ),

                SizedBox(height: screenSize.height * 0.02),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Icons
                    Flexible(
                      flex: 6,
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/visit/svgs/whatsapp.svg'),
                          SizedBox(width: screenSize.width * 0.03),
                          SvgPicture.asset('assets/visit/svgs/share.svg'),
                          SizedBox(width: screenSize.width * 0.03),
                          SvgPicture.asset('assets/visit/svgs/delete.svg'),
                        ],
                      ),
                    ),

                    //  Button
                    Flexible(
                      flex: 5,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: MyCoButton(
                          onTap: () {},
                          title: 'Visit Not Started',
                          textStyle: TextStyle(
                            color: AppColors.spanishYellow,
                            fontWeight: FontWeight.w500,
                            fontSize: 13 * getResponsiveText(context),
                          ),
                          boarderRadius: 30 * getResponsive(context),
                          borderColor: AppColors.spanishYellow,
                          borderWidth: 1.2,
                          backgroundColor: Colors.transparent,
                      ),
                    ),
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

//arrow btn for date
Widget dateArrowButton(IconData icon, VoidCallback onTap, double multiplier,BuildContext context) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8 * multiplier),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15 * multiplier),
          color: Util.applyOpacity(AppTheme.getColor(context).primary, 0.25),
        ),
        child: Icon(icon, size: 22 * multiplier),
      ),
    );