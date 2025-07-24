import 'package:flutter/material.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/domain/entities/leave_history_response_entity.dart';
import 'package:myco_flutter/features/leave/presentation/leave_utils/leave_data_mapper.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_expandable_card.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_collapsed_chips.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_expanded_rows.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_grid.dart';

class LeaveBalanceListView extends StatelessWidget {
  final LeaveHistoryResponseEntity leaveHistory;
  final Function(String startDate, String endDate) onFetchCompOff;

  const LeaveBalanceListView({
    required this.leaveHistory,
    required this.onFetchCompOff,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final leaveTypes = mapResponseToLeaveTypes(leaveHistory);

    return Padding(
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
                    value: leave['carryForward'].toString(),
                  ),
                ],
              ],
            ),
            expandedChild: LeaveSummaryExpandedRows(
              rows: generateRowsForLeaveType(
                context: context,
                leave: leaveData,
                onFetchCompOff: onFetchCompOff,
              ),
            ),
          );
        },
      ),
    );
  }
}
