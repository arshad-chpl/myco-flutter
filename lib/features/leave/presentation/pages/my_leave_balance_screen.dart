import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/model/get_new_list_type_response.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_bloc.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_event.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_state.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/expandable_common_card.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_filter_bottom_sheet.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_card.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_grid.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';

// Assuming LeaveSummaryItem and LeaveRowData classes are defined
class LeaveRowData {
  final String label;
  final String value;
  final VoidCallback? onTap;

  LeaveRowData({required this.label, required this.value, this.onTap});
}

class MyLeaveBalanceScreen extends StatefulWidget {
  const MyLeaveBalanceScreen({super.key});

  @override
  State<MyLeaveBalanceScreen> createState() => _MyLeaveBalanceScreenState();
}

class _MyLeaveBalanceScreenState extends State<MyLeaveBalanceScreen> {
  String selectedValue = '2025';

  @override
  void initState() {
    super.initState();
    // Dispatch the event to fetch leave types when the screen is initialized
    context.read<LeaveBloc>().add(FetchNewLeaveListType(selectedValue));
  }

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
                setState(() {
                  selectedValue = p0;
                  // Dispatch event with selected year
                  context.read<LeaveBloc>().add(
                    FetchNewLeaveListType(selectedValue),
                  );
                });
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
    body: BlocBuilder<LeaveBloc, LeaveState>(
      builder: (context, state) {
        if (state is LeaveLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LeaveListTypeFetched) {
          // Map GetNewListTypeResponse to leaveTypes list
          final leaveTypes = _mapResponseToLeaveTypes(state.newLeaveListType);
          return _buildLeaveList(context, leaveTypes);
        } else if (state is LeaveError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message),
                ElevatedButton(
                  onPressed: () => context.read<LeaveBloc>().add(
                    FetchNewLeaveListType(selectedValue),
                  ),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
        return const Center(child: Text('Please wait...'));
      },
    ),
  );

  // Helper method to map GetNewListTypeResponse to leaveTypes list
  List<Map<String, dynamic>> _mapResponseToLeaveTypes(
    GetNewListTypeResponse response,
  ) =>
      response.leaveTypes
          ?.map(
            (leave) => {
              'title': leave.leaveTypeName ?? 'Unknown Leave',
              'total': leave.userTotalLeave ?? '0',
              'used': leave.userTotalUsedLeave ?? '0',
              'remaining': leave.remainingLeave ?? '0',
              'payout': leave.totalPayout ?? '0',
              'carryForward': leave.totalCarryForward ?? '0',
              'headerColor': AppColors.secondary,
              'leaveData': leave,
              // Store the full LeaveType object for rows
            },
          )
          .toList() ??
      [];

  // Helper method to generate rows for a specific leave type
  List<LeaveRowData> _generateRowsForLeaveType(LeaveType leave) => [
    LeaveRowData(label: 'Used Leaves', value: leave.userTotalUsedLeave ?? '0'),
    LeaveRowData(label: 'Remaining Leaves', value: leave.remainingLeave ?? '0'),
    LeaveRowData(label: 'Leave Payout', value: leave.totalPayout ?? '0'),
    LeaveRowData(label: 'Carry Forward', value: leave.totalCarryForward ?? '0'),
    LeaveRowData(
      label: 'Applicable Max Leaves In Month',
      value: leave.applicableLeavesInMonth ?? '0',
    ),
    LeaveRowData(
      label: 'Leave Calculation',
      value: leave.leaveCalculation ?? 'N/A',
    ),
    LeaveRowData(
      label: 'View Leave Count',
      value: leave.assignLeaveFrequency ?? 'N/A',
    ),
    LeaveRowData(
      label: 'Leaves According To Payroll Cycle',
      value: leave.leavesAccordingToPayrollCycle ?? 'No',
    ),
    LeaveRowData(
      label: 'Leave Restrictions',
      value: leave.leaveRestrictions == true ? 'Yes' : 'No',
    ),
    LeaveRowData(
      label: 'Take Leave During Notice Period',
      value: leave.takeLeaveDuringNoticePeriod ?? 'No',
    ),
    LeaveRowData(
      label: 'Max Leave During Notice Period',
      value: leave.maxLeaveDuringNoticePeriod ?? '0',
    ),
    LeaveRowData(
      label: 'Take Leave During Probation Period',
      value: leave.takeLeaveDuringProbationPeriod ?? 'No',
    ),
    LeaveRowData(
      label: 'Max Leave Per Month During Probation Period',
      value: leave.maxLeavePerMonthDuringProbationPeriod ?? '0',
    ),
    LeaveRowData(
      label: 'Available Till Days',
      value: leave.leaveExpireAfterDays ?? '0',
    ),
    LeaveRowData(
      label: 'Expire Leave',
      value: leave.leaveExpireAfterDays ?? '0',
    ),
    LeaveRowData(label: 'Assign Leaves', value: leave.userTotalLeave ?? '0'),
    LeaveRowData(
      label: 'Total Encashment Leave',
      value: leave.encasementSummary?.totalEncashment ?? '0',
    ),
    LeaveRowData(
      label: 'Paid Encashment Leave',
      value: leave.encasementSummary?.totalPaid ?? '0',
    ),
    LeaveRowData(
      label: 'Unpaid Encashment Leave',
      value: leave.encasementSummary?.totalUnpaid ?? '0',
    ),
    LeaveRowData(
      label: 'Leave Credit Last Date',
      value: leave.leaveCreditLastDate ?? 'N/A',
    ),
    LeaveRowData(
      label: 'View Dates',
      value: '',
      onTap: () {
        // Handle view dates click
      },
    ),
    LeaveRowData(
      label: 'Apply for leave encashment?',
      value: '',
      onTap: () {
        // Handle apply for leave encashment
      },
    ),
  ];

  Widget _buildLeaveList(
    BuildContext context,
    List<Map<String, dynamic>> leaveTypes,
  ) => Padding(
    padding: const EdgeInsets.all(16.0),
    child: ListView.separated(
      itemCount: leaveTypes.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final leave = leaveTypes[index];
        final leaveData = leave['leaveData'] as LeaveType;
        return ExpandableCommonCard(
          headerColor: leave['headerColor'],
          title: '${leave['title']} (Total ${leave['total']})',
          bottomWidget: LeaveSummaryCard(
            chips: [
              LeaveSummaryItem(
                title: 'Used Leaves',
                value: leave['used'].toString(),
              ),
              LeaveSummaryItem(
                title: 'Remaining Leaves',
                value: leave['remaining'].toString(),
              ),
              LeaveSummaryItem(
                title: 'Leave Payout',
                value: leave['payout'].toString(),
              ),
              LeaveSummaryItem(
                title: 'Carry Forward',
                value: leave['carryForward']
                    .toString(), // Corrected property name
              ),
            ],
            rows: _generateRowsForLeaveType(leaveData),
          ),
        );
      },
    ),
  );
}
