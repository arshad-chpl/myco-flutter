import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/payslip/presentation/bloc/ctc_bloc/ctc_bloc.dart';
import 'package:myco_flutter/features/payslip/presentation/bloc/ctc_bloc/ctc_event.dart';
import 'package:myco_flutter/features/payslip/presentation/bloc/ctc_bloc/ctc_state.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/payslip_card.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/shimmer_salary_loading.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class SalaryBreakUpPage extends StatefulWidget {
  const SalaryBreakUpPage({super.key});

  @override
  State<SalaryBreakUpPage> createState() => _SalaryBreakUpPageState();
}

class _SalaryBreakUpPageState extends State<SalaryBreakUpPage> {
  @override
  void initState() {
    super.initState();
    context.read<CtcDetailsBloc>().add(GetCtcDetailsEvent());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppbar(title: 'Salary Break-Up'),

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
          BlocBuilder<CtcDetailsBloc, CtcDetailsState>(
            builder: (context, state) {
              if (state is GetCtcDetailsLoadingState) {
                return const ShimmerSalaryLoadingWidget(loadingFor: 'ctc');
              }
              if (state is GetCtcDetailsSuccessState) {
                return Column(
                  children: [
                    // Earning Card
                    CommonCard(
                      title: 'earnings',
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
                                        color: AppTheme.getColor(
                                          context,
                                        ).outline,
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        right:
                                            0.1 * Responsive.getWidth(context),
                                        top:
                                            0.005 *
                                            Responsive.getHeight(context),
                                        bottom:
                                            0.005 *
                                            Responsive.getHeight(context),
                                      ),
                                      child: CustomText(
                                        'salary_head',
                                        fontWeight: FontWeight.w700,
                                        fontSize:
                                            14 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left:
                                            0.2 * Responsive.getWidth(context),
                                        top:
                                            0.005 *
                                            Responsive.getHeight(context),
                                        bottom:
                                            0.005 *
                                            Responsive.getHeight(context),
                                      ),
                                      child: CustomText(
                                        'amount'
                                        '(₹)',
                                        fontWeight: FontWeight.w700,
                                        fontSize:
                                            13 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        top:
                                            0.005 *
                                            Responsive.getHeight(context),
                                      ),
                                      child: CustomText(
                                        state
                                                .ctcDetails
                                                .earningHeads?[0]
                                                .headName ??
                                            'Basic',
                                        fontSize:
                                            12 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left:
                                            0.23 * Responsive.getWidth(context),
                                        top:
                                            0.005 *
                                            Responsive.getHeight(context),
                                        bottom:
                                            0.005 *
                                            Responsive.getHeight(context),
                                      ),
                                      child: CustomText(
                                        // '19,500.00',
                                        state
                                                .ctcDetails
                                                .earningHeads?[0]
                                                .salaryPerMonth ??
                                            '',
                                        fontSize:
                                            12 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        top:
                                            0.005 *
                                            Responsive.getHeight(context),
                                      ),
                                      child: CustomText(
                                        state
                                                .ctcDetails
                                                .earningHeads?[1]
                                                .headName ??
                                            'HRA',
                                        fontSize:
                                            12 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left:
                                            0.23 * Responsive.getWidth(context),
                                        top:
                                            0.005 *
                                            Responsive.getHeight(context),
                                        bottom:
                                            0.005 *
                                            Responsive.getHeight(context),
                                      ),
                                      child: CustomText(
                                        // '7,800.00',
                                        state
                                                .ctcDetails
                                                .earningHeads?[1]
                                                .salaryPerMonth ??
                                            '',
                                        fontSize:
                                            12 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        top:
                                            0.005 *
                                            Responsive.getHeight(context),
                                      ),
                                      child: CustomText(
                                        state
                                                .ctcDetails
                                                .earningHeads?[2]
                                                .headName ??
                                            'conveyance',
                                        // 'Conveyance',
                                        fontSize:
                                            12 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left:
                                            0.23 * Responsive.getWidth(context),
                                        top:
                                            0.005 *
                                            Responsive.getHeight(context),
                                        bottom:
                                            0.005 *
                                            Responsive.getHeight(context),
                                      ),
                                      child: CustomText(
                                        // '11,700.00',
                                        state
                                                .ctcDetails
                                                .earningHeads?[2]
                                                .salaryPerMonth ??
                                            '',
                                        fontSize:
                                            12 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        top:
                                            0.005 *
                                            Responsive.getHeight(context),
                                      ),
                                      child: CustomText(
                                        'gross_salary_per_month',
                                        // 'Gross Salary /\nper Month',
                                        fontSize:
                                            12 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left:
                                            0.23 * Responsive.getWidth(context),
                                        top:
                                            0.005 *
                                            Responsive.getHeight(context),
                                        bottom:
                                            0.005 *
                                            Responsive.getHeight(context),
                                      ),
                                      child: CustomText(
                                        // '39,000.00',
                                        state
                                                .ctcDetails
                                                .ctcHeads?[0]
                                                .ctcPerMonth ??
                                            '',
                                        fontSize:
                                            12 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        top:
                                            0.01 *
                                            Responsive.getHeight(context),
                                      ),
                                      child: CustomText(
                                        'Salary (CTC) /\nper Month',
                                        fontSize:
                                            12 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left:
                                            0.23 * Responsive.getWidth(context),
                                        top:
                                            0.005 *
                                            Responsive.getHeight(context),
                                        bottom:
                                            0.005 *
                                            Responsive.getHeight(context),
                                      ),
                                      child: CustomText(
                                        // '39,000.00',
                                        state
                                                .ctcDetails
                                                .ctcHeads?[0]
                                                .ctcPerAnnum ??
                                            '',
                                        fontSize:
                                            12 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
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
                                  state
                                          .ctcDetails
                                          .deductionHeads?[1]
                                          .headName ??
                                      'professional_tex',
                                  // 'Professional Tax',
                                  color: AppTheme.getColor(context).onSurface,
                                  fontSize:
                                      14 *
                                      Responsive.getResponsiveText(context),
                                  fontWeight: FontWeight.w500,
                                ),
                                CustomText(
                                  // '₹2,222.00',
                                  state
                                          .ctcDetails
                                          .deductionHeads?[0]
                                          .perMonth ??
                                      '',
                                  color: AppTheme.getColor(context).onSurface,
                                  fontSize:
                                      14 *
                                      Responsive.getResponsiveText(context),
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
                                      15 *
                                      Responsive.getResponsiveText(context),
                                ),
                                CustomText(
                                  // '₹2,222.00',
                                  state
                                          .ctcDetails
                                          .deductionHeads?[1]
                                          .perMonth ??
                                      '',
                                  color: AppTheme.getColor(context).onSurface,
                                  fontWeight: FontWeight.w700,
                                  fontSize:
                                      15 *
                                      Responsive.getResponsiveText(context),
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
                                  'salary_in_hand_per_month',
                                  // 'Salary in Hand (Per Month)',
                                  color: AppTheme.getColor(context).onSurface,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      15 *
                                      Responsive.getResponsiveText(context),
                                ),
                                CustomText(
                                  // '₹38,800.00',
                                  state.ctcDetails.netSalaryPerMonthInHand ??
                                      '',
                                  color: AppTheme.getColor(context).onSurface,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      15 *
                                      Responsive.getResponsiveText(context),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.005 * Responsive.getHeight(context),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  'Salary (CTC) / (Per Year)',
                                  color: AppTheme.getColor(context).onSurface,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      15 *
                                      Responsive.getResponsiveText(context),
                                ),
                                CustomText(
                                  // '₹468,000.00',
                                  state.ctcDetails.netSalaryPerAnnumInHand ??
                                      '',
                                  color: AppTheme.getColor(context).onSurface,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      15 *
                                      Responsive.getResponsiveText(context),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }

              return Column(
                children: [
                  SizedBox(height: 0.3 * Responsive.getHeight(context)),
                  CustomText(
                    state is GetCtcDetailsErrorState
                        ? 'ERROR : ${state.error}'
                        : 'Something Went Wrong',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    ),
  );
}
