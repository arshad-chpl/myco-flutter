import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';

class CustomCalendarBottomSheet extends StatefulWidget {
  final int previousYears;
  final int nextYears;
  final int initialMonth;
  final int initialYear;
  final bool showAllOption;
  final bool initialAllSelected;

  const CustomCalendarBottomSheet({
    required this.initialMonth,
    required this.initialYear,
    super.key,
    this.previousYears = 2,
    this.nextYears = 2,
    this.showAllOption = false,
    this.initialAllSelected = false,
  });

  @override
  CustomCalendarBottomSheetState createState() =>
      CustomCalendarBottomSheetState();
}

class CustomCalendarBottomSheetState extends State<CustomCalendarBottomSheet> {
  late int selectedMonth;
  late int selectedYear;
  int? lastSelectedMonth;
  bool isYearView = false;
  bool isAllSelected = false;

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  void initState() {
    super.initState();
    isAllSelected = widget.initialAllSelected;
    selectedMonth = widget.initialMonth;
    selectedYear = widget.initialYear;
    lastSelectedMonth = isAllSelected ? widget.initialMonth : selectedMonth;
  }

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
        bottom: Radius.circular(20),
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              const Text(
                'Select Month & Year',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'bold',
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isYearView = false;
                      });
                    },
                    child: Text(
                      isAllSelected ? 'All' : months[selectedMonth - 1],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'bold',
                      ),
                    ),
                  ),
                  const Text(
                    ' / ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'bold',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isYearView = true;
                      });
                    },
                    child: Text(
                      selectedYear.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'bold',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        SizedBox(
          height: 240,
          child: isYearView ? buildYearGrid() : buildMonthGrid(),
        ),

        const SizedBox(height: 20),

        Padding(
          padding: const EdgeInsets.only(bottom: 16), // Added bottom padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (widget.showAllOption) ...[
                Checkbox(
                  value: isAllSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      isAllSelected = value ?? false;
                      if (isAllSelected) {
                        lastSelectedMonth = selectedMonth;
                      } else {
                        selectedMonth =
                            lastSelectedMonth ?? DateTime.now().month;
                      }
                    });
                  },
                ),
                Text(
                  'ALL',
                  style: TextStyle(
                    fontSize: 18,
                    color: isAllSelected ? AppColors.primary : Colors.black,
                  ),
                ),
                const SizedBox(width: 16),
              ],
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'CANCEL',
                  style: TextStyle(fontSize: 18, fontFamily: 'semibold'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, {
                    'month': isAllSelected ? 0 : selectedMonth,
                    'year': selectedYear,
                  });
                },
                child: const Text(
                  'OK',
                  style: TextStyle(fontSize: 18, fontFamily: 'semibold'),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget buildMonthGrid() => GridView.builder(
    padding: const EdgeInsets.all(12.0),
    itemCount: 12,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 2.5,
    ),
    itemBuilder: (context, index) {
      final bool isSelected = selectedMonth == index + 1;
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedMonth = index + 1;
            lastSelectedMonth = selectedMonth;
            isAllSelected = false;
          });
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color:
                isSelected
                    ? (isAllSelected ? Colors.white : AppColors.primary)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? AppColors.white : AppColors.white,
            ),
          ),
          child: Text(
            months[index],
            style: TextStyle(
              color:
                  isSelected
                      ? (isAllSelected ? Colors.black : Colors.white)
                      : Colors.black,
              fontFamily: 'semibold',
              fontWeight: isSelected ? FontWeight.normal : FontWeight.normal,
            ),
          ),
        ),
      );
    },
  );

  Widget buildYearGrid() {
    final currentYear = DateTime.now().year;
    final years = List<int>.generate(
      widget.previousYears + widget.nextYears + 1,
      (i) => currentYear - widget.previousYears + i,
    );

    return GridView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: years.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 5,
        childAspectRatio: 2.5,
      ),
      itemBuilder: (context, index) {
        final year = years[index];
        final bool isSelected = selectedYear == year;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedYear = year;
              // Do not set isYearView = false; stay in year view
            });
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.white,
              ),
            ),
            child: Text(
              year.toString(),
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontFamily: 'semibold',
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      },
    );
  }
}
