import 'package:flutter/material.dart';

class MonthYearPickerBottomSheet extends StatefulWidget {
  final int initialMonth;
  final int initialYear;
  final int startYear;
  final int endYear;
  final List<String>? customMonths;
  final double pickerHeight;
  final Function(int month, int year) onSubmit;

  const MonthYearPickerBottomSheet({
    super.key,
    required this.initialMonth,
    required this.initialYear,
    required this.onSubmit,
    this.startYear = 2000,
    this.endYear = 2030,
    this.customMonths,
    this.pickerHeight = 150,
  });

  @override
  State<MonthYearPickerBottomSheet> createState() =>
      _MonthYearPickerBottomSheetState();
}

class _MonthYearPickerBottomSheetState
    extends State<MonthYearPickerBottomSheet> {
  late int selectedMonth;
  late int selectedYear;

  late List<String> months;
  late List<int> years;

  @override
  void initState() {
    super.initState();
    selectedMonth = widget.initialMonth;
    selectedYear = widget.initialYear;

    months =
        widget.customMonths ??
        const [
          'JAN',
          'FEB',
          'MAR',
          'APR',
          'MAY',
          'JUN',
          'JUL',
          'AUG',
          'SEP',
          'OCT',
          'NOV',
          'DEC',
        ];

    years = List.generate(
      widget.endYear - widget.startYear + 1,
      (index) => widget.startYear + index,
    );
  }

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(top: 16, bottom: 24),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Month & Year Picker
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Month Picker
            SizedBox(
              width: 120,
              height: widget.pickerHeight,
              child: ListWheelScrollView.useDelegate(
                itemExtent: 40,
                perspective: 0.003,
                diameterRatio: 1.2,
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedMonth = index;
                  });
                },
                physics: const FixedExtentScrollPhysics(),
                controller: FixedExtentScrollController(
                  initialItem: selectedMonth,
                ),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: months.length,
                  builder: (context, index) {
                    final isSelected = selectedMonth == index;
                    return Center(
                      child: Text(
                        months[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: isSelected
                              ? Colors.blue.shade900
                              : Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 24),
            // Year Picker
            SizedBox(
              width: 80,
              height: widget.pickerHeight,
              child: ListWheelScrollView.useDelegate(
                itemExtent: 40,
                perspective: 0.003,
                diameterRatio: 1.2,
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedYear = years[index];
                  });
                },
                physics: const FixedExtentScrollPhysics(),
                controller: FixedExtentScrollController(
                  initialItem: years.indexOf(selectedYear),
                ),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: years.length,
                  builder: (context, index) {
                    final isSelected = selectedYear == years[index];
                    return Center(
                      child: Text(
                        years[index].toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: isSelected
                              ? Colors.blue.shade900
                              : Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Submit Button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
          ),
          onPressed: () {
            widget.onSubmit(selectedMonth, selectedYear);
            Navigator.pop(context);
          },
          child: const Text('SUBMIT', style: TextStyle(letterSpacing: 1.2)),
        ),
      ],
    ),
  );
}
