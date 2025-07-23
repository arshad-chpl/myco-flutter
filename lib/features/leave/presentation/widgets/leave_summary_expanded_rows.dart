import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/assign_leave_months.dart';

class LeaveRowData {
  final String label;
  final String value;
  final bool isVisible;
  final VoidCallback? onTap;
  final bool isMonthlyData;
  final List<MonthData>? monthlyData;

  LeaveRowData({
    required this.label,
    required this.value,
    required this.isVisible,
    this.onTap,
    this.isMonthlyData = false,
    this.monthlyData,
  });
}

class LeaveSummaryExpandedRows extends StatelessWidget {
  final List<LeaveRowData> rows;

  const LeaveSummaryExpandedRows({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.01,
        horizontal: width * 0.04,
      ),
      child: Column(
        children: [
          ...rows.map((row) {
            if (!row.isVisible) return const SizedBox.shrink();
            if (row.label == 'View Dates' ||
                row.label == 'Apply for leave encashment') {
              return InkWell(
                onTap: row.onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          row.label,
                          style: TextStyle(
                            fontSize: 14,
                            color: row.label == 'Apply for leave encashment'
                                ? AppColors.greenDark
                                : AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (row.isMonthlyData) {
              return AssignLeaveMonths(months: row.monthlyData ?? []);
            } else {
              return _dottedRow(row.label, row.value, onTap: row.onTap);
            }
          }),
        ],
      ),
    );
  }

  Widget _dottedRow(
    String title,
    String value, {
    VoidCallback? onTap,
  }) => Padding(
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
                  const TextSpan(text: ' ', style: TextStyle(fontSize: 14)),
                  const TextSpan(
                    text: '............................',
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
