import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/custom_bloc/tab-bar/bloc/tabbar_bloc.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/ios_calendar_time_picker.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/payslip_card.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/summary_bottomsheet.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

// ignore: must_be_immutable
class PayslipPage extends StatelessWidget {
  PayslipPage({super.key});

  List<Widget> screens = [const PaySlip(), const OtherEarnings()];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      title: 'Payslip',
      actions: [
        MyCoButton(
          onTap: () {
            context.pushNamed(RoutePaths.salaryBreakUp);
          },
          backgroundColor: AppTheme.getColor(context).secondary,
          borderColor: AppTheme.getColor(context).secondary,
          boarderRadius: 30 * Responsive.getResponsive(context),
          title: 'View CTC',
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
                padding: EdgeInsets.symmetric(
                  horizontal: 8 * Responsive.getResponsive(context),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    6 * Responsive.getResponsive(context),
                  ),

                  border: Border.all(color: AppTheme.getColor(context).outline),
                ),
                child: const Center(
                  child: CustomText('<', fontWeight: FontWeight.w700),
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
                  //     myDate = selectedDate;
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
                  horizontal: 8 * Responsive.getResponsive(context),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    6 * Responsive.getResponsive(context),
                  ),
                  border: Border.all(color: AppTheme.getColor(context).outline),
                  // color: AppColors.gray10,
                ),
                child: const Center(
                  child: CustomText('>', fontWeight: FontWeight.w700),
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
                tabs: const ['Paylsip', 'Other Earnings'],
                selectedBgColors: [
                  AppTheme.getColor(context).secondary,
                  AppTheme.getColor(context).primary,
                ],
                unselectedBorderAndTextColor: AppTheme.getColor(
                  context,
                ).primary,
                tabBarBorderColor: AppTheme.getColor(context).onSurface,
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
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: 0.63 * Responsive.getHeight(context),
        padding: EdgeInsets.symmetric(
          horizontal: 0.08 * Responsive.getWidth(context),
        ),
        child: ListView.separated(
          itemCount: 8,
          itemBuilder: (context, index) => PayslipCard(
            month: 'March',
            year: '2025',
            netPay: '2,800.00',
            grossSalary: '3000.00',
            totalDeduction: '200.00',
            onView: () {
              context.pushNamed(RoutePaths.payslipDetail);
            },
          ),
          separatorBuilder: (context, index) =>
              SizedBox(height: 0.01 * Responsive.getHeight(context)),
        ),
      ),

      Container(
        padding: EdgeInsets.symmetric(
          horizontal: 0.08 * Responsive.getWidth(context),
          vertical: 0.02 * Responsive.getHeight(context),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyCoButton(
              onTap: () {
                showModalBottomSheet(
                  constraints: BoxConstraints(
                    maxHeight: 0.67 * Responsive.getHeight(context),
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
                  builder: (context) => const SummaryBottomsheet(),
                );
              },
              title: 'View Summary',
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
            CustomText(
              'Download All Payslip',
              fontSize: 14 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).primary,
              decoration: TextDecoration.underline,
              decorationColor: AppTheme.getColor(context).primary,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    ],
  );
}

class OtherEarnings extends StatelessWidget {
  const OtherEarnings({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.08 * Responsive.getWidth(context),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 2,
              itemBuilder: (context, index) => CommonCard(
                title: '07 January, 2025',
                showHeaderPrefixIcon: true,
                headerPrefixIcon: 'assets/payslip/calendar.png',
                headerPrefixIconHeight: 0.025 * Responsive.getHeight(context),
                headerColor: AppTheme.getColor(context).primary,
                bottomWidget: getCommonCardBottomWidget(context),
              ),
              separatorBuilder: (context, index) =>
                  SizedBox(height: 0.02 * Responsive.getHeight(context)),
            ),
          ),
        ],
      ),
    ),
  );

  Container getCommonCardBottomWidget(BuildContext context) => Container(
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
              'Casual Leave',
              fontSize: 15 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w700,
            ),
            CustomText(
              'Net Pay',
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
              'Total Leaves Day: 0.50',
              fontSize: 15 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w500,
            ),
            CustomText(
              '₹928.57',
              fontSize: 15 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ],
    ),
  );
}
