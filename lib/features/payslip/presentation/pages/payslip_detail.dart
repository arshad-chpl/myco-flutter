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
                        'Payslip March 2025',
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
                                  'Bank Transaction',
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
                              'Net Pay (In Words)',
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
                  ],
                ),
              ],
            ),
            SizedBox(height: 0.02 * Responsive.getHeight(context)),
          ],
        ),
      ),
    ),
  );
}
