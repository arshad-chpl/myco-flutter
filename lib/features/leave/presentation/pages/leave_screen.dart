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
import 'package:myco_flutter/features/leave/presentation/pages/leave_skeloton/short_leave_card_skeleton.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/auto_leave_change.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/custom_fab_menu.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_action_button.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_card.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_detail_bottom_sheet.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_filter_bottom_sheet.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/sandwich_leave_card.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/short_leave_card.dart';
import 'package:myco_flutter/widgets/custom_alert_dialog.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_month_year_picker_header/month_year_header.dart';
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

  void _deleteLeaveRequest(String leaveId) {
    setState(() => isLoading = true);
    context.read<LeaveBloc>().add(DeleteLeaveRequest(leaveId));
  }

  void _changeAutoLeave(
    String userId,
    String paid,
    String leaveTypeId,
    String leaveDate,
    String leaveDay,
    String extraDay,
    String isSpecialDay,
    String attendanceId,
    String leaveId,
    String leavePercentage,
  ) {
    setState(() => isLoading = true);
    context.read<LeaveBloc>().add(
      ChangeAutoLeave(
        userId,
        paid,
        leaveTypeId,
        leaveDate,
        leaveDay,
        extraDay,
        isSpecialDay,
        attendanceId,
        leaveId,
        leavePercentage,
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
        final filteredLeaves = _filterLeaves(leaveHistoryList);

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
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
                ],
              ),
            ),
            Expanded(
              child: isLoading
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      itemCount: 3,
                      itemBuilder: (_, __) => const ShortLeaveCardSkeleton(),
                    )
                  : filteredLeaves.isEmpty
                  ? const Center(child: Text('No leaves found'))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      itemCount: filteredLeaves.length,
                      itemBuilder: (context, index) {
                        final leave = filteredLeaves[index];

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
                                      child: CustomAlertDialog(
                                        alertType: AlertType.delete,
                                        content: 'Do you want to delete?',
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
                            onEdit: ({required leave}) {
                              final leaveBloc = BlocProvider.of<LeaveBloc>(
                                context,
                              );
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(24),
                                  ),
                                ),
                                builder: (bottomSheetContext) => Padding(
                                  padding: EdgeInsets.only(
                                    top: 16,
                                    bottom: MediaQuery.of(
                                      bottomSheetContext,
                                    ).viewInsets.bottom,
                                  ),
                                  child: DraggableScrollableSheet(
                                    expand: false,
                                    initialChildSize: 0.5,
                                    minChildSize: 0.5,
                                    maxChildSize: 0.8,
                                    builder:
                                        (
                                        bottomSheetContext,
                                        scrollController,
                                        ) => BlocProvider.value(
                                      value: leaveBloc,
                                      // Use the stored bloc instance
                                      child: SingleChildScrollView(
                                        controller: scrollController,
                                        child: SafeArea(
                                          child: DialogChangeAutoLeave(
                                            isUser: false,
                                            isUserSandwichLeaveUpdate: true,
                                            updateStatus: true,
                                            leaveBloc: leaveBloc,
                                            leaveHistory: leave,
                                            onSubmit: (EditSandwichLeaveData) {
                                              print(EditSandwichLeaveData.leaveId);
                                              Navigator.of(context).pop();
                                            },
                                            onClose: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return LeaveCard(
                            leave: _convertToLeaveEntry(leave),
                            onDelete: ({leaveId}) {
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
                                  child: CustomAlertDialog(
                                    alertType: AlertType.delete,
                                    content: 'Do you want to delete?',
                                    confirmText: 'Ok',
                                    cancelText: 'Cancel',
                                    onCancel: () {
                                      Navigator.of(context).pop();
                                    },
                                    onConfirm: () {
                                      _deleteLeaveRequest(leaveId ?? '');
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              );
                            },
                            onEdit: ({required leave}) {
                              final isAutoChangeable =
                                  (leave.autoLeave ?? false) &&
                                  !(leave.isSalaryGenerated ?? false);
                              if (isAutoChangeable) {
                                final leaveBloc = BlocProvider.of<LeaveBloc>(
                                  context,
                                ); // Store the bloc here
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(24),
                                    ),
                                  ),
                                  builder: (bottomSheetContext) => Padding(
                                    padding: EdgeInsets.only(
                                      top: 16,
                                      bottom: MediaQuery.of(
                                        bottomSheetContext,
                                      ).viewInsets.bottom,
                                    ),
                                    child: DraggableScrollableSheet(
                                      expand: false,
                                      initialChildSize: 0.5,
                                      minChildSize: 0.5,
                                      maxChildSize: 0.8,
                                      builder:
                                          (
                                            bottomSheetContext,
                                            scrollController,
                                          ) => BlocProvider.value(
                                            value: leaveBloc,
                                            // Use the stored bloc instance
                                            child: SingleChildScrollView(
                                              controller: scrollController,
                                              child: SafeArea(
                                                child: DialogChangeAutoLeave(
                                                  isUser:
                                                      (leave.autoLeave == true),
                                                  isUserSandwichLeaveUpdate:
                                                      (leave.autoLeave != true),
                                                  updateStatus:
                                                      (leave.autoLeave != true),
                                                  leaveBloc: leaveBloc,
                                                  leaveHistory: leave,
                                                  onSubmit: (LeaveSubmitData) {
                                                    String paid;
                                                    if (LeaveSubmitData
                                                        .isPaidLeave) {
                                                      paid = '0';
                                                    } else {
                                                      paid = '1';
                                                    }

                                                    final String attendanceId =
                                                        leave.attendanceId ??
                                                        '';
                                                    final String extraDay;
                                                    if (leave.isExtraDay ==
                                                        true) {
                                                      extraDay = '1';
                                                    } else {
                                                      extraDay = '0';
                                                    }

                                                    _changeAutoLeave(
                                                      leave.userId ?? '',
                                                      paid,
                                                      LeaveSubmitData
                                                          .leaveTypeId,
                                                      leave.leaveDate ?? '',
                                                      LeaveSubmitData
                                                          .leaveDayTypeStatus,
                                                      extraDay,
                                                      LeaveSubmitData
                                                          .isSpecialLeave,
                                                      attendanceId,
                                                      leave.leaveId ?? '',
                                                      LeaveSubmitData
                                                          .leavePercentage
                                                          .toString(),
                                                    );
                                                    Navigator.of(context).pop();
                                                  },
                                                  onClose: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        }
                      },
                    ),
            ),
          ],
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
        leaveEntity: leave,
      );
}
