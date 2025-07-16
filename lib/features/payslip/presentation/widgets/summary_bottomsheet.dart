import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/payslip_card.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class SummaryBottomsheet extends StatelessWidget {
  const SummaryBottomsheet({super.key});

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(
      horizontal: 0.06 * Responsive.getWidth(context),
    ),
    child: Column(
      children: [
        Row(
          children: [
            const BackButton(),
            CustomText(
              'summary',
              // 'Summary',
              color: AppTheme.getColor(context).onSurface,
              fontSize: 18 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w700,
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.all(16.0 * Responsive.getResponsive(context)),
          child: Column(
            children: [
              CommonCard(
                title: 'earnings',
                //  'Earnings',
                bottomWidget: Container(
                  child: Padding(
                    padding: EdgeInsets.all(
                      10.0 * Responsive.getResponsive(context),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              'paid_leave_allowance',
                              // 'Paid Leave Allowance',
                              color: AppTheme.getColor(context).onSurface,
                              fontSize:
                                  15 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w500,
                            ),
                            CustomText(
                              '₹13,525.08',
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
                              'leave_inCaseMent',
                              // 'Leave Encashment',
                              color: AppTheme.getColor(context).onSurface,
                              fontSize:
                                  15 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w500,
                            ),
                            CustomText(
                              '₹928.00',
                              color: AppTheme.getColor(context).onSurface,
                              fontSize:
                                  15 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        DottedLineWidget(
                          color: AppTheme.getColor(context).onSurface,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              'total_earnings',
                              // 'Total Earnings',
                              color: AppTheme.getColor(context).onSurface,
                              fontWeight: FontWeight.w700,
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
              SizedBox(height: .025 * Responsive.getHeight(context)),
              CommonCard(
                title: 'deductions',
                // 'Deductions',
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
                                16 * Responsive.getResponsiveText(context),
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            '₹2,222.00',
                            color: AppTheme.getColor(context).onSurface,
                            fontSize:
                                16 * Responsive.getResponsiveText(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      DottedLineWidget(
                        color: AppTheme.getColor(context).onSurface,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'gross_deduction',
                            // 'Total Deduction',
                            color: AppTheme.getColor(context).onSurface,
                            fontWeight: FontWeight.w700,
                            fontSize:
                                16 * Responsive.getResponsiveText(context),
                          ),
                          CustomText(
                            '₹2,222.00',
                            color: AppTheme.getColor(context).onSurface,
                            fontWeight: FontWeight.w700,
                            fontSize:
                                16 * Responsive.getResponsiveText(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: .03 * Responsive.getHeight(context)),
              CommonCard(
                title: 'employer_contribution',
                //  'Employee’s Contribution',
                headerColor: AppTheme.getColor(context).primary,
                bottomWidget: Container(
                  child: Padding(
                    padding: EdgeInsets.all(
                      10.0 * Responsive.getResponsive(context),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              'total_employers_contribution',
                              // 'Total Employee’s Contribution',
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
