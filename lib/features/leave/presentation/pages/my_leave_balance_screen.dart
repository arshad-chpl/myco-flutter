import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/model/leave_history_response_model.dart';
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
  final bool isVisible;
  final VoidCallback? onTap;
  final bool isMonthlyData;
  final Map<String, String>? monthlyData;

  LeaveRowData({
    required this.label,
    required this.value,
    this.isVisible = true,
    this.onTap,
    this.isMonthlyData = false,
    this.monthlyData,
  });
}

class MyLeaveBalanceScreen extends StatefulWidget {
  const MyLeaveBalanceScreen({super.key});

  @override
  State<MyLeaveBalanceScreen> createState() => _MyLeaveBalanceScreenState();
}

class _MyLeaveBalanceScreenState extends State<MyLeaveBalanceScreen> {
  late String selectedValue;
  late List<String> yearOptions;
  @override
  void initState() {
    super.initState();
    final currentYear = DateTime.now().year;
    // Set the selectedValue to the current year
    selectedValue = currentYear.toString();
    // Generate year options: current year - 1, current year, current year + 1
    yearOptions = [
      (currentYear - 1).toString(),
      currentYear.toString(),
      (currentYear + 1).toString(),
    ];
    // Dispatch the event to fetch leave types when the screen is initialized
    context.read<LeaveBloc>().add(FetchNewLeaveListType(selectedValue));
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
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
                  }, yearOptions);
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
              final leaveTypes = _mapResponseToLeaveTypes(
                  state.newLeaveListType);
              return _buildLeaveList(context, leaveTypes);
            } else if (state is LeaveError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<LeaveBloc>().add(
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
      LeaveHistoryResponseModel response,) =>
      response.leaveTypes
          ?.map(
            (leave) =>
        {
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
  List<LeaveRowData> _generateRowsForLeaveType(LeaveTypeModel leave) {
    final isSpecialLeave = leave.specialLeave == '1';
    final isLeaveRestricted = leave.leaveRestrictions == true;
    final isApplyLeaveEncashment =
    (leave.leaveEncashmentOption != null &&
        leave.leaveEncashmentOption == '1' &&
        leave.encashmentAllowed != null &&
        leave.encashmentAllowed != '0');

    final hasMonthlyLeaveBalance =
        leave.userMonthlyLeaveBalanceData != null && leave.userMonthlyLeaveBalanceData!.isNotEmpty;

    return [
      // Available Till Days
      if (leave.leaveExpireAfterDays != null && leave.leaveExpireAfterDays!.isNotEmpty)
        LeaveRowData(
          label: 'Available Till Days',
          value: leave.leaveExpireAfterDays!,
          isVisible: true,
        ),

      // Encashment Summary - Only shown if not special leave and has encashment data
      if (!isSpecialLeave && leave.encasementSummary != null) ...[
        if (leave.encasementSummary?.totalEncashment != null &&
            leave.encasementSummary!.totalEncashment!.isNotEmpty &&
            leave.encasementSummary!.totalEncashment != '0')
          LeaveRowData(
            label: 'Total Encashment Leave',
            value: leave.encasementSummary?.totalEncashment ?? '0',
            isVisible: true,
          ),
        if (leave.encasementSummary?.totalPaid != null &&
            leave.encasementSummary!.totalPaid!.isNotEmpty &&
            leave.encasementSummary!.totalPaid != '0')
          LeaveRowData(
            label: 'Paid Encashment Leave',
            value: leave.encasementSummary?.totalPaid ?? '0',
            isVisible: true,
          ),
        if (leave.encasementSummary?.totalUnpaid != null &&
            leave.encasementSummary!.totalUnpaid!.isNotEmpty &&
            leave.encasementSummary!.totalUnpaid != '0')
          LeaveRowData(
            label: 'Unpaid Encashment Leave',
            value: leave.encasementSummary?.totalUnpaid ?? '0',
            isVisible: true,
          ),
      ],

      // Leave Credit Last Date
      if (leave.leaveCreditLastDate != null && leave.leaveCreditLastDate!.isNotEmpty)
        LeaveRowData(
          label: 'Leave Credit Last Date',
          value: leave.leaveCreditLastDate!,
          isVisible: true,
        ),

      // Regular leave details (hidden for special leaves and when monthly data exists)
      if (!isSpecialLeave && !hasMonthlyLeaveBalance) ...[
        LeaveRowData(
          label: 'Applicable Max Leaves In Month',
          value: leave.applicableLeavesInMonth ?? '0',
          isVisible: true,
        ),
        LeaveRowData(
          label: 'Leave Calculation',
          value: leave.leaveCalculation ?? 'N/A',
          isVisible: true,
        ),
        LeaveRowData(
          label: 'View Leave Count',
          value: leave.assignLeaveFrequency ?? 'N/A',
          isVisible: true,
        ),
        LeaveRowData(
          label: 'Leaves According To Payroll Cycle',
          value: leave.leavesAccordingToPayrollCycle ?? 'No',
          isVisible: true,
        ),
        LeaveRowData(
          label: 'Leave Restrictions',
          value: leave.leaveRestrictions == true ? 'Yes' : 'No',
          isVisible: true,
        ),
        LeaveRowData(
          label: 'Take Leave During Notice Period',
          value: leave.takeLeaveDuringNoticePeriod ?? 'No',
          isVisible: true,
        ),
        LeaveRowData(
          label: 'Max Leave During Notice Period',
          value: leave.maxLeaveDuringNoticePeriod ?? '0',
          isVisible: true,
        ),
        LeaveRowData(
          label: 'Take Leave During Probation Period',
          value: leave.takeLeaveDuringProbationPeriod ?? 'No',
          isVisible: true,
        ),
        LeaveRowData(
          label: 'Max Leave Per Month During Probation Period',
          value: leave.maxLeavePerMonthDuringProbationPeriod ?? '0',
          isVisible: true,
        ),
      ],

      // Monthly leave balance data
      if (hasMonthlyLeaveBalance)
        LeaveRowData(
          label: 'Monthly Leave Balance',
          value: '', // This would be handled by a separate widget
          isVisible: true,
          isMonthlyData: true,
          monthlyData: leave.userMonthlyLeaveBalanceData!,
        ),

      // Action buttons
      LeaveRowData(
        label: 'View Rules',
        value: 'View',
        isVisible: isLeaveRestricted,
        onTap: () {
          // Handle view rules click
        },
      ),
      LeaveRowData(
        label: 'View Dates',
        value: 'View',
        isVisible: isSpecialLeave,
        onTap: () {
          // Handle view dates click
        },
      ),
      LeaveRowData(
        label: 'Apply for leave encashment',
        value: 'Apply',
        isVisible: isApplyLeaveEncashment,
        onTap: () {
          // Handle apply for leave encashment
        },
      ),
    ];
  }


  Widget _buildLeaveList(BuildContext context,
      List<Map<String, dynamic>> leaveTypes,) =>
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: leaveTypes.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final leave = leaveTypes[index];
            final leaveData = leave['leaveData'] as LeaveTypeModel;
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