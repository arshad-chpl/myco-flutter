import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/assign_leave_months.dart';

class LeaveRowData {
  final String label;
  final String value;
  final bool isVisible;
  final VoidCallback? onTap;
  final bool isMonthlyData;
  final List<MonthData>? monthlyData;
  final bool isKey;

  LeaveRowData({
    required this.label,
    required this.value,
    required this.isVisible,
    this.onTap,
    this.isMonthlyData = false,
    this.monthlyData,
    this.isKey = true, // default true
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
            if (row.label == 'view_dates' ||
                row.label == 'apply_for_leave_encashment') {
              return InkWell(
                onTap: row.onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          LanguageManager().get(row.label),
                          style: TextStyle(
                            fontSize: 14,
                            color: row.label == 'apply_for_leave_encashment'
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
              return _dottedRow(
                row.label,
                row.value,
                onTap: row.onTap,
                isKey: row.isKey,
              );
            }
          }),
        ],
      ),
    );
  }

  Widget _dottedRow(
    String label,
    String value, {
    TextStyle? labelStyle,
    TextStyle? valueStyle,
    VoidCallback? onTap,
    bool isKey = true,
  }) {
    final defaultLabelStyle = const TextStyle(fontSize: 14);
    final defaultValueStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    final displayLabel = isKey ? LanguageManager().get(label) : label;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Row(
          children: [
            Text(displayLabel, style: labelStyle ?? defaultLabelStyle),
            const SizedBox(width: 4),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  const dotWidth = 4.0;
                  final count = (constraints.maxWidth / dotWidth).floor();
                  final dots = List.filled(count, '-').join();

                  return Text(
                    dots,
                    overflow: TextOverflow.clip,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.4),
                      letterSpacing: 1,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 4),
            Text(value, style: valueStyle ?? defaultValueStyle),
          ],
        ),
      ),
    );
  }

  // Widget _dottedRow(
  //   String title,
  //   String value, {
  //   VoidCallback? onTap,
  // }) => Padding(
  //   padding: const EdgeInsets.symmetric(vertical: 6),
  //   child: InkWell(
  //     onTap: onTap,
  //     child: Row(
  //       children: [
  //         Expanded(
  //           child: Text.rich(
  //             TextSpan(
  //               children: [
  //                 TextSpan(text: title, style: const TextStyle(fontSize: 14)),
  //                 const TextSpan(text: ' ', style: TextStyle(fontSize: 14)),
  //                 const TextSpan(
  //                   text: '.......................',
  //                   style: TextStyle(
  //                     fontSize: 14,
  //                     letterSpacing: 2,
  //                     fontWeight: FontWeight.w300,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         const SizedBox(width: 8),
  //         Text(
  //           value,
  //           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
  //         ),
  //       ],
  //     ),
  //   ),
  // );
}
