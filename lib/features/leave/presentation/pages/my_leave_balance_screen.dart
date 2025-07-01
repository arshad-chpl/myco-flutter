import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/expandable_common_card.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_card.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_grid.dart';

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
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 0.015 * getHeight(context),
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
              bottomWidget: LeaveSummaryGrid(
                summaryItems: [
                  LeaveSummaryItem(title: 'Used Leaves', value: '7'),
                  LeaveSummaryItem(title: 'Remaining Leaves', value: '7'),
                  LeaveSummaryItem(title: 'Leave Payout', value: '0'),
                  LeaveSummaryItem(title: 'Carry Forward', value: '0'),
                ],
              ),
            ),
            ExpandableCommonCard(
              title: 'Sick Leave ( Total 12 )',
              headerColor: AppColors.primary,
              bottomWidget: LeaveSummaryGrid(
                summaryItems: [
                  LeaveSummaryItem(title: 'Used Leaves', value: '7'),
                  LeaveSummaryItem(title: 'Remaining Leaves', value: '7'),
                  LeaveSummaryItem(title: 'Leave Payout', value: '0'),
                  LeaveSummaryItem(title: 'Carry Forward', value: '0'),
                ],
              ),
            ),
            ExpandableCommonCard(
              title: 'Birthday Leave ( Total 1 )',
              headerColor: AppColors.secondary,
              bottomWidget: LeaveSummaryGrid(
                summaryItems: [
                  LeaveSummaryItem(title: 'Used Leaves', value: '7'),
                  LeaveSummaryItem(title: 'Remaining Leaves', value: '7'),
                  LeaveSummaryItem(title: 'Leave Payout', value: '0'),
                  LeaveSummaryItem(title: 'Carry Forward', value: '0'),
                ],
              ),
            ),ExpandableCommonCard(
              title: 'Comp off Leave ( Total 1 )',
              headerColor: AppColors.secondary,
              bottomWidget: LeaveSummaryGrid(
                summaryItems: [
                  LeaveSummaryItem(title: 'Used Leaves', value: '7'),
                  LeaveSummaryItem(title: 'Remaining Leaves', value: '7'),
                  LeaveSummaryItem(title: 'Leave Payout', value: '0'),
                  LeaveSummaryItem(title: 'Carry Forward', value: '0'),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
