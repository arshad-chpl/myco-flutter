import 'dart:developer';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/custom_bloc/tab-bar/bloc/tabbar_bloc.dart';
import 'package:myco_flutter/features/payslip/presentation/bloc/payslip_bloc/payslip_bloc.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/ios_calendar_time_picker.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/payslip_card.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/payslip_webview.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/shimmer_salary_loading.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/summary_bottomsheet.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

// ignore: must_be_immutable
class PayslipPage extends StatefulWidget {
class PayslipPage extends StatefulWidget {
  PayslipPage({super.key});

  @override
  State<PayslipPage> createState() => _PayslipPageState();
}

class _PayslipPageState extends State<PayslipPage> {
  @override
  State<PayslipPage> createState() => _PayslipPageState();
}

class _PayslipPageState extends State<PayslipPage> {
  List<Widget> screens = [const PaySlip(), const OtherEarnings()];

  @override
  void initState() {
    super.initState();
    Future.microtask(loadData);
  }

  void loadData() {
    context.read<PayslipBloc>().add(GetSalaryEvent());
    context.read<OtherEarningsBloc>().add(GetOtherEarningsEvent());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      title: LanguageManager().get('payslip'),
      actions: [
        MyCoButton(
          onTap: () {
            context.pushNamed(RoutePaths.salaryBreakUp);
          },
          backgroundColor: AppTheme.getColor(context).secondary,
          borderColor: AppTheme.getColor(context).secondary,
          boarderRadius: 30 * Responsive.getResponsive(context),
          title: LanguageManager().get('view_ctc'),
          textStyle: TextStyle(
            fontSize: 14 * Responsive.getResponsiveText(context),
            color: AppTheme.getColor(context).onSecondary,
          ),
          width: 0.2 * Responsive.getWidth(context),
          height: 0.03 * Responsive.getHeight(context),
          isShadowBottomLeft: true,
        ),
        SizedBox(width: 0.06 * Responsive.getWidth(context)),
      ],
    ),
    body: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0.08 * Responsive.getWidth(context),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 8 * Responsive.getResponsive(context),
                  top: 2 * Responsive.getResponsive(context),
                  bottom: 2 * Responsive.getResponsive(context),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    6 * Responsive.getResponsive(context),
                  ),

                  color: AppTheme.getColor(context).primary.withAlpha(40),
                ),
                child: const Center(
                  child: Icon(Icons.arrow_back_ios, size: 16),
                ),
              ),
              InkWell(
                onTap: () async {
                  // ignore: unused_local_variable
                  final selectedDate = await showPicker(
                    context,
                    minDate: DateTime(2020),
                    maxDate: DateTime(2030),
                    pickDay: false,
                    timePicker: false,
                  );

                  // if (selectedDate != null) {
                  //   setState(() {
                  //     var date = selectedDate;
                  //   });
                  // }
                },
                child: Row(
                  children: [
                    CustomText(
                      '2024-2025',
                      fontSize: 16 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w700,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 25 * Responsive.getResponsive(context),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 3 * Responsive.getResponsive(context),
                  vertical: 2 * Responsive.getResponsive(context),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    6 * Responsive.getResponsive(context),
                  ),
                  color: AppTheme.getColor(context).primary.withAlpha(40),
                ),
                child: const Center(
                  child: Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 0.02 * Responsive.getHeight(context)),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0.08 * Responsive.getWidth(context),
          ),
          child: BlocBuilder<TabbarBloc, TabbarState>(
            builder: (context, state) {
              final selectedIndex = state is TabChangeState
                  ? state.selectedIndex
                  : 0;
              return MyCustomTabBar(
                tabs: [
                  LanguageManager().get('payslip'),
                  LanguageManager().get('other_earnings'),
                ],
                selectedBgColors: [
                  AppTheme.getColor(context).secondary,
                  AppTheme.getColor(context).primary,
                ],
                unselectedBorderAndTextColor: AppTheme.getColor(
                  context,
                ).primary,
                tabBarBorderColor: selectedIndex == 0
                    ? AppTheme.getColor(context).secondary
                    : AppTheme.getColor(context).primary,
                selectedIndex: selectedIndex,
                isShadowBottomLeft: true,
                onTabChange: (index) {
                  context.read<TabbarBloc>().add(TabChangeEvent(index: index));
                },
              );
            },
          ),
        ),
        SizedBox(height: 0.02 * Responsive.getHeight(context)),

        BlocBuilder<TabbarBloc, TabbarState>(
          builder: (context, state) {
            final selectedIndex = state is TabChangeState
                ? state.selectedIndex
                : 0;
            return screens[selectedIndex];
          },
        ),
      ],
    ),
  );
}

class PaySlip extends StatelessWidget {
  const PaySlip({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<PayslipBloc, PayslipState>(
    builder: (context, state) {
      if (state is GetSalaryLoadingState) {
        return const ShimmerSalaryLoadingWidget(loadingFor: 'payslip');
      }

      if (state is GetSalaryErrorState) {
        return Column(
          children: [
            SizedBox(height: 0.3 * Responsive.getHeight(context)),
            CustomText(state.error),
          ],
        );
      }

      if (state is GetSalarySuccessState) {
        log('Success', name: 'GetSalarySuccessState');
        final salary = state.salary;
        return Column(
          children: [
            Container(
              height: 0.65 * Responsive.getHeight(context),
              padding: EdgeInsets.symmetric(
                horizontal: 0.08 * Responsive.getWidth(context),
              ),
              child: ListView.separated(
                itemCount: salary.salaryItem?.length ?? 0,
                itemBuilder: (context, index) => PayslipCard(
                  month: salary.salaryItem?[index].monthName ?? '',
                  year: salary.salaryItem?[index].year ?? '',
                  netPay: salary.salaryItem?[index].totalNetSalary ?? '',
                  grossSalary:
                      salary.salaryItem?[index].totalEarningSalary ?? '',
                  totalDeduction:
                      salary.salaryItem?[index].totalDeductionSalary ?? '',
                  onView: () {
                    // log(salary.salaryItem?[index].salarySlipId.toString() )
                    context.pushNamed(
                      RoutePaths.payslipDetail,
                      extra: salary.salaryItem?[index].salarySlipId ?? '',
                    );
                  },
                  onDownload: () {
                    // Download with
                    // salary.salaryItem?[index].payslipDownloadUrl ?? "",
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PayslipWebViewScreen(
                          url:
                              salary.salaryItem?[index].payslipDownloadUrl ??
                              '',
                        ),
                      ),
                    );
                  },
                ),
                separatorBuilder: (context, index) =>
                    SizedBox(height: 0.01 * Responsive.getHeight(context)),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.08 * Responsive.getWidth(context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCoButton(
                    onTap: () {
                      showModalBottomSheet(
                        constraints: BoxConstraints(
                          maxHeight: 0.7 * Responsive.getHeight(context),
                        ),
                        useSafeArea: true,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(
                            8 * Responsive.getResponsive(context),
                          ),
                        ),
                        clipBehavior: Clip.hardEdge,
                        context: context,
                        builder: (context) => SummaryBottomsheet(
                          basic: salary.earningsTotal?[0].earningAmount ?? '',
                          basicName: salary.earningsTotal?[0].earningType ?? '',
                          hra: salary.earningsTotal?[1].earningAmount ?? '',
                          hraName: salary.earningsTotal?[1].earningType ?? '',
                          conveyance:
                              salary.earningsTotal?[2].earningAmount ?? '',
                          conveyanceName:
                              salary.earningsTotal?[2].earningType ?? '',

                          grossDeductions:
                              salary.deductionsTotal?[0].deductionAmount ?? '',
                          grossDeductionsName:
                              salary.deductionsTotal?[0].deductionType ?? '',
                          professionalTax:
                              salary.deductionsTotal?[1].deductionAmount ?? '',
                          professionalTaxName:
                              salary.deductionsTotal?[1].deductionType ?? '',

                          totalEarnings: salary.totalEarning ?? '',
                          leaveEncashment: '',
                          paidLeaveAllowance: '',
                          totalEmplotersContributions:
                              salary
                                  .employerContributionTotal?[0]
                                  .employerContributionAmount ??
                              '',
                        ),
                      );
                    },
                    title: LanguageManager().get('view_summary'),
                    width: 0.4 * Responsive.getWidth(context),
                    height: 0.04 * Responsive.getHeight(context),
                    boarderRadius: 30 * Responsive.getResponsive(context),
                    textStyle: TextStyle(
                      fontSize: 14 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getColor(context).onPrimary,
                    ),
                    isShadowBottomLeft: true,
                  ),
                  InkWell(
                    onTap: () {
                      // Download with
                      // salary.payslipDownloadUrl ?? ""
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PayslipWebViewScreen(
                            url: salary.payslipDownloadUrl ?? '',
                          ),
                        ),
                      );
                    },
                    child: CustomText(
                      'download_all_payslip',
                      // 'Download All Payslip',
                      fontSize: 14 * Responsive.getResponsiveText(context),
                      color: AppTheme.getColor(context).primary,
                      decoration: TextDecoration.underline,
                      decorationColor: AppTheme.getColor(context).primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }
      return const Center(child: CustomText('No Data Found'));
    },
  );
}

class OtherEarnings extends StatelessWidget {
  const OtherEarnings({super.key});

  @override
  Widget build(
    BuildContext context,
  ) => BlocBuilder<OtherEarningsBloc, PayslipState>(
    builder: (context, state) {
      if (state is GetOtherEarningsLoadingState) {
        log('Loading...', name: 'GetOtherEarningsLoadingState');
        return const ShimmerSalaryLoadingWidget(loadingFor: 'payslip');
      }

      if (state is GetOtherEarningsErrorState) {
        log('Error', name: 'GetOtherEarningsErrorState');
        return Column(
          children: [
            SizedBox(height: 0.3 * Responsive.getHeight(context)),
            CustomText(state.error),
          ],
        );
      }

      if (state is GetOtherEarningsSuccessState) {
        log('Success', name: 'GetOtherEarningsSuccessState');
        final otherEarning = state.otherEarnings;
        return Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 0.08 * Responsive.getWidth(context),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: otherEarning.otherEarnings?.length ?? 0,
                    itemBuilder: (context, index) => CommonCard(
                      title:
                          otherEarning.otherEarnings?[index].leavePayoutDate ??
                          '',
                      showHeaderPrefixIcon: true,
                      headerPrefixIcon: 'assets/payslip/calendar.png',
                      headerPrefixIconHeight:
                          0.025 * Responsive.getHeight(context),
                      headerColor: AppTheme.getColor(context).primary,
                      bottomWidget: getCommonCardBottomWidget(
                        context,
                        leaveTypeName:
                            otherEarning.otherEarnings?[index].leaveTypeName ??
                            '',
                        numberOfPayoutLeaves:
                            otherEarning
                                .otherEarnings?[index]
                                .noOfPayoutLeaves ??
                            '',
                        leavePayoutAmount:
                            otherEarning
                                .otherEarnings?[index]
                                .leavePayoutAmount ??
                            '',
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 0.02 * Responsive.getHeight(context)),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      return const Center(child: CustomText('No Data Found'));
    },
  );

  Container getCommonCardBottomWidget(
    BuildContext context, {
    required String leaveTypeName,
    required String numberOfPayoutLeaves,
    required String leavePayoutAmount,
  }) => Container(
  Container getCommonCardBottomWidget(
    BuildContext context, {
    required String leaveTypeName,
    required String numberOfPayoutLeaves,
    required String leavePayoutAmount,
  }) => Container(
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
              leaveTypeName,
              leaveTypeName,
              fontSize: 15 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w700,
            ),
            CustomText(
              'net_pay',
              // 'Net Pay',
              fontSize: 15 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        SizedBox(height: 0.005 * Responsive.getHeight(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              'total_leave_days'
              ': $numberOfPayoutLeaves',
              'total_leave_days'
              ': $numberOfPayoutLeaves',
              // 'Total Leaves Day: 0.50',
              fontSize: 15 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w500,
            ),
            CustomText(
              leavePayoutAmount,
              leavePayoutAmount,
              fontSize: 15 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ],
    ),
  );
}
