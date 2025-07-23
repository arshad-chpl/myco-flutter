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
  Widget build(BuildContext context) {
    final responsive = Responsive.getResponsive(context);

    return Container(
      height: 0.1 * Responsive.getHeight(context),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12 * responsive),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [
            Colors.transparent,
            Colors.black,
            Colors.black,
            Colors.transparent,
          ],
          stops: [0.0, 0.05, 0.95, 1.0],
        ).createShader(bounds),
        blendMode: BlendMode.dstIn,
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12 * responsive),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 10 * responsive,
                  horizontal: 6 * responsive,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      month.name,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13 * responsive,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 6 * responsive),
                    Text(
                      month.value.toString(),
                      style: TextStyle(
                        fontSize: 15 * responsive,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
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
