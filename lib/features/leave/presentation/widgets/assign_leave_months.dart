import 'package:flutter/material.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class AssignLeaveMonths extends StatelessWidget {
  final List<MonthData> months;
  final Function(MonthData)? onTap;
  final MonthData? selectedMonth;

  const AssignLeaveMonths({
    super.key,
    required this.months,
    this.onTap,
    this.selectedMonth,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 0.08 * Responsive.getHeight(context),
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: months.length,
      separatorBuilder: (_, __) => const SizedBox(width: 8),
      itemBuilder: (context, index) {
        final month = months[index];
        final isSelected = month == selectedMonth;

        return GestureDetector(
          onTap: () => onTap?.call(month),
          child: Container(
            width: 0.20 * Responsive.getWidth(context),
            decoration: BoxDecoration(
              color: isSelected
                  ? (month.selectedBackgroundColor ?? Colors.blue.shade100)
                  : (month.backgroundColor ?? Colors.white),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  month.name,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? (month.selectedTextColor ?? Colors.black)
                        : (month.textColor ?? Colors.black),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  month.value.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isSelected
                        ? (month.selectedValueColor ?? Colors.blue)
                        : (month.valueColor ?? Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

class MonthData {
  final String name;
  final int value;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? valueColor;
  final Color? selectedBackgroundColor;
  final Color? selectedTextColor;
  final Color? selectedValueColor;

  MonthData({
    required this.name,
    required this.value,
    this.backgroundColor,
    this.textColor,
    this.valueColor,
    this.selectedBackgroundColor,
    this.selectedTextColor,
    this.selectedValueColor,
  });
}
