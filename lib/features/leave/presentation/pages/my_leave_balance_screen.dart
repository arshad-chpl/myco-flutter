import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/domain/entities'
    '/leave_history_response_entity.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_bloc.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_event.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_state.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/assign_leave_months.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_encashment_form.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_expandable_card.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_filter_bottom_sheet.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_collapsed_chips.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_expanded_rows.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_grid.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/show_comp_off_leave_item.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';
import 'package:shimmer/shimmer.dart';

// Assuming LeaveSummaryItem and LeaveRowData classes are defined

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
    appBar: CustomAppbar(
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back_outlined),
      ),
      isKey: true,
      title: 'your_leaves',
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
    body: BlocConsumer<LeaveBloc, LeaveState>(
      listener: (context, state) {
        if (state is LeaveError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
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
              textColor: AppTheme.getColor(context).surface,
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
                  child: Text(LanguageManager().get('retry')),
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
        return Center(child: Text(LanguageManager().get('wait_please')));
      },
    ),
  );

  // Helper method to map GetNewListTypeResponse to leaveTypes list
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
              // Store the full LeaveType object for rows
            },
          )
          .toList() ??
      [];

  // Helper method to generate rows for a specific leave type
  List<LeaveRowData> _generateRowsForLeaveType(LeaveTypeEntity leave) {
    final isSpecialLeave = leave.specialLeave == '1';
    final isLeaveRestricted = leave.leaveRestrictions == true;

    final isApplyLeaveEncashment =
        (leave.leaveEncashmentOption != null &&
        leave.leaveEncashmentOption == '1' &&
        leave.encashmentAllowed != null &&
        leave.encashmentAllowed != '0');

    final hasMonthlyLeaveBalance =
        leave.userMonthlyLeaveBalanceData != null &&
        leave.userMonthlyLeaveBalanceData!.isNotEmpty;

    final monthlyData = _convertMonthlyLeaveBalanceToMonthData(
      leave.userMonthlyLeaveBalanceData,
    );

    final isAvailableTillDate =
        leave.leaveExpireAfterDays != null &&
        leave.leaveExpireAfterDays!.isNotEmpty;

    final totalEncashment = leave.encasementSummary?.totalEncashment;
    final totalPaid = leave.encasementSummary?.totalPaid;
    final totalUnpaid = leave.encasementSummary?.totalUnpaid;

    return [
      LeaveRowData(
        label: 'Assign Leave',
        value: 'View',
        isMonthlyData: true,
        monthlyData: monthlyData,
        isVisible: hasMonthlyLeaveBalance,
        onTap: () {
          // Handle view rules click
        },
      ),

      if (!hasMonthlyLeaveBalance)
        LeaveRowData(
          label: 'applicable_max_leaves_in_month',
          value: leave.applicableLeavesInMonth ?? '0',
          isVisible: true,
        ),

      if (!isSpecialLeave && !hasMonthlyLeaveBalance)
        LeaveRowData(
          label: 'leave_calculation',
          value: leave.leaveCalculation ?? 'N/A',
          isVisible: true,
        ),

      if (!isSpecialLeave && !hasMonthlyLeaveBalance)
        LeaveRowData(
          label: 'view_leave_count',
          value: leave.assignLeaveFrequency ?? 'N/A',
          isVisible: true,
        ),

      if (!isSpecialLeave && !hasMonthlyLeaveBalance)
        LeaveRowData(
          label: 'leaves_according_to_payroll_cycle',
          value: leave.leavesAccordingToPayrollCycle ?? 'No',
          isVisible: true,
        ),

      if (!isSpecialLeave) ...[
        LeaveRowData(
          label: 'leave_restrictions',
          value: leave.leaveRestrictions == true ? 'Yes' : 'No',
          isVisible: true,
        ),

        LeaveRowData(
          label: '',
          value: 'view',
          isVisible: isLeaveRestricted,
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                final maxHeight = Responsive.getHeight(context) * 0.9;

                return FractionallySizedBox(
                  heightFactor: null, // allow child to define height
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: maxHeight),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                      padding: const EdgeInsets.all(18),
                      child: SingleChildScrollView(
                        child: Column(
                          spacing: 25,
                          children: [
                            LeaveExpandableCard(
                              title: 'Total Leave Days',

                              initiallyExpanded: true,
                              isText: true,
                              TextChild: Text(
                                "Apply Before",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      17 *
                                      Responsive.getResponsiveText(context),
                                  color: AppTheme.getColor(context).onPrimary,
                                ),
                              ),
                              collapsedChild: const SizedBox.shrink(),
                              expandedChild: LeaveSummaryExpandedRows(
                                rows: leave.leaveRestrictionsRules!
                                    .map(
                                      (e) => LeaveRowData(
                                        label: e.leave!,
                                        value: e.applyBefore!,
                                        isVisible: true,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            MyCoButton(
                              boarderRadius: 50,
                              isShadowBottomLeft: true,
                              onTap: () {
                                context.pop();
                              },
                              title: 'CLOSE',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );

            // Handle view rules click
          },
        ),
      ],

      if (!isSpecialLeave)
        LeaveRowData(
          label: 'take_leave_during_notice_period',
          value: leave.takeLeaveDuringNoticePeriod ?? 'No',
          isVisible: true,
        ),

      if (!isSpecialLeave)
        LeaveRowData(
          label: 'max_leave_during_notice_period',
          value: leave.maxLeaveDuringNoticePeriod ?? '0',
          isVisible: true,
        ),

      if (!isSpecialLeave)
        LeaveRowData(
          label: 'take_leave_during_probation_period',
          value: leave.takeLeaveDuringProbationPeriod ?? 'No',
          isVisible: true,
        ),
      if (!isSpecialLeave)
        LeaveRowData(
          label: 'Max Leave Per Month During Probation Period',
          value: leave.maxLeavePerMonthDuringProbationPeriod ?? '0',
          isVisible: true,
        ),

      if (isAvailableTillDate)
        LeaveRowData(
          label: 'available_till_days',
          value: leave.leaveExpireAfterDays!,
          isVisible: true,
        ),

      if (leave.leaveCreditLastDate != null &&
          leave.leaveCreditLastDate!.isNotEmpty)
        LeaveRowData(
          label: 'leave_credit_last_date',
          value: leave.leaveCreditLastDate!,
          isVisible: true,
        ),

      if (leave.encasementSummary != null) ...[
        if (totalEncashment != null &&
            totalEncashment != '0' &&
            totalEncashment.isNotEmpty)
          LeaveRowData(
            label: 'total_encashment_leave',
            value: leave.encasementSummary?.totalEncashment ?? '0',
            isVisible: true,
          ),

        if (totalPaid != null && totalPaid != '0' && totalPaid.isNotEmpty)
          LeaveRowData(
            label: 'paid_encashment_leave',
            value: leave.encasementSummary?.totalPaid ?? '0',
            isVisible: true,
          ),

        if (totalUnpaid != null && totalUnpaid != '0' && totalUnpaid.isNotEmpty)
          LeaveRowData(
            label: 'unpaid_encashment_leave',
            value: leave.encasementSummary?.totalUnpaid ?? '0',
            isVisible: true,
          ),
      ],

      LeaveRowData(
        label: 'view_dates',
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
            _fetchCompOffLeaves(
              startDate,
              endDate,
            ); // API call for comp-off leaves
          } else {
            Fluttertoast.showToast(
              msg: 'No leave data available',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.black54,
              textColor: AppTheme.getColor(context).surface,
              fontSize: 16.0,
            );
          }
        },
      ),

      if (isSpecialLeave)
        LeaveRowData(
          label: 'apply_for_leave_encashment',
          value: 'Apply',
          // isVisible: isApplyLeaveEncashment,
          isVisible: false,
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
                          Navigator.pop(context); // close bottom sheet
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
        final specialLeave = leaveData.specialLeave == '1';
        return LeaveExpandableCard(
          headerHeight: 0.08 * Responsive.getHeight(context),
          headerColor: leave['headerColor'],
          title: '${leave['title']} (Total ${leave['total']})',
          collapsedChild: LeaveSummaryCollapsedChips(
            chips: [
              LeaveSummaryItem(
                title: 'used_leaves',
                value: leave['used'].toString(),
              ),
              LeaveSummaryItem(
                title: 'remaining_leaves',
                value: leave['remaining'].toString(),
              ),
              if (!specialLeave) ...[
                LeaveSummaryItem(
                  title: 'leave_payout',
                  value: leave['payout'].toString(),
                ),
                LeaveSummaryItem(
                  title: 'carry_forward',
                  value: leave['carryForward']
                      .toString(), // Corrected property name
                ),
              ],
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
    itemCount: 7,
    // number of skeleton cards
    separatorBuilder: (_, __) => const SizedBox(height: 16),
    itemBuilder: (context, index) => Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.getColor(context).surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            Container(
              height: 20,
              width: 0.4 * Responsive.getWidth(context),
              color: AppTheme.getColor(context).surface,
            ),
            const SizedBox(height: 12),
            // chips row
            Row(
              children: List.generate(
                3,
                (_) => Container(
                  margin: const EdgeInsets.only(right: 8),
                  height: 20,
                  width: 80,
                  color: AppTheme.getColor(context).surface,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // a few more rows as placeholder
            Container(
              height: 12,
              width: double.infinity,
              color: AppTheme.getColor(context).surface,
            ),
            const SizedBox(height: 8),
            Container(
              height: 12,
              width: 0.8 * Responsive.getWidth(context),
              color: AppTheme.getColor(context).surface,
            ),
          ],
        ),
      ),
    ),
  );

  List<MonthData> _convertMonthlyLeaveBalanceToMonthData(
    Map<String, String>? monthlyBalance,
  ) {
    if (monthlyBalance == null || monthlyBalance.isEmpty) {
      return [];
    }

    return monthlyBalance.entries.map((entry) {
      final monthName = entry.key;
      final leaveBalance = entry.value;

      return MonthData(
        name: monthName,
        value: int.tryParse(leaveBalance) ?? 0,
        backgroundColor: AppTheme.getColor(context).surface,
        textColor: Colors.black,
        valueColor: AppColors.primary,
        selectedBackgroundColor: Colors.blue.shade100,
        selectedTextColor: Colors.black,
        selectedValueColor: Colors.blue.shade800,
      );
    }).toList();
  }
}
