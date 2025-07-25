import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/features/payslip/presentation/bloc/payslip_details_bloc/payslip_details_bloc.dart';
import 'package:myco_flutter/features/payslip/presentation/bloc/payslip_details_bloc/payslip_details_event.dart';
import 'package:myco_flutter/features/payslip/presentation/bloc/payslip_details_bloc/payslip_details_state.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/custom_piechart.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/header_custom_painter.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/payslip_card.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/payslip_webview.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/shimmer_salary_loading.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/bottomsheet_config.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/side_by_side_buttons.dart';
import 'package:myco_flutter/widgets/big_textfield.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class PayslipDetail extends StatefulWidget {
  final String salarySlipId;
  const PayslipDetail({super.key, required this.salarySlipId});

  @override
  State<PayslipDetail> createState() => _PayslipDetailState();
}

class _PayslipDetailState extends State<PayslipDetail> {
  TextEditingController raiseIssueController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<PayslipDetailBloc>().add(
      GetSalaryDetailsEvent(salarySlipId: widget.salarySlipId),
    );
  }

  void openPayslipInWebView(String url) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PayslipWebViewScreen(url: url)),
    );
  }

  Future<void> printPayslipFromUrl(String url) async {
    openPayslipInWebView(url);
  }

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      body: BlocConsumer<PayslipDetailBloc, PayslipDetailsState>(
        listener: (context, state) {
          if (state is AddSalaryIssueSuccessState) {
            // context.read<PayslipBloc>().add(GetSalaryDetailsEvent());
            raiseIssueController.clear();
            Navigator.pop(context);
          }

          if (state is AddSalaryIssueFailureState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is GetSalaryDetailsLoadingState) {
            return const ShimmerSalaryLoadingWidget(
              loadingFor: 'payslipDetails',
            );
          }

          if (state is GetSalaryDetailsErrorState) {
            return Center(child: Text(state.error));
          }

          if (state is GetSalaryDetailsSuccessState) {
            return SingleChildScrollView(
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
                              'payslip ${state.salaryDetails.salaryMonthYear}',
                              // 'Payslip March 2025',
                              color: AppTheme.getColor(context).onPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(
                            height: 0.02 * Responsive.getHeight(context),
                          ),

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
                                color: AppTheme.getColor(context).surface,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                    height:
                                        0.005 * Responsive.getHeight(context),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        // '₹38,800.00',
                                        state.salaryDetails.totalNetSalary ??
                                            '',
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            28 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                        color: AppTheme.getColor(
                                          context,
                                        ).primary,
                                      ),
                                      CustomText(
                                        // 'bank_transaction',
                                        state.salaryDetails.salaryMode ?? '',
                                        // 'Bank Transaction',
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            16 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                        color: AppTheme.getColor(
                                          context,
                                        ).outline,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        0.01 * Responsive.getHeight(context),
                                  ),
                                  Divider(
                                    thickness: 0.4,
                                    color: AppTheme.getColor(context).onSurface,
                                  ),
                                  SizedBox(
                                    height:
                                        0.005 * Responsive.getHeight(context),
                                  ),
                                  const CustomText(
                                    'net_pay' + '(In Words)',
                                    // 'Net Pay (In Words)',
                                    fontWeight: FontWeight.w600,
                                    textAlign: TextAlign.start,
                                  ),
                                  CustomText(
                                    // 'Thirty Eight Thousands Eight Hundred Only',
                                    state.salaryDetails.amountInWords ?? '',
                                    fontSize:
                                        14 *
                                        Responsive.getResponsiveText(context),
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
                              dynamicCenterText: 'Payslip',
                              totalLeaves: 12.0,
                              totalPaidLeave: 4.0,
                              height: 0.35 * Responsive.getHeight(context),
                              innerRadius:
                                  80 * Responsive.getResponsive(context),
                              segments: [
                                LineChartSegment(
                                  label: 'Leave Days',
                                  value: double.parse(
                                    state.salaryDetails.leaveDays ?? '0',
                                  ),
                                  color: const Color(0xFF08A4BB),
                                ),
                                LineChartSegment(
                                  label: 'Extra Days',
                                  value: double.parse(
                                    state.salaryDetails.extraDays ?? '0',
                                  ),
                                  color: const Color(0xFFFF9FEC),
                                ),
                                LineChartSegment(
                                  label: 'Paid Week Off',
                                  value: double.parse(
                                    state.salaryDetails.paidWeekOff ?? '0',
                                  ),
                                  showShadow: false,
                                  color: const Color(0xFF2F648E),
                                ),
                                LineChartSegment(
                                  label: 'Total Working Days',
                                  value: double.parse(
                                    state.salaryDetails.totalWorkingDays ?? '0',
                                  ),
                                  color: const Color(0xFF9FBE00),
                                ),
                                LineChartSegment(
                                  label: 'Paid Holidays',
                                  value: double.parse(
                                    state.salaryDetails.paidHolidays ?? '0',
                                  ),
                                  color: const Color(0xFF2FBBA4),
                                ),
                                LineChartSegment(
                                  label: 'Total Special Allowance',
                                  value: double.parse(
                                    state.salaryDetails.totalSpecialAllowance ??
                                        '0',
                                  ),
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
                                  state.salaryDetails.earningData?[0]?.title ??
                                      'Basic',
                                  color: AppTheme.getColor(context).onSurface,
                                  fontSize:
                                      15 *
                                      Responsive.getResponsiveText(context),
                                  fontWeight: FontWeight.w500,
                                ),
                                CustomText(
                                  // '₹190,780.78',
                                  state.salaryDetails.earningData?[0]?.value ??
                                      '',
                                  color: AppTheme.getColor(context).onSurface,
                                  fontSize:
                                      15 *
                                      Responsive.getResponsiveText(context),
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  state.salaryDetails.earningData?[1]?.title ??
                                      'HRA',
                                  color: AppTheme.getColor(context).onSurface,
                                  fontSize:
                                      15 *
                                      Responsive.getResponsiveText(context),
                                  fontWeight: FontWeight.w500,
                                ),
                                CustomText(
                                  state.salaryDetails.earningData?[1]?.value ??
                                      '',
                                  color: AppTheme.getColor(context).onSurface,
                                  fontSize:
                                      15 *
                                      Responsive.getResponsiveText(context),
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  state.salaryDetails.earningData?[2]?.title ??
                                      'conveyance',
                                  // 'Conveyance',
                                  color: AppTheme.getColor(context).onSurface,
                                  fontSize:
                                      15 *
                                      Responsive.getResponsiveText(context),
                                  fontWeight: FontWeight.w500,
                                ),
                                CustomText(
                                  state.salaryDetails.earningData?[2]?.value ??
                                      '',
                                  color: AppTheme.getColor(context).onSurface,
                                  fontSize:
                                      15 *
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
                                  'gross_pay' + '(A)',
                                  // 'Gross Salary (A)',
                                  color: AppTheme.getColor(context).onSurface,
                                  fontWeight: FontWeight.w800,
                                  fontSize:
                                      15 *
                                      Responsive.getResponsiveText(context),
                                ),
                                CustomText(
                                  // '₹395,086.90',
                                  state.salaryDetails.grossSalary ?? '',
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
                                  state
                                          .salaryDetails
                                          .deductionData?[1]
                                          ?.title ??
                                      'professional_tex',
                                  // 'Professional Tax',
                                  color: AppTheme.getColor(context).onSurface,
                                  fontSize:
                                      14 *
                                      Responsive.getResponsiveText(context),
                                  fontWeight: FontWeight.w500,
                                ),
                                CustomText(
                                  state
                                          .salaryDetails
                                          .deductionData?[1]
                                          ?.value ??
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
                                  'total_deductions',
                                  // 'Total Deduction',
                                  color: AppTheme.getColor(context).onSurface,
                                  fontWeight: FontWeight.w700,
                                  fontSize:
                                      15 *
                                      Responsive.getResponsiveText(context),
                                ),
                                CustomText(
                                  // '₹2,222.00',
                                  state.salaryDetails.totalDeductionSalary ??
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
                                      15 *
                                      Responsive.getResponsiveText(context),
                                ),
                                CustomText(
                                  // '₹2,222.00',
                                  state.salaryDetails.aB ?? '',
                                  color: AppTheme.getColor(context).onSurface,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      15 *
                                      Responsive.getResponsiveText(context),
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
                                  'net_pay',
                                  // 'Net Pay',
                                  color: AppTheme.getColor(context).primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      18 *
                                      Responsive.getResponsiveText(context),
                                ),
                                CustomText(
                                  // '₹38,800.00',
                                  state.salaryDetails.totalNetSalary ?? '',
                                  color: AppTheme.getColor(context).primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      18 *
                                      Responsive.getResponsiveText(context),
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
                                      15 *
                                      Responsive.getResponsiveText(context),
                                ),
                                CustomText(
                                  // '₹0.00',
                                  state.salaryDetails.totalContri ?? '',
                                  color: AppTheme.getColor(context).onSurface,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      15 *
                                      Responsive.getResponsiveText(context),
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
                                  'total_ctc',
                                  // 'Total CTC',
                                  color: AppColors.myCoCyan,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      18 *
                                      Responsive.getResponsiveText(context),
                                ),
                                CustomText(
                                  // '₹38,800.00',
                                  state.salaryDetails.totalCtcCost ?? '',
                                  color: AppColors.myCoCyan,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      18 *
                                      Responsive.getResponsiveText(context),
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
                            onTap: () async {
                              // String fileName =
                              //     '${state.salaryDetails.salaryMonthYear}-${state.salaryDetails.salarySlipId}';
                              await printPayslipFromUrl(
                                state.salaryDetails.payslipDownloadUrl ?? '',
                                // fileName,
                              );
                            },
                            title: 'Download',
                            height: 0.045 * Responsive.getHeight(context),
                            boarderRadius:
                                30 * Responsive.getResponsive(context),
                          ),
                        ),
                        Expanded(
                          child: MyCoButton(
                            onTap: () {
                              getRaiseIssueBottomSheet(context, state);
                            },
                            title: 'Raise An Issue',
                            height: 0.045 * Responsive.getHeight(context),
                            boarderRadius:
                                30 * Responsive.getResponsive(context),
                            backgroundColor: AppTheme.getColor(context).surface,
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
            );
          }
          return const Center(child: Text('No Data Found'));
        },
      ),
    ),
  );

  void getRaiseIssueBottomSheet(
    BuildContext context,
    GetSalaryDetailsSuccessState state,
  ) {
    getBottomSheet(
      context,
      Container(
        color: AppTheme.getColor(context).surface,
        padding: EdgeInsets.symmetric(
          horizontal: 0.08 * Responsive.getWidth(context),
          vertical: 0.02 * Responsive.getHeight(context),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              'Raise An Issue',
              fontSize: 14 * Responsive.getResponsiveText(context),
            ),
            BigMyCoTextField(
              controller: raiseIssueController,
              prefixImage: SvgPicture.asset(AppAssets.warning),
              hintText: 'Type Here',
            ),
            SizedBox(height: 0.02 * Responsive.getHeight(context)),
            SideBySideButtons(
              button1Name: 'Close',
              button2Name: 'Submit',
              onTap1: () => Navigator.pop(context),
              onTap2: () {
                context.read<PayslipDetailBloc>().add(
                  AddSalaryIssueEvent(
                    issueMessage: raiseIssueController.text,
                    salarySlipId: state.salaryDetails.salarySlipId ?? '',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
