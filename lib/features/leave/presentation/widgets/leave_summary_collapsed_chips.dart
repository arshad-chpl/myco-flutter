import 'package:flutter/material.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_grid.dart';

class LeaveSummaryCollapsedChips extends StatelessWidget {
  final List<LeaveSummaryItem> chips;

  const LeaveSummaryCollapsedChips({
    super.key,
    required this.chips,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.02,
        horizontal: width * 0.04,
      ),
      child: LeaveSummarySection(
        summaryItems: chips,
        maxLeavesInMonth: 2,
        isOtherContainer: false,
        onViewDates: () {},
      ),
    );
  }
}
