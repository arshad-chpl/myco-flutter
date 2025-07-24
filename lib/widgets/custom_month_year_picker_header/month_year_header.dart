import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_month_year_picker_header/month_year_picker_bottom_sheet.dart';

class MonthYearHeader extends StatefulWidget {
  final int startYear;
  final int endYear;
  final Function(int month, int year) onChanged;

  // Optional Customizations
  final Color? arrowColor;
  final Color? arrowIconColor;
  final Color? disableColor;
  final Color? disableIconColor;
  final Color? headerTextColor;
  final double? headerFontSize;
  final FontWeight? headerFontWeight;
  final double? iconSize;
  final double? arrowCornerRadius;
  final double? horizontalSpacing;

  const MonthYearHeader({
    required this.onChanged,
    super.key,
    //Default Years
    this.startYear = 2000,
    this.endYear = 2030,
    // Default styling values
    this.arrowColor = AppColors.lightBlue,
    this.arrowIconColor = Colors.black,
    this.headerTextColor = Colors.black,
    this.headerFontSize = 16,
    this.headerFontWeight = FontWeight.bold,
    this.iconSize = 24,
    this.arrowCornerRadius = 8,
    this.horizontalSpacing = 8,
    this.disableColor = const Color(0xFFE0E0E0), // light grey
    this.disableIconColor = Colors.grey,
  });

  @override
  State<MonthYearHeader> createState() => _MonthYearHeaderState();
}

class _MonthYearHeaderState extends State<MonthYearHeader> {
  int selectedMonth = 0; // 'All' is at index 0
  int selectedYear = DateTime.now().year;
  bool manuallyChanged = false;

  /// Handle left and right arrow clicks to change month or year
  void _changeMonth(int direction) {
    setState(() {
      if (selectedMonth == 0) {
        // When "All" is selected, change only the year
        final int newYear = selectedYear + direction;
        if (newYear >= widget.startYear && newYear <= widget.endYear) {
          selectedYear = newYear;
          manuallyChanged = true;
          widget.onChanged(selectedMonth, selectedYear);
        }
      } else {
        int newMonth = selectedMonth + direction;
        int newYear = selectedYear;

        if (newMonth < 1) {
          newMonth = 12;
          newYear--;
        } else if (newMonth > 12) {
          newMonth = 1;
          newYear++;
        }

        if (newYear >= widget.startYear && newYear <= widget.endYear) {
          selectedMonth = newMonth;
          selectedYear = newYear;
          manuallyChanged = true;
          widget.onChanged(selectedMonth, selectedYear);
        }
      }
    });
  }

  /// Reset month to "All" and year to current year
  void _clearMonthSelection() {
    setState(() {
      selectedMonth = 0;
      selectedYear = DateTime.now().year;
      manuallyChanged = false;
      widget.onChanged(selectedMonth, selectedYear);
    });
  }

  /// Open custom month-year picker bottom sheet
  void _openMonthYearPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => MonthYearPickerBottomSheet(
        initialMonth: selectedMonth,
        initialYear: selectedYear,
        endYear: widget.endYear,
        startYear: widget.startYear,
        customMonths: LanguageManager().getList('month_arry'),
        onSubmit: (month, year) {
          manuallyChanged = true;
          setState(() {
            selectedMonth = month;
            selectedYear = year;
            manuallyChanged = month != 0;
            widget.onChanged(month, year);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final monthList = LanguageManager().getList('month_arry');
    final double spacing =
        widget.horizontalSpacing ?? 0.1 * Responsive.getWidth(context);

    // Determine whether arrow buttons should be disabled
    bool isLeftDisabled = false;
    bool isRightDisabled = false;

    if (selectedMonth == 0) {
      isLeftDisabled = selectedYear <= widget.startYear;
      isRightDisabled = selectedYear >= widget.endYear;
    } else {
      isLeftDisabled = selectedYear <= widget.startYear && selectedMonth == 1;
      isRightDisabled = selectedYear >= widget.endYear && selectedMonth == 12;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left arrow
        ArrowButton(
          icon: Icons.chevron_left,
          onTap: () => _changeMonth(-1),
          isDisabled: isLeftDisabled,
          backgroundColor: widget.arrowColor,
          iconColor: widget.arrowIconColor,
          disableColor: widget.disableColor,
          disableIconColor: widget.disableIconColor,
          cornerRadius: widget.arrowCornerRadius,
        ),
        // SizedBox(width: spacing),
        // Label with text + month/year + clear or picker icon
        InkWell(
          onTap: _openMonthYearPicker,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${selectedMonth == 0 ? "All" : monthList[selectedMonth].substring(0, 3)}, '
                '$selectedYear',
                style: TextStyle(
                  fontSize:
                      widget.headerFontSize ??
                      16 * Responsive.getResponsiveText(context),
                  fontWeight: widget.headerFontWeight ?? FontWeight.bold,
                  color: widget.headerTextColor ?? Colors.black,
                ),
              ),
              manuallyChanged
                  ? IconButton(
                      onPressed: _clearMonthSelection,
                      icon: Icon(
                        Icons.close_outlined,
                        size:
                            widget.iconSize ??
                            0.02 * Responsive.getHeight(context),
                      ),
                    )
                  : IconButton(
                      onPressed: _openMonthYearPicker,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size:
                            widget.iconSize ??
                            0.02 * Responsive.getHeight(context),
                      ),
                    ),
            ],
          ),
        ),
        // SizedBox(width: spacing),
        // Right arrow
        ArrowButton(
          icon: Icons.chevron_right,
          onTap: () => _changeMonth(1),
          isDisabled: isRightDisabled,
          backgroundColor: widget.arrowColor,
          disableColor: widget.disableColor,
          disableIconColor: widget.disableIconColor,
          iconColor: widget.arrowIconColor,
          cornerRadius: widget.arrowCornerRadius,
        ),
      ],
    );
  }
}

class ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isDisabled;

  // Optional custom styles
  final Color? backgroundColor;
  final Color? disableColor;
  final Color? disableIconColor;
  final Color? iconColor;
  final double? cornerRadius;

  const ArrowButton({
    required this.icon,
    required this.onTap,
    this.isDisabled = false,
    this.backgroundColor,
    this.iconColor,
    this.cornerRadius,
    super.key,
    this.disableColor,
    this.disableIconColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = Responsive.getWidth(context);
    final screenHeight = Responsive.getHeight(context);

    return Material(
      color: isDisabled ? disableColor : backgroundColor ?? AppColors.lightBlue,
      borderRadius: BorderRadius.circular(cornerRadius ?? 8),
      child: InkWell(
        onTap: isDisabled ? null : onTap,
        borderRadius: BorderRadius.circular(cornerRadius ?? 8),
        child: SizedBox(
          width: screenWidth * 0.08,
          height: screenHeight * 0.04,
          child: Icon(
            icon,
            size: screenWidth * 0.05,
            color: isDisabled ? disableIconColor : iconColor ?? Colors.black,
          ),
        ),
      ),
    );
  }
}
