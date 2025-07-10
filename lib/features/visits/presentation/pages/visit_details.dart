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

//Visit Details page
class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  void _handleDateSubmit(DateTime selectedDate) {
    print('Selected date: $selectedDate Welcome to future');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      leading: BackButton(),
      //  appBarText: 'visit Details',
      title: CustomText(
        'Visit Details',
        fontWeight: FontWeight.w700,
        fontSize: 18 * getResponsiveText(context),
      ),
    ),
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.055 * getWidth(context)),
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
                    horizontal: 0.01 * getWidth(context),
                    vertical: 0.001 * getHeight(context),
                  ),
                  child: Column(
                    children: [
                      getCommonRow(
                        context,
                        title: 'Contact Person name',
                        value: 'Jashvant Jatoliya',
                        textColor: AppTheme.getColor(context).onSurface,
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
                              fontSize: 12 * getResponsiveText(context),
                            ),
                            children: [
                              TextSpan(
                                text: '9356326355',
                                style: TextStyle(
                                  color: AppTheme.getColor(context).onSurface,
                                  fontSize: 12 * getResponsiveText(context),
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
                        textColor: AppTheme.getColor(context).onSurface,
                        onTap: () {},
                      ),
                      getCommonRow(
                        context,
                        title: 'Visit Purpose',
                        value: 'Feature check',
                        textColor: AppTheme.getColor(context).onSurface,
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
                              fontSize: 10 * getResponsiveText(context),
                              fontWeight: FontWeight.w500,
                            ),
                            CustomText(
                              '(you are in range)',
                              fontSize: 12 * getResponsiveText(context),
                              color: AppTheme.getColor(context).secondary,
                            ),
                          ],
                        ),
                        onTap: () {},
                        value: '',
                      ),
                      SizedBox(height: 0.007 * getHeight(context)),
                      Divider(color: AppTheme.getColor(context).primary),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.005 * getWidth(context),
                          vertical: 0.0015 * getHeight(context),
                        ),
                        child: Row(
                          spacing: 16,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    'Start Visit date & Time',
                                    fontSize: 14 * getResponsiveText(context),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  SizedBox(height: 4),
                                  CustomText(
                                    '09:45AM, 21st May 2025',
                                    fontSize: 14 * getResponsiveText(context),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    'End Visit date & Time',
                                    fontSize: 14 * getResponsiveText(context),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const SizedBox(height: 4),
                                  CustomText(
                                    '12:45PM, 21st May 2025',
                                    fontSize: 14 * getResponsiveText(context),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 0.004 * getHeight(context)),
                      Divider(color: AppTheme.getColor(context).primary),

                      getCommonRow(
                        context,
                        title: 'End Visit Remark',
                        value: 'sdfsdasgas',
                        textColor: AppTheme.getColor(context).onSurface,
                        onTap: () {},
                      ),
                      getCommonRow(
                        context,
                        title: 'End Visit Area',
                        value: 'sdfsdasgas',
                        textColor: AppTheme.getColor(context).onSurface,
                        onTap: () {},
                      ),
                      getCommonRow(
                        context,
                        title: 'End Visit Catalogue',
                        value: 'sdfsdasgas',
                        textColor: AppTheme.getColor(context).onSurface,
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
                              fontSize: 12 * getResponsiveText(context),
                            ),
                            children: [
                              TextSpan(
                                text: '9356326355',
                                style: TextStyle(
                                  color: AppTheme.getColor(context).onSurface,
                                  fontSize: 12 * getResponsiveText(context),
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
                  padding: EdgeInsets.only(left: 0.013 * getWidth(context)),
                  child: Row(
                    children: [
                      CustomText(
                        'Visit With',
                        fontSize: 14 * getResponsiveText(context),
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(width: 0.015 * getWidth(context)),
                      CustomText(':'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.016 * getWidth(context),
                  ),
                  child: Column(
                    children: [
                      CustomTableWidget(),
                      SizedBox(height: 0.012 * getHeight(context)),
                      Row(
                        children: [
                          MyCoButton(
                            onTap: () {},
                            backgroundColor: AppTheme.getColor(
                              context,
                            ).onPrimary,
                            title: 'Visit Complete',
                            width: 0.28 * getWidth(context),
                            height: 0.030 * getHeight(context),
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
                            fontSize: 12 * getResponsiveText(context),
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationColor: AppTheme.getColor(
                              context,
                            ).secondary,
                          ),
                        ],
                      ),
                      SizedBox(height: 0.017 * getHeight(context)),
                      Row(
                        children: [
                          SvgPicture.asset('assets/visit_svgs/whats.svg'),
                          SizedBox(width: 0.045 * getWidth(context)),
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
                            width: 0.28 * getWidth(context),
                            height: 0.03 * getHeight(context),
                            boarderRadius: 20,
                          ),
                        ],
                      ),
                      SizedBox(height: 0.040 * getHeight(context)),
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
