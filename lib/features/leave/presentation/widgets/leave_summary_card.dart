import 'package:flutter/material.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_grid.dart';

class LeaveSummaryCard extends StatelessWidget {
  final List<LeaveSummaryItem> chips;
  final List<LeaveRowData> rows;

  const LeaveSummaryCard({super.key, required this.chips, required this.rows});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.02,
        horizontal: width * 0.04,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dynamic Top Info Chips
          LeaveSummarySection(
            summaryItems: chips,
            maxLeavesInMonth: 2,
            isOtherContainer: false,
            onViewDates: () {},
          ),
          // SizedBox(height: height * 0.025),

          // Dynamic Dotted Rows
          ...rows.map((row) => _dottedRow(row.label, row.value)),
        ],
      ),
    );
  }

  Widget _dottedRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: title, style: const TextStyle(fontSize: 14)),
                  const TextSpan(text: " ", style: TextStyle(fontSize: 14)),
                  const TextSpan(
                    text: "............................",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class LeaveChipData {
  final String title;
  final String value;

  LeaveChipData({required this.title, required this.value});
}

class LeaveRowData {
  final String label;
  final String value;

  LeaveRowData({required this.label, required this.value});
}
