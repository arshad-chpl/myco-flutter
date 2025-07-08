import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/custom_piechart.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/header_custom_painter.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/payslip_card.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class PayslipDetail extends StatelessWidget {
  const PayslipDetail({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CustomPaint(
                  size: Size(getWidth(context), 0.55 * getHeight(context)),
                  painter: HeaderCustomPainter(),
                ),
                Column(
                  children: [
                    AppBar(
                      backgroundColor: AppTheme.getColor(context).primary,
                      centerTitle: false,
                      leading: BackButton(
                        color: AppTheme.getColor(context).onPrimary,
                      ),
                      title: CustomText(
                        'Payslip March 2025',
                        color: AppTheme.getColor(context).onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 0.02 * getHeight(context)),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.08 * getWidth(context),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.04 * getWidth(context),
                          vertical: 0.01 * getHeight(context),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            8 * getResponsive(context),
                          ),
                          border: Border.all(
                            color: AppTheme.getColor(context).outline,
                          ),
                          color: AppTheme.getColor(context).onPrimary,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  'NET PAY',
                                  fontWeight: FontWeight.w600,
                                ),
                                CustomText(
                                  'SALARY MODE',
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            SizedBox(height: 0.005 * getHeight(context)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  '₹38,800.00',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28 * getResponsiveText(context),
                                  color: AppTheme.getColor(context).primary,
                                ),
                                CustomText(
                                  'Bank Transaction',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16 * getResponsiveText(context),
                                  color: AppTheme.getColor(context).outline,
                                ),
                              ],
                            ),
                            SizedBox(height: 0.01 * getHeight(context)),
                            Divider(
                              thickness: 0.4,
                              color: AppTheme.getColor(context).onSurface,
                            ),
                            SizedBox(height: 0.005 * getHeight(context)),
                            const CustomText(
                              'Net Pay (In Words)',
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.start,
                            ),
                            CustomText(
                              'Thirty Eight Thousands Eight Hundred Only',
                              fontSize: 14 * getResponsiveText(context),
                              color: AppTheme.getColor(context).primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Pie Chart
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.06 * getWidth(context),
                      ),
                      child: CustomLinePieChart(
                        isValueOnChart: true,
                        totalLeaves: 12.0,
                        totalPaidLeave: 4.0,
                        height: 0.35 * getHeight(context),
                        innerRadius: 80 * getResponsive(context),
                        dynamicCenterText: 'PaySlip',
                        segments: [
                          LineChartSegment(
                            label: 'Month Days',
                            value: 2,
                            color: const Color(0xFF08A4BB),
                          ),
                          LineChartSegment(
                            label: 'Paid Holiday',
                            value: 2,
                            color: const Color(0xFFFF9FEC),
                          ),
                          LineChartSegment(
                            label: 'Extra Day',
                            value: 2,
                            showShadow: false,
                            color: const Color(0xFF2F648E),
                          ),
                          LineChartSegment(
                            label: 'Paid Leaves',
                            showShadow: false,
                            value: 2,
                            color: const Color(0xFF2FBBA4),
                          ),
                          LineChartSegment(
                            label: 'Week Off',
                            value: 2,
                            color: const Color(0xFF9FBE00),
                          ),
                          LineChartSegment(
                            label: 'Present Days',
                            value: 2,
                            color: const Color(0xFFFDB913),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Earning Card
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.08 * getWidth(context),
              ),
              child: CommonCard(
                title: 'Earnings',
                bottomWidget: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.04 * getWidth(context),
                    vertical: 0.01 * getHeight(context),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'Basic',
                            color: AppTheme.getColor(context).onSurface,
                            fontSize: 15 * getResponsiveText(context),
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            '₹190,780.78',
                            color: AppTheme.getColor(context).onSurface,
                            fontSize: 15 * getResponsiveText(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'HRA',
                            color: AppTheme.getColor(context).onSurface,
                            fontSize: 15 * getResponsiveText(context),
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            '₹87,780.78',
                            color: AppTheme.getColor(context).onSurface,
                            fontSize: 15 * getResponsiveText(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'Conveyance',
                            color: AppTheme.getColor(context).onSurface,
                            fontSize: 15 * getResponsiveText(context),
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            '₹103,930.29',
                            color: AppTheme.getColor(context).onSurface,
                            fontSize: 15 * getResponsiveText(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      const DottedLineWidget(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'Gross Salary (A)',
                            color: AppTheme.getColor(context).onSurface,
                            fontWeight: FontWeight.w800,
                            fontSize: 15 * getResponsiveText(context),
                          ),
                          CustomText(
                            '₹395,086.90',
                            color: AppTheme.getColor(context).onSurface,
                            fontWeight: FontWeight.w700,
                            fontSize: 15 * getResponsiveText(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 0.015 * getHeight(context)),
            // Deductions Card
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.08 * getWidth(context),
              ),
              child: CommonCard(
                title: 'Deductions',
                headerColor: AppTheme.getColor(context).error,
                bottomWidget: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.04 * getWidth(context),
                    vertical: 0.01 * getHeight(context),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'Professional Tax',
                            color: AppTheme.getColor(context).onSurface,
                            fontSize: 14 * getResponsiveText(context),
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            '₹2,222.00',
                            color: AppTheme.getColor(context).onSurface,
                            fontSize: 14 * getResponsiveText(context),
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
                            fontSize: 15 * getResponsiveText(context),
                          ),
                          CustomText(
                            '₹2,222.00',
                            color: AppTheme.getColor(context).onSurface,
                            fontWeight: FontWeight.w700,
                            fontSize: 15 * getResponsiveText(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 0.015 * getHeight(context)),
            // Net Pay Card
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.08 * getWidth(context),
              ),
              child: CommonCard(
                title: 'Net Pay',
                headerColor: AppTheme.getColor(context).primary,
                bottomWidget: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.04 * getWidth(context),
                    vertical: 0.01 * getHeight(context),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'Net Salary (A-B)',
                            color: AppTheme.getColor(context).onSurface,
                            fontWeight: FontWeight.bold,
                            fontSize: 15 * getResponsiveText(context),
                          ),
                          CustomText(
                            '₹2,222.00',
                            color: AppTheme.getColor(context).onSurface,
                            fontWeight: FontWeight.bold,
                            fontSize: 15 * getResponsiveText(context),
                          ),
                        ],
                      ),
                      const DottedLineWidget(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'Net Pay',
                            color: AppTheme.getColor(context).primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18 * getResponsiveText(context),
                          ),
                          CustomText(
                            '₹38,800.00',
                            color: AppTheme.getColor(context).primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18 * getResponsiveText(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 0.015 * getHeight(context)),
            // Total CTC
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.08 * getWidth(context),
              ),
              child: CommonCard(
                title: 'Total CTC',
                headerColor: AppColors.myCoCyan,
                bottomWidget: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.04 * getWidth(context),
                    vertical: 0.01 * getHeight(context),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'Total Employees Contribution ',
                            color: AppTheme.getColor(context).onSurface,
                            fontWeight: FontWeight.bold,
                            fontSize: 15 * getResponsiveText(context),
                          ),
                          CustomText(
                            '₹0.00',
                            color: AppTheme.getColor(context).onSurface,
                            fontWeight: FontWeight.bold,
                            fontSize: 15 * getResponsiveText(context),
                          ),
                        ],
                      ),
                      const DottedLineWidget(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'Total CTC',
                            color: AppColors.myCoCyan,
                            fontWeight: FontWeight.bold,
                            fontSize: 18 * getResponsiveText(context),
                          ),
                          CustomText(
                            '₹39,000.00',
                            color: AppColors.myCoCyan,
                            fontWeight: FontWeight.bold,
                            fontSize: 18 * getResponsiveText(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 0.02 * getHeight(context)),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.08 * getWidth(context),
              ),
              child: Row(
                spacing: 14,
                children: [
                  Expanded(
                    child: MyCoButton(
                      onTap: () {},
                      title: 'Download',
                      textStyle: TextStyle(
                        color: AppTheme.getColor(context).onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                      boarderRadius: 30 * getResponsive(context),
                      height: 0.05 * getHeight(context),
                    ),
                  ),
                  Expanded(
                    child: MyCoButton(
                      onTap: () {
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(20),
                          ),
                          clipBehavior: Clip.hardEdge,
                          useSafeArea: true,
                          context: context,
                          builder: (context) => Container(),
                        );
                      },
                      title: 'Raise An Issue',
                      boarderRadius: 30 * getResponsive(context),
                      textStyle: TextStyle(
                        color: AppTheme.getColor(context).primary,
                        fontWeight: FontWeight.w600,
                      ),
                      height: 0.05 * getHeight(context),
                      backgroundColor: AppTheme.getColor(context).onPrimary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.02 * getHeight(context)),
          ],
        ),
      ),
    ),
  );
}
