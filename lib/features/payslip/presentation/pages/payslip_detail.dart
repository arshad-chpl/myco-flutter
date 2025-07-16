import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/custom_piechart.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/header_custom_painter.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/payslip_card.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/bottomsheet_config.dart';
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
                  size: Size(
                    Responsive.getWidth(context),
                    0.55 * Responsive.getHeight(context),
                  ),
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
                        'payslip' + 'March 2025',
                        // 'Payslip March 2025',
                        color: AppTheme.getColor(context).onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 0.02 * Responsive.getHeight(context)),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.08 * Responsive.getWidth(context),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.04 * Responsive.getWidth(context),
                          vertical: 0.01 * Responsive.getHeight(context),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            8 * Responsive.getResponsive(context),
                          ),
                          border: Border.all(
                            color: AppTheme.getColor(context).outline,
                          ),
<<<<<<< HEAD
                          color: AppTheme.getColor(context).onPrimary,
=======
                          color: AppTheme.getColor(context).surface,
>>>>>>> harshgiri
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  'net_pay',
                                  // 'NET PAY',
                                  fontWeight: FontWeight.w600,
                                ),
                                CustomText(
                                  'salary_mode',
                                  // 'SALARY MODE',
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.005 * Responsive.getHeight(context),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  '₹38,800.00',
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      28 *
                                      Responsive.getResponsiveText(context),
                                  color: AppTheme.getColor(context).primary,
                                ),
                                CustomText(
                                  'bank_transaction',
                                  // 'Bank Transaction',
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      16 *
                                      Responsive.getResponsiveText(context),
                                  color: AppTheme.getColor(context).outline,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.01 * Responsive.getHeight(context),
                            ),
                            Divider(
                              thickness: 0.4,
                              color: AppTheme.getColor(context).onSurface,
                            ),
                            SizedBox(
                              height: 0.005 * Responsive.getHeight(context),
                            ),
                            const CustomText(
                              'net_pay' + '(In Words)',
                              // 'Net Pay (In Words)',
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.start,
                            ),
                            CustomText(
                              'Thirty Eight Thousands Eight Hundred Only',
                              fontSize:
                                  14 * Responsive.getResponsiveText(context),
                              color: AppTheme.getColor(context).primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: 0.08 * Responsive.getWidth(context),
                      ),
                      child: CustomLinePieChart(
                        isValueOnChart: true,
                        totalLeaves: 12.0,
                        totalPaidLeave: 4.0,
                        height: 0.35 * Responsive.getHeight(context),
                        innerRadius: 80 * Responsive.getResponsive(context),
                        segments: [
                          LineChartSegment(
                            label: 'Sandwich',
                            value: 2,
                            color: const Color(0xFF08A4BB),
                          ),
                          LineChartSegment(
                            label: 'Paid',
                            value: 2,
                            color: const Color(0xFFFF9FEC),
                          ),
                          LineChartSegment(
                            label: 'Paid',
                            value: 2,
                            showShadow: false,
                            color: const Color(0xFF2F648E),
                          ),
                          LineChartSegment(
                            label: 'Unpaid',
                            showShadow: false,
                            value: 2,
                            color: const Color(0xFF2FBBA4),
                          ),
                          LineChartSegment(
                            label: 'Unpaid',
                            value: 2,
                            color: const Color(0xFF9FBE00),
                          ),
                          LineChartSegment(
                            label: 'Holiday',
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

            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.08 * Responsive.getWidth(context),
              ),
              child: CommonCard(
                title: 'earnings',
                // 'Earnings',
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
                            'Basic',
                            color: AppTheme.getColor(context).onSurface,
                            fontSize:
                                15 * Responsive.getResponsiveText(context),
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            '₹190,780.78',
                            color: AppTheme.getColor(context).onSurface,
                            fontSize:
                                15 * Responsive.getResponsiveText(context),
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
                            fontSize:
                                15 * Responsive.getResponsiveText(context),
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            '₹87,780.78',
                            color: AppTheme.getColor(context).onSurface,
                            fontSize:
                                15 * Responsive.getResponsiveText(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'conveyance',
                            // 'Conveyance',
                            color: AppTheme.getColor(context).onSurface,
                            fontSize:
                                15 * Responsive.getResponsiveText(context),
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            '₹103,930.29',
                            color: AppTheme.getColor(context).onSurface,
                            fontSize:
                                15 * Responsive.getResponsiveText(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
<<<<<<< HEAD
                      const DottedLineWidget(),
=======
                      DottedLineWidget(
                        color: AppTheme.getColor(context).onSurface,
                      ),
>>>>>>> harshgiri
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'gross_pay' + '(A)',
                            // 'Gross Salary (A)',
                            color: AppTheme.getColor(context).onSurface,
                            fontWeight: FontWeight.w800,
                            fontSize:
                                15 * Responsive.getResponsiveText(context),
                          ),
                          CustomText(
                            '₹395,086.90',
                            color: AppTheme.getColor(context).onSurface,
                            fontWeight: FontWeight.w700,
                            fontSize:
                                15 * Responsive.getResponsiveText(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 0.01 * Responsive.getHeight(context)),
            // Deductions Card
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.08 * Responsive.getWidth(context),
              ),
              child: CommonCard(
                title: 'deductions',
                //  'Deductions',
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
                            'professional_tex',
                            // 'Professional Tax',
                            color: AppTheme.getColor(context).onSurface,
                            fontSize:
                                14 * Responsive.getResponsiveText(context),
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            '₹2,222.00',
                            color: AppTheme.getColor(context).onSurface,
                            fontSize:
                                14 * Responsive.getResponsiveText(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
<<<<<<< HEAD
                      const DottedLineWidget(),
=======
                      DottedLineWidget(
                        color: AppTheme.getColor(context).onSurface,
                      ),
>>>>>>> harshgiri
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'total_deductions',
                            // 'Total Deduction',
                            color: AppTheme.getColor(context).onSurface,
                            fontWeight: FontWeight.w700,
                            fontSize:
                                15 * Responsive.getResponsiveText(context),
                          ),
                          CustomText(
                            '₹2,222.00',
                            color: AppTheme.getColor(context).onSurface,
                            fontWeight: FontWeight.w700,
                            fontSize:
                                15 * Responsive.getResponsiveText(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: .01 * Responsive.getHeight(context)),
            // Net Pay Card
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.08 * Responsive.getWidth(context),
              ),
              child: CommonCard(
                title: 'net_pay',
                // 'Net Pay',
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
                            'net_salary' + '(A-B)',
                            // 'Net Salary (A-B)',
                            color: AppTheme.getColor(context).onSurface,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                15 * Responsive.getResponsiveText(context),
                          ),
                          CustomText(
                            '₹2,222.00',
                            color: AppTheme.getColor(context).onSurface,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                15 * Responsive.getResponsiveText(context),
                          ),
                        ],
                      ),
<<<<<<< HEAD
                      const DottedLineWidget(),
=======
                      DottedLineWidget(
                        color: AppTheme.getColor(context).onSurface,
                      ),
>>>>>>> harshgiri
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'net_pay',
                            // 'Net Pay',
                            color: AppTheme.getColor(context).primary,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                18 * Responsive.getResponsiveText(context),
                          ),
                          CustomText(
                            '₹38,800.00',
                            color: AppTheme.getColor(context).primary,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                18 * Responsive.getResponsiveText(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 0.01 * Responsive.getHeight(context)),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.08 * Responsive.getWidth(context),
              ),
              child: CommonCard(
                title: 'total_ctc',
                //  'Total CTC',
                headerColor: AppColors.myCoCyan,
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
                            'total_employers_contribution',
                            // 'Total Employees Contributiuon',
                            color: AppTheme.getColor(context).onSurface,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                15 * Responsive.getResponsiveText(context),
                          ),
                          CustomText(
                            '₹0.00',
                            color: AppTheme.getColor(context).onSurface,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                15 * Responsive.getResponsiveText(context),
                          ),
                        ],
                      ),
<<<<<<< HEAD
                      const DottedLineWidget(),
=======
                      DottedLineWidget(
                        color: AppTheme.getColor(context).onSurface,
                      ),
>>>>>>> harshgiri
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'total_ctc',
                            // 'Total CTC',
                            color: AppColors.myCoCyan,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                18 * Responsive.getResponsiveText(context),
                          ),
                          CustomText(
                            '₹38,800.00',
                            color: AppColors.myCoCyan,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                18 * Responsive.getResponsiveText(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 0.02 * Responsive.getHeight(context)),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.08 * Responsive.getWidth(context),
              ),
              child: Row(
                spacing: 14,
                children: [
                  Expanded(
                    child: MyCoButton(
                      onTap: () {},
                      title: 'Download',
                      height: 0.045 * Responsive.getHeight(context),
                      boarderRadius: 30 * Responsive.getResponsive(context),
                    ),
                  ),
                  Expanded(
                    child: MyCoButton(
                      onTap: () {
                        getBottomSheet(context, Container());
                      },
                      title: 'Raise An Issue',
                      height: 0.045 * Responsive.getHeight(context),
                      boarderRadius: 30 * Responsive.getResponsive(context),
                      backgroundColor: AppTheme.getColor(context).onPrimary,
                      textStyle: TextStyle(
                        color: AppTheme.getColor(context).primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.05 * Responsive.getHeight(context)),
          ],
        ),
      ),
    ),
  );
}
