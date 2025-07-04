import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/visits/presentation/pages/visit_report.dart'
    hide Padding;
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/get_common_row.dart';
import 'package:myco_flutter/widgets/custom_table.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/visit_svgs/arrow.svg'),
        ),
        title: CustomText('Visit Details', fontWeight: FontWeight.w700),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.055 * Responsive.getWidth(context),
        ),
        child: SingleChildScrollView(
          child: CommonCard(
            showBlackShadowInChild: true,
            headerColor: AppTheme.getColor(context).primary,
            title: 'Mahakali Tractor',
            subTitleIcon: SvgPicture.asset('assets/visit_svgs/calendar.svg'),
            subTitle: '01st April 2025 (09:45am) to 01st April 2025(12:48pm)',

            bottomWidget: Padding(
              padding: const EdgeInsets.all(12.0),
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
                          title: 'Contact Person name',
                          value: 'Jashvant Jatoliya',
                          onTap: () {},
                        ),
                        getCommonRow(
                          context,
                          title: 'Contact Person number',
                          valueWidget: RichText(
                            text: TextSpan(
                              text: '+91 ',
                              style: TextStyle(
                                color: AppTheme.getColor(context).primary,
                                fontSize:
                                    12 * Responsive.getResponsiveText(context),
                              ),
                              children: [
                                TextSpan(
                                  text: '9356326355',
                                  style: TextStyle(
                                    color: AppTheme.getColor(context).onSurface,
                                    fontSize:
                                        12 *
                                        Responsive.getResponsiveText(context),
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
                          title: 'Visit Status',
                          value: 'Approved',
                          textColor: AppTheme.getColor(context).secondary,
                          onTap: () {},
                        ),
                        getCommonRow(
                          context,
                          title: 'Visit Type',
                          value: 'Test visit',
                          onTap: () {},
                        ),
                        getCommonRow(
                          context,
                          title: 'Visit Purpose',
                          value: 'Feature check',
                          onTap: () {},
                        ),
                        getCommonRow(
                          context,
                          title: 'Address',
                          valueWidget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                '101, Sarkhej-sanand cross road Makaraba, Ahmedabad, Sarkhej-Gandhinagar Gujarat, 385431, India',
                                fontSize:
                                    10 * Responsive.getResponsiveText(context),
                                fontWeight: FontWeight.w500,
                              ),
                              CustomText(
                                '(you are in range)',
                                fontSize:
                                    12 * Responsive.getResponsiveText(context),
                                color: AppTheme.getColor(context).secondary,
                              ),
                            ],
                          ),
                          onTap: () {},
                          value: '',
                        ),
                        SizedBox(height: 0.007 * Responsive.getHeight(context)),
                        Divider(color: AppTheme.getColor(context).primary),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0.006 * Responsive.getWidth(context),
                            vertical: 0.0015 * Responsive.getHeight(context),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      'Start Visit date & Time',
                                      fontSize:
                                          14 *
                                          Responsive.getResponsiveText(context),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    SizedBox(height: 4),
                                    CustomText(
                                      '09:45AM, 21st May 2025',
                                      fontSize:
                                          14 *
                                          Responsive.getResponsiveText(context),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      'End Visit date & Time',
                                      fontSize:
                                          14 *
                                          Responsive.getResponsiveText(context),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    SizedBox(height: 4),
                                    CustomText(
                                      '12:45PM, 21st May 2025',
                                      fontSize:
                                          14 *
                                          Responsive.getResponsiveText(context),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 0.004 * Responsive.getHeight(context)),
                        Divider(color: AppTheme.getColor(context).primary),

                        getCommonRow(
                          context,
                          title: 'End Visit Remark',
                          value: 'sdfsdasgas',
                          onTap: () {},
                        ),
                        getCommonRow(
                          context,
                          title: 'End Visit Area',
                          value: 'sdfsdasgas',
                          onTap: () {},
                        ),
                        getCommonRow(
                          context,
                          title: 'End Visit Catalogue',
                          value: 'sdfsdasgas',
                          onTap: () {},
                        ),
                        getCommonRow(
                          context,
                          title: 'Contact Person number',
                          valueWidget: RichText(
                            text: TextSpan(
                              text: '+91 ',
                              style: TextStyle(
                                color: AppTheme.getColor(context).primary,
                                fontSize:
                                    12 * Responsive.getResponsiveText(context),
                              ),
                              children: [
                                TextSpan(
                                  text: '9356326355',
                                  style: TextStyle(
                                    color: AppTheme.getColor(context).onSurface,
                                    fontSize:
                                        12 *
                                        Responsive.getResponsiveText(context),
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
                      left: 0.018 * Responsive.getWidth(context),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          'Visit With',
                          fontSize: 14 * Responsive.getResponsiveText(context),
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(width: 0.015 * Responsive.getWidth(context)),
                        CustomText(':'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.016 * Responsive.getWidth(context),
                    ),
                    child: Column(
                      children: [
                        CustomTableWidget(),
                        SizedBox(height: 0.020 * Responsive.getHeight(context)),
                        Row(
                          children: [
                            MyCoButton(
                              onTap: () {},
                              backgroundColor: AppTheme.getColor(
                                context,
                              ).onPrimary,
                              title: 'Visit Complete',
                              width: 0.28 * Responsive.getWidth(context),
                              height: 0.030 * Responsive.getHeight(context),
                              boarderRadius: 20,
                              textStyle: TextStyle(
                                color: AppTheme.getColor(context).secondary,
                              ),
                              borderColor: AppTheme.getColor(context).secondary,
                            ),
                            Spacer(),
                            CustomText(
                              'View Attachment',
                              color: AppTheme.getColor(context).secondary,
                              fontSize:
                                  12 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              decorationColor: AppTheme.getColor(
                                context,
                              ).secondary,
                            ),
                          ],
                        ),
                        SizedBox(height: 0.017 * Responsive.getHeight(context)),
                        Row(
                          children: [
                            SvgPicture.asset('assets/visit_svgs/whats.svg'),
                            SizedBox(
                              width: 0.045 * Responsive.getWidth(context),
                            ),
                            SvgPicture.asset('assets/visit_svgs/share.svg'),
                            Spacer(),
                            MyCoButton(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VisitReport(),
                                  ),
                                );
                              },
                              title: 'View Report',
                              isShadowBottomLeft: true,
                              width: 0.33 * Responsive.getWidth(context),
                              height: 0.030 * Responsive.getHeight(context),
                              boarderRadius: 20,
                            ),
                          ],
                        ),
                        SizedBox(height: 0.020 * Responsive.getHeight(context)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
