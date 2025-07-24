import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_bloc.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_event.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_state.dart';
import 'package:myco_flutter/features/leave/presentation/leave_utils/leave_skeloton/leave_balance_skeleton_loader.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_balance_list_view.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/show_comp_off_leave_item.dart';
import 'package:myco_flutter/widgets/custom_loader_dialog.dart';

class LeaveBalanceContent extends StatelessWidget {
  final LeaveState state;
  final VoidCallback onRetry;
  final VoidCallback onFetchLeaveList;

  const LeaveBalanceContent({
    required this.state,
    required this.onRetry,
    required this.onFetchLeaveList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentState = state; // To help with type promotion
    if (currentState is LeaveLoading) {
      return const LeaveBalanceSkeletonLoader();
    }

    if (currentState is LeaveListTypeFetched) {
      return LeaveBalanceListView(
        leaveHistory: currentState.newLeaveListType,
        onFetchCompOff: (startDate, endDate) async {
          final safeContext = context;
          final userTotalUsedLeave =
              currentState.newLeaveListType.leaveTypes?[0].userTotalUsedLeave;

          if (userTotalUsedLeave?.trim().isNotEmpty ?? false) {
            CustomLoaderDialog.show(safeContext);
            try {
              final leaveBloc = safeContext.read<LeaveBloc>();
              leaveBloc.add(FetchCompOffLeaves(startDate, endDate));

              final resultState = await leaveBloc.stream.firstWhere(
                (state) => state is CompOffLeavesFetched || state is LeaveError,
              );

              if (resultState is CompOffLeavesFetched &&
                  (resultState.compOffLeaveResponseEntity.leaves?.isNotEmpty ??
                      false)) {
                await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => CompOffLeavesScreen(
                    leaveResponse: resultState.compOffLeaveResponseEntity,
                  ),
                );
              }
            } finally {
              if (safeContext.mounted && safeContext.canPop()) {
                safeContext.pop();
              }
            }
          }
        },
      );
    }

    if (currentState is LeaveError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(currentState.message),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              child: Text(LanguageManager().get('retry')),
            ),
          ],
        ),
      );
    }

    // This handles the case where CompOff leaves were fetched but were empty.
    // The listener in the main screen will have already triggered a refetch.
    // We show a loader while waiting for the new state.
    if (currentState is CompOffLeavesFetched &&
        (currentState.compOffLeaveResponseEntity.leaves?.isNotEmpty ?? false)) {
      onFetchLeaveList();
      return const LeaveBalanceSkeletonLoader();
    }

    // Default/Initial state
    return Center(child: Text(LanguageManager().get('wait_please')));
  }
}
