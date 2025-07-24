import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/domain/entities/leave_history_response_entity.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/assign_leave_months.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_encashment_form.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_expandable_card.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_expanded_rows.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

// Note: Assuming LeaveRowData is defined in a shared location
// For example: 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_expanded_rows.dart';

/// Maps the API response to a list of maps suitable for the UI.
List<Map<String, dynamic>> mapResponseToLeaveTypes(
  LeaveHistoryResponseEntity response,
) {
  return response.leaveTypes
          ?.map(
            (leave) => {
              'title': leave.leaveTypeName ?? 'Unknown Leave',
              'total': leave.userTotalLeave ?? '0',
              'used': leave.userTotalUsedLeave ?? '0',
              'remaining': leave.remainingLeave ?? '0',
              'payout': leave.totalPayout ?? '0',
              'carryForward': leave.totalCarryForward ?? '0',
              'headerColor': AppColors.secondary,
              'leaveData': leave, // Store the full LeaveType object
            },
          )
          .toList() ??
      [];
}

/// Generates a list of [LeaveRowData] for a specific leave type.
///
/// Encapsulates the complex business logic for displaying leave details.
List<LeaveRowData> generateRowsForLeaveType({
  required BuildContext context,
  required LeaveTypeEntity leave,
  required Function(String startDate, String endDate) onFetchCompOff,
}) {
  final isSpecialLeave = leave.specialLeave == '1';
  final isLeaveRestricted = leave.leaveRestrictions == true;
  final hasMonthlyLeaveBalance =
      leave.userMonthlyLeaveBalanceData?.isNotEmpty ?? false;
  final monthlyData = _convertMonthlyLeaveBalanceToMonthData(
    context,
    leave.userMonthlyLeaveBalanceData,
  );
  final isAvailableTillDate =
      leave.leaveExpireAfterDays != null &&
      leave.leaveExpireAfterDays!.isNotEmpty;
  final totalEncashment = leave.encasementSummary?.totalEncashment;
  final totalPaid = leave.encasementSummary?.totalPaid;
  final totalUnpaid = leave.encasementSummary?.totalUnpaid;
  // This is a placeholder as the original code had a compile error here.
  // The original code was isVisible: false, so this feature is likely incomplete or disabled.
  final isApplyLeaveEncashment = false;

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
    if (!isSpecialLeave && !hasMonthlyLeaveBalance) ...[
      LeaveRowData(
        label: 'leave_calculation',
        value: leave.leaveCalculation ?? 'N/A',
        isVisible: true,
      ),
      LeaveRowData(
        label: 'view_leave_count',
        value: leave.assignLeaveFrequency ?? 'N/A',
        isVisible: true,
      ),
      LeaveRowData(
        label: 'leaves_according_to_payroll_cycle',
        value: leave.leavesAccordingToPayrollCycle ?? 'No',
        isVisible: true,
      ),
    ],
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
        onTap: () => _showLeaveRestrictions(context, leave),
      ),
    ],
    if (!isSpecialLeave) ...[
      LeaveRowData(
        label: 'take_leave_during_notice_period',
        value: leave.takeLeaveDuringNoticePeriod ?? 'No',
        isVisible: true,
      ),
      LeaveRowData(
        label: 'max_leave_during_notice_period',
        value: leave.maxLeaveDuringNoticePeriod ?? '0',
        isVisible: true,
      ),
      LeaveRowData(
        label: 'take_leave_during_probation_period',
        value: leave.takeLeaveDuringProbationPeriod ?? 'No',
        isVisible: true,
      ),
      LeaveRowData(
        label: 'Max Leave Per Month During Probation Period',
        value: leave.maxLeavePerMonthDuringProbationPeriod ?? '0',
        isVisible: true,
      ),
    ],
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
      // Make the onTap callback async
      onTap: () async {
        final currentContext =
            context; // 👈 capture context before any async gap

        if (leave.userTotalUsedLeave?.trim().isNotEmpty ?? false) {
          final startDate = leave.startDate?.trim() ?? '';
          final endDate = leave.endDate?.trim() ?? '';
          await onFetchCompOff(startDate, endDate);
          // Show loader
        }
      },
    ),
    if (isSpecialLeave)
      LeaveRowData(
        label: 'apply_for_leave_encashment',
        value: 'Apply',
        isVisible: isApplyLeaveEncashment,
        onTap: () => _showLeaveEncashmentForm(context),
      ),
  ];
}

// Private helper to convert monthly balance data for the UI
List<MonthData> _convertMonthlyLeaveBalanceToMonthData(
  BuildContext context,
  Map<String, String>? monthlyBalance,
) {
  if (monthlyBalance == null || monthlyBalance.isEmpty) return [];

  return monthlyBalance.entries.map((entry) {
    return MonthData(
      name: entry.key,
      value: int.tryParse(entry.value) ?? 0,
      backgroundColor: AppTheme.getColor(context).surface,
      textColor: Colors.black,
      valueColor: AppColors.primary,
      selectedBackgroundColor: Colors.blue.shade100,
      selectedTextColor: Colors.black,
      selectedValueColor: Colors.blue.shade800,
    );
  }).toList();
}

// Private helper to show leave restrictions bottom sheet
void _showLeaveRestrictions(BuildContext context, LeaveTypeEntity leave) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      final maxHeight = Responsive.getHeight(context) * 0.9;
      return FractionallySizedBox(
        heightFactor: null,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxHeight),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            padding: const EdgeInsets.all(18),
            child: SingleChildScrollView(
              child: Column(
                // Spacing property is not available on Column. Use a Separator or Padding.
                children: [
                  LeaveExpandableCard(
                    title: 'Total Leave Days',
                    initiallyExpanded: true,
                    isText: true,
                    TextChild: Text(
                      "Apply Before",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17 * Responsive.getResponsiveText(context),
                        color: AppTheme.getColor(context).onPrimary,
                      ),
                    ),
                    collapsedChild: const SizedBox.shrink(),
                    expandedChild: LeaveSummaryExpandedRows(
                      rows:
                          leave.leaveRestrictionsRules
                              ?.map(
                                (e) => LeaveRowData(
                                  label: e.leave!,
                                  value: e.applyBefore!,
                                  isVisible: true,
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  ),
                  const SizedBox(height: 25),
                  MyCoButton(
                    boarderRadius: 50,
                    isShadowBottomLeft: true,
                    onTap: () => context.pop(),
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
}

// Private helper to show leave encashment bottom sheet
void _showLeaveEncashmentForm(BuildContext context) {
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
              leaveOptions: const ['Earned Leave', 'Casual Leave', 'Comp Off'],
              onSave: (selectedLeave, remark) => context.pop(),
              onCancel: () => context.pop(),
            ),
          ),
        ),
      ),
    ),
  );
}
