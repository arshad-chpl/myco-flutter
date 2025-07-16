import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/payslip_card.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class SalaryBreakUpPage extends StatelessWidget {
  const SalaryBreakUpPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: const BackButton(),
      title: const CustomText('Salary Break-Up', fontWeight: FontWeight.w700),
      centerTitle: false,
    ),
    body: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.08 * Responsive.getWidth(context),
      ),
      child: Column(
        children: [
          MyCustomTabBar(
            tabs: const ['Monthly', 'Annually'],
            selectedBgColors: [
              AppTheme.getColor(context).secondary,
              AppTheme.getColor(context).primary,
            ],
            unselectedBorderAndTextColor: AppTheme.getColor(context).primary,
            tabBarBorderColor: AppColors.black,
            selectedIndex: 0,
            isShadowBottomLeft: true,
          ),

          SizedBox(height: 0.02 * Responsive.getHeight(context)),
          // Earning Card
          CommonCard(
            title: 'Earnings',
            bottomWidget: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.04 * Responsive.getWidth(context),
                vertical: 0.01 * Responsive.getHeight(context),
              ),
              child: Column(
                children: [
                  Table(
                    border: TableBorder(
                      verticalInside: BorderSide(
                        color: AppTheme.getColor(context).outline,
                      ),
                    ),
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppTheme.getColor(context).outline,
                              width: 0.5,
                            ),
                          ),
                        ),
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              right: 0.1 * Responsive.getWidth(context),
                              top: 0.005 * Responsive.getHeight(context),
                              bottom: 0.005 * Responsive.getHeight(context),
                            ),
                            child: CustomText(
                              'Salary Heading',
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  14 * Responsive.getResponsiveText(context),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 0.2 * Responsive.getWidth(context),
                              top: 0.005 * Responsive.getHeight(context),
                              bottom: 0.005 * Responsive.getHeight(context),
                            ),
                            child: CustomText(
                              'Amount (₹)',
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  14 * Responsive.getResponsiveText(context),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 0.005 * Responsive.getHeight(context),
                            ),
                            child: CustomText(
                              'Basic',
                              fontSize:
                                  12 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 0.23 * Responsive.getWidth(context),
                              top: 0.005 * Responsive.getHeight(context),
                              bottom: 0.005 * Responsive.getHeight(context),
                            ),
                            child: CustomText(
                              '19,500.00',
                              fontSize:
                                  12 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 0.005 * Responsive.getHeight(context),
                            ),
                            child: CustomText(
                              'HRA',
                              fontSize:
                                  12 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 0.23 * Responsive.getWidth(context),
                              top: 0.005 * Responsive.getHeight(context),
                              bottom: 0.005 * Responsive.getHeight(context),
                            ),
                            child: CustomText(
                              '7,800.00',
                              fontSize:
                                  12 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 0.005 * Responsive.getHeight(context),
                            ),
                            child: CustomText(
                              'Conveyance',
                              fontSize:
                                  12 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 0.23 * Responsive.getWidth(context),
                              top: 0.005 * Responsive.getHeight(context),
                              bottom: 0.005 * Responsive.getHeight(context),
                            ),
                            child: CustomText(
                              '11,700.00',
                              fontSize:
                                  12 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 0.005 * Responsive.getHeight(context),
                            ),
                            child: CustomText(
                              'Gross Salary /\nper Month',
                              fontSize:
                                  12 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 0.23 * Responsive.getWidth(context),
                              top: 0.005 * Responsive.getHeight(context),
                              bottom: 0.005 * Responsive.getHeight(context),
                            ),
                            child: CustomText(
                              '39,000.00',
                              fontSize:
                                  12 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 0.01 * Responsive.getHeight(context),
                            ),
                            child: CustomText(
                              'Salary (CTC) /\nper Month',
                              fontSize:
                                  12 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 0.23 * Responsive.getWidth(context),
                              top: 0.005 * Responsive.getHeight(context),
                              bottom: 0.005 * Responsive.getHeight(context),
                            ),
                            child: CustomText(
                              '39,000.00',
                              fontSize:
                                  12 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: .02 * Responsive.getHeight(context)),
          // Deductions Card
          CommonCard(
            title: 'Deductions',
            headerColor: AppTheme.getColor(context).error,
            bottomWidget: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.04 * Responsive.getWidth(context),
                vertical: 0.01 * Responsive.getHeight(context),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        'Professional Tax',
                        color: AppTheme.getColor(context).onSurface,
                        fontSize: 14 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.w500,
                      ),
                      CustomText(
                        '₹2,222.00',
                        color: AppTheme.getColor(context).onSurface,
                        fontSize: 14 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const DottedLineWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        'Total Deduction',
                        color: AppTheme.getColor(context).onSurface,
                        fontWeight: FontWeight.w700,
                        fontSize: 15 * Responsive.getResponsiveText(context),
                      ),
                      CustomText(
                        '₹2,222.00',
                        color: AppTheme.getColor(context).onSurface,
                        fontWeight: FontWeight.w700,
                        fontSize: 15 * Responsive.getResponsiveText(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: .02 * Responsive.getHeight(context)),
          // Net Pay Card
          CommonCard(
            title: 'Net Pay',
            headerColor: AppTheme.getColor(context).primary,
            bottomWidget: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.04 * Responsive.getWidth(context),
                vertical: 0.01 * Responsive.getHeight(context),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        'Salary in Hand (Per Month)',
                        color: AppTheme.getColor(context).onSurface,
                        fontWeight: FontWeight.bold,
                        fontSize: 15 * Responsive.getResponsiveText(context),
                      ),
                      CustomText(
                        '₹38,800.00',
                        color: AppTheme.getColor(context).onSurface,
                        fontWeight: FontWeight.bold,
                        fontSize: 15 * Responsive.getResponsiveText(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.005 * Responsive.getHeight(context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        'Salary (CTC) / (Per Year)',
                        color: AppTheme.getColor(context).onSurface,
                        fontWeight: FontWeight.bold,
                        fontSize: 15 * Responsive.getResponsiveText(context),
                      ),
                      CustomText(
                        '₹468,000.00',
                        color: AppTheme.getColor(context).onSurface,
                        fontWeight: FontWeight.bold,
                        fontSize: 15 * Responsive.getResponsiveText(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
