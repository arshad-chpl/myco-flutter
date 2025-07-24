import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/visit_report.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_table.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/get_common_row.dart';

class ViewVisitDetailsPage extends StatelessWidget {
  const ViewVisitDetailsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      leading: BackButton(),
      title: LanguageManager().get('visit_details'),
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: VariableBag.commonCardHorizontalPadding,
              vertical: VariableBag.commonCardVerticalPadding,
            ),
            child: SingleChildScrollView(
              child: CommonCard(
                borderRadius: VariableBag.commonCardBorderRadius,
                showBlackShadowInChild: true,
                headerColor: AppTheme.getColor(context).primary,
                title: 'Mahakali Tractor',
                subTitleIcon: SvgPicture.asset(AppAssets.calendar),
                subTitle:
                '01st April 2025 (09:45am) to 01st April 2025(12:48pm)',

                bottomWidget: Padding(
                  padding: EdgeInsets.all(
                    12 * Responsive.getResponsive(context),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.01 * Responsive.getWidth(context),
                          vertical: 0.001 * Responsive.getHeight(context),
                        ),
                        child: Column(
                          children: [
                            getCommonRow(
                              context,
                              title: LanguageManager().get(
                                'contact_person_name',
                              ),
                              value: 'Jashvant Jatoliya',
                              onTap: () {},
                            ),
                            getCommonRow(
                              context,
                              title: LanguageManager().get(
                                'contact_person_mobile',
                              ),
                              valueWidget: RichText(
                                text: TextSpan(
                                  text: '+91 ',
                                  style: TextStyle(
                                    color: AppTheme.getColor(context).primary,
                                    fontSize:
                                    13 *
                                        Responsive.getResponsiveText(context),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '9356326355',
                                      style: TextStyle(
                                        color: AppTheme.getColor(
                                          context,
                                        ).onSurface,
                                        fontSize:
                                        13 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {},
                              value: '',
                            ),
                            getCommonRow(
                              context,
                              title: LanguageManager().get('visit_status'),
                              value: 'Approved',
                              textColor: AppTheme.getColor(context).secondary,
                              onTap: () {},
                            ),
                            getCommonRow(
                              context,
                              title: LanguageManager().get('visit_type'),
                              value: 'Test visit',
                              onTap: () {},
                            ),
                            getCommonRow(
                              context,
                              title: LanguageManager().get('visit_purpose'),
                              value: 'Feature check',
                              onTap: () {},
                            ),
                            getCommonRow(
                              context,
                              title: LanguageManager().get('address'),
                              valueWidget: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    '101, Sarkhej-sanand cross road Makaraba, Ahmedabad, Sarkhej-Gandhinagar Gujarat, 385431, India',
                                    fontSize:
                                    13 *
                                        Responsive.getResponsiveText(context),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomText(
                                    '(you are in range)',
                                    fontSize:
                                    13 *
                                        Responsive.getResponsiveText(context),
                                    color: AppTheme.getColor(context).secondary,
                                  ),
                                ],
                              ),
                              onTap: () {},
                              value: '',
                            ),
                            SizedBox(
                              height: 0.007 * Responsive.getHeight(context),
                            ),
                            Divider(color: AppTheme.getColor(context).primary),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        'visit_start_date_time',
                                        isKey: true,
                                        fontSize:
                                        15 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                        fontWeight: FontWeight.w700,
                                      ),
                                      SizedBox(height: 4),
                                      CustomText(
                                        '09:45AM, 21st May 2025',
                                        fontSize:
                                        14 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 0.16 * Responsive.getWidth(context),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        'visit_end_date_time',
                                        isKey: true,
                                        fontSize:
                                        15 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                        fontWeight: FontWeight.w700,
                                      ),
                                      SizedBox(height: 4),
                                      CustomText(
                                        '12:45PM, 21st May 2025',
                                        fontSize:
                                        14 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 0.004 * Responsive.getHeight(context),
                            ),
                            Divider(color: AppTheme.getColor(context).primary),

                            getCommonRow(
                              context,
                              title: LanguageManager().get('end_visit_remark'),
                              value: 'sdfsdasgas',
                              textColor: AppTheme.getColor(context).onSurface,
                              onTap: () {},
                            ),
                            getCommonRow(
                              context,
                              title: LanguageManager().get('end_visit_area'),
                              value: 'sdfsdasgas',
                              textColor: AppTheme.getColor(context).onSurface,
                              onTap: () {},
                            ),
                            getCommonRow(
                              context,
                              title: LanguageManager().get(
                                'end_visit_catalogue',
                              ),
                              value: 'sdfsdasgas',
                              textColor: AppTheme.getColor(context).onSurface,
                              onTap: () {},
                            ),
                            getCommonRow(
                              context,
                              title: LanguageManager().get(
                                'contact_person_number',
                              ),
                              valueWidget: RichText(
                                text: TextSpan(
                                  text: '+91 ',
                                  style: TextStyle(
                                    color: AppTheme.getColor(context).primary,
                                    fontSize:
                                    13 *
                                        Responsive.getResponsiveText(context),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '9356326355',
                                      style: TextStyle(
                                        color: AppTheme.getColor(
                                          context,
                                        ).onSurface,
                                        fontSize:
                                        13 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {},
                              value: '',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 6 * Responsive.getResponsive(context),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomText(
                              LanguageManager().get('visit_with'),
                              fontSize:
                              17 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              width: 0.015 * Responsive.getWidth(context),
                            ),
                            CustomText(':'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 7 * Responsive.getResponsive(context),
                        ),
                        child: Column(
                          children: [
                            CustomTableWidget(
                              name: 'Yash Soni',
                              designation: '(UI UX)',
                            ),
                            SizedBox(
                              height: 0.020 * Responsive.getHeight(context),
                            ),
                            Row(
                              children: [
                                MyCoButton(
                                  onTap: () {},
                                  backgroundColor: AppTheme.getColor(
                                    context,
                                  ).onPrimary,
                                  title: LanguageManager().get(
                                    'visit_complete',
                                  ),
                                  width: 0.30 * Responsive.getWidth(context),
                                  height: 0.033 * Responsive.getHeight(context),
                                  boarderRadius:
                                  VariableBag.bottomSheetBorderRadius,
                                  textStyle: TextStyle(
                                    color: AppTheme.getColor(context).secondary,
                                  ),
                                  borderColor: AppTheme.getColor(
                                    context,
                                  ).secondary,
                                ),
                                SizedBox(
                                  width: 0.11 * Responsive.getWidth(context),
                                ),
                                CustomText(
                                  LanguageManager().get('view_attachment'),
                                  color: AppTheme.getColor(context).secondary,
                                  fontSize:
                                  17 *
                                      Responsive.getResponsiveText(context),
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppTheme.getColor(
                                    context,
                                  ).secondary,
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 0.017 * Responsive.getHeight(context),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(AppAssets.whatsapp),
                                SizedBox(
                                  width: 0.045 * Responsive.getWidth(context),
                                ),
                                SvgPicture.asset(AppAssets.share),
                                SizedBox(
                                  width: 0.30 * Responsive.getWidth(context),
                                ),
                                MyCoButton(
                                  onTap: () {
                                    context.push("/visit_report");
                                  },
                                  title: LanguageManager().get('view_report'),
                                  isShadowBottomLeft: true,
                                  width: 0.33 * Responsive.getWidth(context),
                                  height: 0.033 * Responsive.getHeight(context),
                                  boarderRadius:
                                  VariableBag.buttonBorderRadius *
                                      Responsive.getResponsive(context),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.020 * Responsive.getHeight(context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    ),
  );
}