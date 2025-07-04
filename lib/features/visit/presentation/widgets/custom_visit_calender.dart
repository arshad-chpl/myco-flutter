import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class CustomVisitCupertinoDatePicker extends StatefulWidget {
  final DateTime initialDate;

  const CustomVisitCupertinoDatePicker({super.key, required this.initialDate});

  @override
  State<CustomVisitCupertinoDatePicker> createState() =>
      _CustomVisitCupertinoDatePickerState();
}

class _CustomVisitCupertinoDatePickerState
    extends State<CustomVisitCupertinoDatePicker> {
  late int selectedDay;
  late int selectedMonth;
  late int selectedYear;

  final List<String> monthNames = const [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  late List<int> days;
  late List<String> months;
  late List<int> years;

  @override
  void initState() {
    super.initState();
    selectedDay = widget.initialDate.day;
    selectedMonth = widget.initialDate.month;
    selectedYear = widget.initialDate.year;

    final today = DateTime.now();
    days = List.generate(31, (i) => i + 1);
    months = monthNames;
    years = List.generate(9, (i) => today.year - 4 + i);
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Picker Columns
          SizedBox(
            height: 200,
            child: Row(
              children: [
                // Day Picker
                Expanded(
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(
                      initialItem: selectedDay - 1,
                    ),
                    itemExtent: 40,
                    onSelectedItemChanged: (index) {
                      setState(() => selectedDay = days[index]);
                    },
                    children: days.map((day) {
                      final isToday = day == today.day &&
                          selectedMonth == today.month &&
                          selectedYear == today.year;
                      return Center(
                        child: Text(
                          day.toString().padLeft(2, '0'),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: isToday
                                ? AppColors.primary
                                : Colors.black87,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                // Month Picker
                Expanded(
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(
                      initialItem: selectedMonth - 1,
                    ),
                    itemExtent: 40,
                    onSelectedItemChanged: (index) {
                      setState(() => selectedMonth = index + 1);
                    },
                    children: List.generate(months.length, (index) {
                      final isToday = index + 1 == today.month &&
                          selectedDay == today.day &&
                          selectedYear == today.year;
                      return Center(
                        child: Text(
                          months[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: isToday
                                ? AppColors.primary
                                : Colors.black87,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                // Year Picker
                Expanded(
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(
                      initialItem: years.indexOf(selectedYear),
                    ),
                    itemExtent: 40,
                    onSelectedItemChanged: (index) {
                      setState(() => selectedYear = years[index]);
                    },
                    children: years.map((year) {
                      final isToday = year == today.year &&
                          selectedDay == today.day &&
                          selectedMonth == today.month;
                      return Center(
                        child: Text(
                          year.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: isToday
                                ? AppColors.primary
                                : Colors.black87,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Submit Button
          SizedBox(
            width: double.infinity,
            child: MyCoButton(
              title: 'SUBMIT',
              onTap: () {
                Navigator.pop(context, {
                  'day': selectedDay,
                  'month': selectedMonth,
                  'year': selectedYear,
                });
              },
              height: 48, // Matches the 16px vertical padding (16 * 2 = 32 + ~16 for font)
              textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: AppColors.primary,
              isShadowBottomLeft: true,
            ),

          ),
        ],
      ),
    );
  }
}
