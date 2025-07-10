import 'package:flutter/material.dart';
import 'package:myco_flutter/features/leave/presentation/pages/my_leave_balance_screen.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_summary_grid.dart';

class LeaveSummaryCard extends StatelessWidget {
  final List<LeaveSummaryItem> chips;
  final List<LeaveRowData> rows;

  const LeaveSummaryCard({
    super.key,
    required this.chips,
    required this.rows
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeaveSummarySection(
            summaryItems: chips,
            maxLeavesInMonth: 2,
            isOtherContainer: false,
            onViewDates: () {},
          ),

          // Dynamic Dotted Rows
          ...rows.map((row) {
            if (row.label == 'View Dates' || row.label == 'Apply for leave encashment?') {
              return InkWell(
                onTap: row.onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        row.label,
                        style: TextStyle(
                          fontSize: 14,
                          color: row.onTap != null ? Colors.blue : Colors.black,
                          decoration: row.onTap != null ? TextDecoration.underline : TextDecoration.none,
                        ),
                      ),
                      if (row.value.isNotEmpty)
                        Text(
                          row.value,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            } else {
              return _dottedRow(row.label, row.value, onTap: row.onTap);
            }
          }),
        ],
      ),
    );
  }
  Widget _dottedRow(String title, String value, {VoidCallback? onTap}) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: InkWell(
      onTap: onTap,
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
    ),
  );
}

