import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/expandable_common_card.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_dates_bottom_sheet.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_filter_bottom_sheet.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_card.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_grid.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';

class MyLeaveBalanceScreen extends StatefulWidget {
  const MyLeaveBalanceScreen({super.key});

  @override
  State<MyLeaveBalanceScreen> createState() => _MyLeaveBalanceScreenState();
}

class _MyLeaveBalanceScreenState extends State<MyLeaveBalanceScreen> {
  final rows = List.generate(
    9,
    (index) => LeaveRowData(
      label: index == 5
          ? 'Maximum leave per month during Probation Period'
          : 'Applicable Max Leaves In Month',
      value: '0',
    ),
  );

  String selectedValue = '2025';
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_outlined),
      ),
      title: const Text('Your Paid Leaves'),
      centerTitle: true,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyCoButton(
            backgroundColor: AppColors.secondary,
            borderColor: AppColors.secondary,
            onTap: () {
              showLeaveFilterBottomSheet(context, selectedValue, (p0) {
                selectedValue = p0;
                setState(() {});
              }, ['2025', '2024', '2023']);
            },

            textStyle: TextStyle(
              fontSize: 12 * Responsive.getResponsiveText(context),
              color: MyCoButtonTheme.whitemobileBackgroundColor,
            ),
            title: selectedValue,
            height: 0.035 * Responsive.getHeight(context),
            width: 0.2 * Responsive.getWidth(context),
            imagePosition: AxisDirection.right,
            image: const Icon(
              Icons.keyboard_arrow_down,
              color: MyCoButtonTheme.whitemobileBackgroundColor,
            ),
          ),
        ),
      ],
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          spacing: 0.015 * Responsive.getHeight(context),
          children: [
            ExpandableCommonCard(
              headerColor: AppColors.secondary,
              title: 'Sick Leave (Total 7)',
              bottomWidget: LeaveSummaryCard(
                chips: [
                  LeaveSummaryItem(title: 'Used Leaves', value: '7'),
                  LeaveSummaryItem(title: 'Remaining Leaves', value: '7'),
                  LeaveSummaryItem(title: 'Leave Payout', value: '0'),
                  LeaveSummaryItem(title: 'Carry Forward', value: '0'),
                ],
                rows: rows,
              ),
            ),

            ExpandableCommonCard(
              title: 'Casual Leave ( Total 12 )',
              headerColor: AppColors.myCoCyan,
              bottomWidget: LeaveSummarySection(
                isOtherContainer: false,
                summaryItems: [
                  LeaveSummaryItem(title: 'Used Leaves', value: '7'),
                  LeaveSummaryItem(title: 'Remaining Leaves', value: '7'),
                  LeaveSummaryItem(title: 'Leave Payout', value: '0'),
                  LeaveSummaryItem(title: 'Carry Forward', value: '0'),
                ],
                maxLeavesInMonth: 1,
                onViewDates: () {},
              ),
            ),
            ExpandableCommonCard(
              title: 'Sick Leave ( Total 12 )',
              headerColor: AppColors.primary,
              bottomWidget: LeaveSummarySection(
                isOtherContainer: false,
                summaryItems: [
                  LeaveSummaryItem(title: 'Used Leaves', value: '7'),
                  LeaveSummaryItem(title: 'Remaining Leaves', value: '7'),
                  LeaveSummaryItem(title: 'Leave Payout', value: '0'),
                  LeaveSummaryItem(title: 'Carry Forward', value: '0'),
                ],
                maxLeavesInMonth: 1,
                onViewDates: () {},
              ),
            ),
            ExpandableCommonCard(
              title: 'Birthday Leave ( Total 1 )',
              headerColor: AppColors.secondary,
              bottomWidget: LeaveSummarySection(
                isOtherContainer: false,
                summaryItems: [
                  LeaveSummaryItem(title: 'Used Leaves', value: '7'),
                  LeaveSummaryItem(title: 'Remaining Leaves', value: '7'),
                  LeaveSummaryItem(title: 'Leave Payout', value: '0'),
                  LeaveSummaryItem(title: 'Carry Forward', value: '0'),
                ],
                maxLeavesInMonth: 0,
                onViewDates: () {},
              ),
            ),
            ExpandableCommonCard(
              title: 'Comp off Leave ( Total 1 )',
              headerColor: AppColors.secondary,
              bottomWidget: LeaveSummarySection(
                isOtherContainer: true,
                summaryItems: [
                  LeaveSummaryItem(title: 'Used Leaves', value: '7'),
                  LeaveSummaryItem(title: 'Remaining Leaves', value: '7'),
                  LeaveSummaryItem(title: 'Leave Payout', value: '0'),
                  LeaveSummaryItem(title: 'Carry Forward', value: '0'),
                ],
                maxLeavesInMonth: 2,
                onViewDates: () {
                  showLeaveDatesBottomSheet(context, [
                    LeaveDetail(
                      leaveAgainst: '02:39 PM, 23rd May 2025',
                      expireOn: 'Friday, 01st August 2025',
                      isUsed: 'Yes',
                      type: 'Full Day',
                    ),
                    LeaveDetail(
                      leaveAgainst: '02:39 PM, 23rd May 2025',
                      expireOn: 'Friday, 01st August 2025',
                      isUsed: 'Yes',
                      type: 'Full Day',
                    ),
                    // Add more dynamically
                  ]);
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
