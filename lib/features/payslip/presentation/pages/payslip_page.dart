import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/payslip_card.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/summary_bottomsheet.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class PayslipPage extends StatelessWidget {
  const PayslipPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: CustomText(
        'Payslip',
        fontWeight: FontWeight.w700,
        fontSize: 20 * getResponsiveText(context),
      ),
      leading: const BackButton(),
      actions: [
        MyCoButton(
          onTap: () {
            context.pushNamed('salary-break-up');
          },
          backgroundColor: AppTheme.getColor(context).secondary,
          borderColor: AppTheme.getColor(context).secondary,
          boarderRadius: 30 * getResponsive(context),
          title: 'View CTC',
          textStyle: TextStyle(
            fontSize: 14 * getResponsiveText(context),
            color: AppTheme.getColor(context).onSecondary,
          ),
          width: 0.2 * getWidth(context),
          height: 0.03 * getHeight(context),
          isShadowBottomLeft: true,
        ),
      ],
    ),
    body: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8 * getResponsive(context),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    6 * getResponsive(context),
                  ),
                  color: AppColors.gray10,
                ),
                child: const Center(
                  child: CustomText('<', fontWeight: FontWeight.w700),
                ),
              ),
              InkWell(
                onTap: () {
                  // showModalBottomSheet(
                  //   constraints: BoxConstraints(
                  //     maxHeight: 0.67 * getHeight(context),
                  //   ),
                  //   useSafeArea: true,
                  //   isScrollControlled: true,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadiusGeometry.circular(
                  //       8 * getResponsive(context),
                  //     ),
                  //   ),
                  //   clipBehavior: Clip.hardEdge,
                  //   context: context,
                  //   builder: (context) => DialDatePickerWidget(
                  //     onSubmit: (selectedDate) {},
                  //     bottomSheetHeight: 0.5 * getHeight(context),
                  //   ),
                  // );
                },
                child: Row(
                  children: [
                    CustomText(
                      '2024-2025',
                      fontSize: 16 * getResponsiveText(context),
                      fontWeight: FontWeight.w700,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 25 * getResponsive(context),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8 * getResponsive(context),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    6 * getResponsive(context),
                  ),
                  color: AppColors.gray10,
                ),
                child: const Center(
                  child: CustomText('>', fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 0.02 * getHeight(context)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
          child: MyCustomTabBar(
            tabs: const ['Paylsip', 'Other Earnings'],
            selectedBgColors: [
              AppTheme.getColor(context).secondary,
              AppTheme.getColor(context).primary,
            ],
            unselectedBorderAndTextColor: AppTheme.getColor(context).primary,
            tabBarBorderColor: AppColors.black,
            selectedIndex: 0,
            isShadowBottomLeft: true,
          ),
        ),
        SizedBox(height: 0.02 * getHeight(context)),

        const PaySlip(),
        // const OtherEarnings(),
      ],
    ),
  );
}

class PaySlip extends StatelessWidget {
  const PaySlip({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 0.63 * getHeight(context),
          padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
          child: Expanded(
            child: ListView.separated(
              itemCount: 8,
              itemBuilder: (context, index) => PayslipCard(
                month: 'March',
                year: '2025',
                netPay: '2,800.00',
                grossSalary: '3000.00',
                totalDeduction: '200.00',
                onView: () {
                  context.pushNamed('payslip-detail');
                },
              ),
              separatorBuilder: (context, index) =>
                  SizedBox(height: 0.01 * getHeight(context)),
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0.08 * getWidth(context),
            vertical: 0.02 * getHeight(context),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyCoButton(
                onTap: () {
                  showModalBottomSheet(
                    constraints: BoxConstraints(
                      maxHeight: 0.67 * getHeight(context),
                    ),
                    useSafeArea: true,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(
                        8 * getResponsive(context),
                      ),
                    ),
                    clipBehavior: Clip.hardEdge,
                    context: context,
                    builder: (context) => const SummaryBottomsheet(),
                  );
                },
                title: 'View Summary',
                width: 0.4 * getWidth(context),
                height: 0.04 * getHeight(context),
                boarderRadius: 30 * getResponsive(context),
                textStyle: TextStyle(
                  fontSize: 14 * getResponsiveText(context),
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getColor(context).onPrimary,
                ),
                isShadowBottomLeft: true,
              ),
              CustomText(
                'Download All Payslip',
                fontSize: 14 * getResponsiveText(context),
                color: AppTheme.getColor(context).primary,
                decoration: TextDecoration.underline,
                decorationColor: AppTheme.getColor(context).primary,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class OtherEarnings extends StatelessWidget {
  const OtherEarnings({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
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
                headerPrefixIconHeight: 0.025 * getHeight(context),
                headerColor: AppTheme.getColor(context).primary,
                bottomWidget: getCommonCardBottomWidget(context),
              ),
              separatorBuilder: (context, index) =>
                  SizedBox(height: 0.02 * getHeight(context)),
            ),
          ),
        ],
      ),
    ),
  );

  Container getCommonCardBottomWidget(BuildContext context) => Container(
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
              'Casual Leave',
              fontSize: 15 * getResponsiveText(context),
              fontWeight: FontWeight.w700,
            ),
            CustomText(
              'Net Pay',
              fontSize: 15 * getResponsiveText(context),
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        SizedBox(height: 0.005 * getHeight(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              'Total Leaves Day: 0.50',
              fontSize: 15 * getResponsiveText(context),
              fontWeight: FontWeight.w500,
            ),
            CustomText(
              '₹928.57',
              fontSize: 15 * getResponsiveText(context),
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ],
    ),
  );
}
