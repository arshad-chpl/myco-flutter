import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/domain/entities/leave_history_response_entity.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_bloc.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_event.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_state.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_encashment_form.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_expandable_card.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_filter_bottom_sheet.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_collapsed_chips.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_expanded_rows.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_grid.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/show_comp_off_leave_item.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';
import 'package:shimmer/shimmer.dart';

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
    selectedValue = currentYear.toString();
    yearOptions = [
      (currentYear - 1).toString(),
      currentYear.toString(),
      (currentYear + 1).toString(),
    ];
    _fetchLeaveList(); // Initial API call
  }

  // Function to fetch leave list by year
  void _fetchLeaveList() {
    context.read<LeaveBloc>().add(FetchNewLeaveListType(selectedValue));
  }

  // Function to fetch comp-off leaves
  void _fetchCompOffLeaves(String startDate, String endDate) {
    context.read<LeaveBloc>().add(FetchCompOffLeaves(startDate, endDate));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        onPressed: () {
          context.go(RoutePaths.leave);
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
                  _fetchLeaveList(); // API call on filter change
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
    body: BlocConsumer<LeaveBloc, LeaveState>(
      listener: (context, state) {
        if (state is LeaveError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is CompOffLeavesFetched) {
          if (state.compOffLeaveResponseEntity.leaves?.isNotEmpty ?? false) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              builder: (_) => CompOffLeavesScreen(
                leaveResponse: state.compOffLeaveResponseEntity,
              ),
            );
          } else {
            // Show toast for no data and trigger leave list fetch
            Fluttertoast.showToast(
              msg: 'No leave data available',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 16.0,
            );
            _fetchLeaveList(); // Trigger leave list fetch when leaves are empty
          }
        }
      },
      builder: (context, state) {
        if (state is LeaveLoading) {
          return _buildSkeletonLoader(context);
        } else if (state is LeaveListTypeFetched) {
          final leaveTypes = _mapResponseToLeaveTypes(state.newLeaveListType);
          return _buildLeaveList(context, leaveTypes);
        } else if (state is LeaveError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message),
                ElevatedButton(
                  onPressed: _fetchLeaveList,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        } else if (state is CompOffLeavesFetched &&
            (state.compOffLeaveResponseEntity.leaves?.isEmpty ?? true)) {
          // Handle empty comp-off leaves by triggering fetch and showing a loading state
          _fetchLeaveList();
          return _buildSkeletonLoader(context); // Show loader while fetching
        }
        return const Center(child: Text('Please wait...'));
      },
    ),
  );

  List<Map<String, dynamic>> _mapResponseToLeaveTypes(
      LeaveHistoryResponseEntity response,
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
        },
      )
          .toList() ??
          [];

  List<LeaveRowData> _generateRowsForLeaveType(LeaveTypeEntity leave) {
    final bool isSpecialLeave = leave.specialLeave == '1';
    final isLeaveRestricted = leave.leaveRestrictions == true;
    final isApplyLeaveEncashment =
    (leave.leaveEncashmentOption != null &&
        leave.leaveEncashmentOption == '1' &&
        leave.encashmentAllowed != null &&
        leave.encashmentAllowed != '0');

    final hasMonthlyLeaveBalance =
        leave.userMonthlyLeaveBalanceData != null &&
            leave.userMonthlyLeaveBalanceData!.isNotEmpty;

    return [
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
      if (leave.leaveCreditLastDate != null &&
          leave.leaveCreditLastDate!.isNotEmpty)
        LeaveRowData(
          label: 'Leave Credit Last Date',
          value: leave.leaveCreditLastDate!,
          isVisible: true,
        ),
      LeaveRowData(
        label: 'Applicable Max Leaves In Month',
        value: leave.applicableLeavesInMonth ?? '0',
        isVisible: true,
      ),
      if (!isSpecialLeave && !hasMonthlyLeaveBalance) ...[
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
      if (hasMonthlyLeaveBalance)
        LeaveRowData(
          label: 'Monthly Leave Balance',
          value: '',
          isVisible: true,
          isMonthlyData: true,
          monthlyData: leave.userMonthlyLeaveBalanceData,
        ),
      if (leave.leaveExpireAfterDays != null &&
          leave.leaveExpireAfterDays!.isNotEmpty)
        LeaveRowData(
          label: 'Available Till Days',
          value: leave.leaveExpireAfterDays!,
          isVisible: true,
        ),
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
          if (leave.userTotalUsedLeave?.trim().isNotEmpty ?? false) {
            final startDate = leave.startDate?.trim().isNotEmpty ?? false
                ? leave.startDate!
                : '';
            final endDate = leave.endDate?.trim().isNotEmpty ?? false
                ? leave.endDate!
                : '';
            _fetchCompOffLeaves(startDate, endDate); // API call for comp-off leaves
          } else {
            Fluttertoast.showToast(
              msg: 'No leave data available',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
      ),
      LeaveRowData(
        label: 'Apply for leave encashment',
        value: 'Apply',
        isVisible: isApplyLeaveEncashment,
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: DraggableScrollableSheet(
                expand: false,
                minChildSize: 0.5,
                maxChildSize: 0.8,
                builder: (context, scrollController) => SingleChildScrollView(
                  controller: scrollController,
                  child: SafeArea(
                    child: LeaveEncashmentForm(
                      leaveOptions: const [
                        'Earned Leave',
                        'Casual Leave',
                        'Comp Off',
                      ],
                      onSave: (selectedLeave, remark) {
                        Navigator.pop(context);
                      },
                      onCancel: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ];
  }

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
        final leaveData = leave['leaveData'] as LeaveTypeEntity;
        return LeaveExpandableCard(
          headerHeight: 0.08 * Responsive.getHeight(context),
          headerColor: leave['headerColor'],
          title: '${leave['title']} (Total ${leave['total']})',
          collapsedChild: LeaveSummaryCollapsedChips(
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
                value: leave['carryForward'].toString(),
              ),
            ],
          ),
          expandedChild: LeaveSummaryExpandedRows(
            rows: _generateRowsForLeaveType(leaveData),
          ),
        );
      },
    ),
  );

  Widget _buildSkeletonLoader(BuildContext context) => ListView.separated(
    padding: const EdgeInsets.all(16.0),
    itemCount: 6,
    separatorBuilder: (_, __) => const SizedBox(height: 16),
    itemBuilder: (context, index) => Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20,
              width: 0.4 * Responsive.getWidth(context),
              color: Colors.white,
            ),
            const SizedBox(height: 12),
            Row(
              children: List.generate(
                3,
                    (_) => Container(
                  margin: const EdgeInsets.only(right: 8),
                  height: 20,
                  width: 80,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(height: 12, width: double.infinity, color: Colors.white),
            const SizedBox(height: 8),
            Container(
              height: 12,
              width: 0.8 * Responsive.getWidth(context),
              color: Colors.white,
            ),
          ],
        ),
      ),
    ),
  );
}