import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/domain/intities/leave_history_response_entity.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_bloc.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_event.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_state.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/custom_fab_menu.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_action_button.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_card.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_detail_bottom_sheet.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_filter_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_month_year_picker_header/month_year_header.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/sandwich_leave_card.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/short_leave_card.dart';
import 'package:myco_flutter/widgets/custom_alert_dialog.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({super.key});

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  String selectedFilter = 'All Leaves';
  int selectedMonth = 0; // 0 means all months
  int selectedYear = DateTime.now().year;
  List<LeaveHistoryEntity> leaveHistoryList = [];
  bool isLoading = true;
  bool isTeamLeave = false;
  bool isShortLeave = false;
  bool isSandwichLeave = false;

  @override
  void initState() {
    super.initState();
    _fetchLeaveHistory();
  }

  void _fetchLeaveHistory() {
    setState(() => isLoading = true);
    context.read<LeaveBloc>().add(
      FetchLeaveHistoryNew(
        selectedMonth.toString().padLeft(2, '0'),
        selectedYear.toString(),
      ),
    );
  }

  void _deleteShortLeave(
    String shortLeaveId,
    String shortLeaveDate,
    String otherUserId,
    String otherUserName,
  ) {
    setState(() => isLoading = true);
    context.read<LeaveBloc>().add(
      DeleteShortLeave(
        shortLeaveId,
        shortLeaveDate,
        otherUserId,
        otherUserName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    // appBar: AppBar(
    //   leading: IconButton(
    //     onPressed: () => context.pop(),
    //     icon: const Icon(Icons.arrow_back_outlined),
    //   ),
    //   title: const Text('Leave balance'),
    //   centerTitle: true,
    //   elevation: 0,
    // ),
    appBar: CustomAppbar(
      isKey: true,
      title: 'leave_balance',
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyCoButton(
            onTap: () => _showFilterBottomSheet(context),
            textStyle: TextStyle(
              fontSize: 12 * Responsive.getResponsiveText(context),
              color: MyCoButtonTheme.whitemobileBackgroundColor,
            ),
            title: selectedFilter,
            height: 0.035 * Responsive.getHeight(context),
            width: 0.25 * Responsive.getWidth(context),
            imagePosition: AxisDirection.right,
            image: const Icon(
              Icons.keyboard_arrow_down,
              color: MyCoButtonTheme.whitemobileBackgroundColor,
            ),
          ),
        ),
      ],
    ),
    body: BlocConsumer<LeaveBloc, LeaveState>(
      listener: (context, state) {
        if (state is LeaveHistoryNewFetched) {
          setState(() {
            leaveHistoryList = state.newLeaveList.leaveHistory ?? [];
            isLoading = false;
            isTeamLeave = state.newLeaveList.teamLeave ?? false;
          });
        } else if (state is LeaveError) {
          setState(() => isLoading = false);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        // if (isLoading) {
        //   return const Center();
        // }

        final filteredLeaves = _filterLeaves(leaveHistoryList);

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                MonthYearHeader(
                  startYear: 2025,
                  endYear: 2026,
                  iconSize: 0.02 * Responsive.getHeight(context),
                  onChanged: (month, year) {
                    setState(() {
                      selectedMonth = month;
                      selectedYear = year;
                    });
                    _fetchLeaveHistory();
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LeaveActionButton(
                      title: 'My Leave Balance',
                      onTap: () => context.go(RoutePaths.leaveBalance),
                    ),
                    if (isTeamLeave)
                      LeaveActionButton(
                        title: 'My Team Leaves',
                        onTap: () => context.go(RoutePaths.teamLeaveBalance),
                      ),
                  ],
                ),
                const SizedBox(height: 16),

                if (filteredLeaves.isEmpty)
                  const Center(child: Text('No leaves found')),
                if (isLoading) const Center(child: CircularProgressIndicator()),
                ...filteredLeaves.map((leave) {
                  if (leave.sandwichLeave == false &&
                      leave.shortLeave == true) {
                    return ShortLeaveCard(
                      leave: _convertToShortLeaveEntry(leave),
                      onDelete:
                          ({
                            required fullName,
                            required sandwichLeaveId,
                            required userId,
                            required leaveDate,
                          }) {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(
                                    context,
                                  ).viewInsets.bottom,
                                ),
                                // to avoid keyboard overlap if needed
                                child: CustomAlertDialog(
                                  alertType: AlertType.delete,
                                  content: 'do you want delete',
                                  confirmText: 'Ok',
                                  cancelText: 'Cancel',
                                  onCancel: () {
                                    Navigator.of(context).pop();
                                  },
                                  onConfirm: () {
                                    _deleteShortLeave(
                                      sandwichLeaveId ?? '',
                                      leaveDate ?? '',
                                      userId ?? '',
                                      fullName ?? '',
                                    );
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            );
                          },
                    );
                  } else if (leave.sandwichLeave == true &&
                      leave.shortLeave == false) {
                    return SandwichLeaveCard(
                      leave: _convertToSandwichLeaveEntry(leave),
                    );
                  } else {
                    return LeaveCard(
                      leave: _convertToLeaveEntry(leave),
                      onDelete: ({leaveId}) {
                        // Call delete api
                      },
                    );
                  }
                }),
              ],
            ),
          ),
        );
      },
    ),
    floatingActionButton: CustomFabMenu(
      buttons: [
        FabButtonModel(
          label: 'Apply Leave',
          icon: Icons.event_available_outlined,
          onTap: () => context.push(RoutePaths.addLeaveScreen),
        ),
        FabButtonModel(
          label: 'Apply Short Leave',
          imagePath: 'assets/images/short_apply_leave.png',
          onTap: () async {
            final result = await context.push(RoutePaths.addShortLeaveScreen);
            if (result == true) {
              // refresh your main screen's API
              context.read<LeaveBloc>().add(
                FetchLeaveHistoryNew(
                  selectedMonth.toString().padLeft(2, '0'),
                  selectedYear.toString(),
                ),
              );
            }
          },
        ),
      ],
    ),
  );

  List<LeaveHistoryEntity> _filterLeaves(List<LeaveHistoryEntity> leaves) {
    if (selectedFilter == 'All Leaves') return leaves;

    return leaves.where((leave) {
      if (selectedFilter == 'Paid Leaves') {
        return leave.paidUnpaidStatus == '0';
      } else if (selectedFilter == 'Unpaid Leaves') {
        return leave.paidUnpaidStatus == '1';
      }
      return true;
    }).toList();
  }

  void _showFilterBottomSheet(BuildContext context) {
    showLeaveFilterBottomSheet(context, selectedFilter, (newFilter) {
      setState(() => selectedFilter = newFilter);
    }, ['All Leaves', 'Paid Leaves', 'Unpaid Leaves']);
  }

  LeaveEntry _convertToLeaveEntry(LeaveHistoryEntity leave) => LeaveEntry(
    date: leave.leaveDateView ?? '',
    leaveType: leave.leaveTypeName ?? '',
    subType: leave.autoLeave == true ? 'Auto Leave' : 'Manual Leave',
    leaveTime: leave.shortLeaveTime ?? '',
    reason: leave.leaveReason ?? '',
    approvedBy: leave.approvedByName ?? '',
    status: leave.leaveStatusView ?? '',
    payStatus: leave.paidUnpaid ?? '',
    onViewDetailWidget: LeaveDetailBottomSheet(
      requestDate: leave.leaveCreatedDate ?? '',
      leaveDateView: leave.leaveDateView ?? '',
      leaveDayView: leave.leaveDayView ?? '',
      approvedByName: leave.approvedByName ?? '',
      leaveRequestedDate: leave.leaveRequestedDate ?? '',
      approvedDate: leave.leaveApprovedDate ?? '',
      leaveType: leave.leaveTypeName ?? '',
      leaveDuration: leave.halfDaySession ?? '',
      reason: (leave.autoLeave == true)
          ? leave.autoLeaveReason ?? ''
          : leave.leaveReason ?? '',
      altPhone: leave.leaveAlternateNumber ?? '',
      taskDependency: leave.leaveTaskDependency == true ? 'Yes' : 'No',
      status: leave.leaveStatusView ?? '',
      dependencyHandle: leave.leaveHandleDependency ?? '',
      attachments:
          leave.leaveAttachment
              ?.split(',')
              .where((e) => e.trim().isNotEmpty)
              .toList() ??
          [],

      detailColor: _getStatusColor(leave.leaveStatus, leave.autoLeave),
      autoLeave: leave.autoLeave ?? false,
      paidUnpaid: leave.paidUnpaid ?? '',
    ),
    leaveEntity: leave,
  );

  Color _getStatusColor(String? status, bool? autoLeave) {
    if (autoLeave == true) {
      return AppColors.primary;
    } else {
      switch (status) {
        case '1': // Approved
          return AppColors.secondary;
        case '2': // Rejected
          return AppColors.red;
        default: // Pending
          return AppColors.spanishYellow;
      }
    }
  }

  Color _getShortLeaveStatusColor(String? status) {
    switch (status) {
      case '1': // Approved
        return AppColors.secondary;
      case '2': // Rejected
        return AppColors.red;
      default: // Pending
        return AppColors.spanishYellow;
    }
  }

  ShortLeaveEntry _convertToShortLeaveEntry(LeaveHistoryEntity leave) =>
      ShortLeaveEntry(
        date: leave.shortLeaveDateView ?? '',
        subType: 'Short Leave',
        leaveTime: leave.shortLeaveTime ?? '',
        reason: leave.shortLeaveApplyReason ?? '',
        approvedBy: leave.shortLeaveStatusChangeName ?? '',
        status: leave.shortLeaveStatusView ?? '',
        rejectReason: leave.shortLeaveStatusChangeReason ?? '',
        detailColor: _getShortLeaveStatusColor(leave.shortLeaveStatus),
        leaveEntity: leave,
      );

  SandwichLeaveEntry _convertToSandwichLeaveEntry(LeaveHistoryEntity leave) =>
      SandwichLeaveEntry(
        date: leave.sandwichLeaveDateView ?? '',
        subType: 'Sandwich Leave',
        reason: '${leave.prevLeaveDate}-${leave.nextLeaveDate}',
        status: 'Approved',
        isSalaryGenerated: leave.isSalaryGenerated ?? false,
      );
}
