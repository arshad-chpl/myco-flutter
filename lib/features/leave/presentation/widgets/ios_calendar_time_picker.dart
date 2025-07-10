// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:myco_flutter/core/theme/colors.dart';
// import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';
//
// class DialDatePickerWidget extends StatefulWidget {
//   final DateTime initialDate;
//   final void Function(DateTime selectedDate) onSubmit;
//   final DateTime? minDate;
//   final DateTime? maxDate;
//   final bool pickDay;
//   final bool timePicker; // NEW
//   final Widget? image;
//   final double? bottomSheetHeight;
//   final double? height;
//   final double? width;
//   final bool? use24hFormat;
//
//   const DialDatePickerWidget({
//     required this.initialDate,
//     required this.onSubmit,
//     super.key,
//     this.minDate,
//     this.maxDate,
//     this.pickDay = true,
//     this.timePicker = false, // NEW
//     this.image,
//     this.height,
//     this.width,
//     this.bottomSheetHeight,
//     this.use24hFormat,
//   });
//
//   @override
//   State<DialDatePickerWidget> createState() => _DialDatePickerWidgetState();
// }
//
// class _DialDatePickerWidgetState extends State<DialDatePickerWidget> {
//   late DateTime _selectedDate;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedDate = widget.initialDate;
//
//     if (widget.minDate != null && _selectedDate.isBefore(widget.minDate!)) {
//       _selectedDate = widget.minDate!;
//     }
//     if (widget.maxDate != null && _selectedDate.isAfter(widget.maxDate!)) {
//       _selectedDate = widget.maxDate!;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) => Container(
//     height:
//         widget.bottomSheetHeight ?? MediaQuery.of(context).size.height * 0.4,
//     width: double.infinity,
//     color: CupertinoColors.systemBackground.resolveFrom(context),
//     child: Column(
//       children: [
//         Expanded(
//           child: widget.timePicker
//               ? CupertinoDatePicker(
//                   mode: CupertinoDatePickerMode.time,
//                   initialDateTime: _selectedDate,
//                   use24hFormat: widget.use24hFormat ?? false,
//                   onDateTimeChanged: (DateTime newTime) {
//                     setState(() {
//                       _selectedDate = DateTime(
//                         _selectedDate.year,
//                         _selectedDate.month,
//                         _selectedDate.day,
//                         newTime.hour,
//                         newTime.minute,
//                       );
//                     });
//                   },
//                 )
//               : CustomDatePicker(
//                   initialDate: _selectedDate,
//                   minDate: widget.minDate ?? DateTime(1900, 1, 1),
//                   maxDate: widget.maxDate ?? DateTime(2100, 12, 31),
//                   pickDay: widget.pickDay,
//                   onDateChanged: (date) {
//                     setState(() {
//                       _selectedDate = DateTime(
//                         date.year,
//                         date.month,
//                         date.day,
//                         _selectedDate.hour,
//                         _selectedDate.minute,
//                       );
//                     });
//                   },
//                 ),
//         ),
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
//           child: CupertinoButton(
//             padding: const EdgeInsets.all(0),
//             borderRadius: BorderRadius.circular(50),
//             color: AppColors.primary,
//             child: Center(
//               child: Text(
//                 'Submit',
//                 style: MyCoButtonTheme.getMobileTextStyle(context),
//               ),
//             ),
//             onPressed: () {
//               widget.onSubmit(_selectedDate);
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// class CustomDatePicker extends StatefulWidget {
//   final DateTime initialDate;
//   final DateTime minDate;
//   final DateTime maxDate;
//   final ValueChanged<DateTime> onDateChanged;
//   final bool pickDay;
//
//   const CustomDatePicker({
//     required this.initialDate,
//     required this.minDate,
//     required this.maxDate,
//     required this.onDateChanged,
//     super.key,
//     this.pickDay = false,
//   });
//
//   @override
//   State<CustomDatePicker> createState() => _CustomDatePickerState();
// }
//
// class _CustomDatePickerState extends State<CustomDatePicker> {
//   late int selectedDay;
//   late int selectedMonth;
//   late int selectedYear;
//
//   late List<String> monthNames;
//   late List<int> yearList;
//   late List<int> dayList;
//
//   @override
//   void initState() {
//     super.initState();
//     selectedDay = widget.initialDate.day;
//     selectedMonth = widget.initialDate.month;
//     selectedYear = widget.initialDate.year;
//
//     // Month labels
//     monthNames = List.generate(
//       12,
//       (i) => DateFormat.MMM().format(DateTime(0, i + 1)),
//     );
//
//     // Year range
//     yearList = List.generate(
//       widget.maxDate.year - widget.minDate.year + 1,
//       (i) => widget.minDate.year + i,
//     );
//
//     _generateDayList();
//   }
//
//   void _generateDayList() {
//     final isMinMonth =
//         selectedYear == widget.minDate.year &&
//         selectedMonth == widget.minDate.month;
//     final isMaxMonth =
//         selectedYear == widget.maxDate.year &&
//         selectedMonth == widget.maxDate.month;
//
//     final int startDay = isMinMonth ? widget.minDate.day : 1;
//     int endDay = DateTime(selectedYear, selectedMonth + 1, 0).day;
//     if (isMaxMonth) endDay = widget.maxDate.day.clamp(1, endDay);
//
//     dayList = List.generate(endDay - startDay + 1, (i) => startDay + i);
//
//     if (!dayList.contains(selectedDay)) {
//       selectedDay = dayList.last;
//     }
//   }
//
//   void _notifyChange() {
//     final pickedDate = DateTime(
//       selectedYear,
//       selectedMonth,
//       widget.pickDay ? selectedDay : 1,
//     );
//     widget.onDateChanged(pickedDate);
//   }
//
//   Widget _buildPicker({
//     required FixedExtentScrollController controller,
//     required List<Widget> children,
//     required ValueChanged<int> onChanged,
//   }) => Expanded(
//     child: CupertinoPicker(
//       scrollController: controller,
//       itemExtent: 32,
//       onSelectedItemChanged: onChanged,
//       selectionOverlay: Container(
//         decoration: const BoxDecoration(
//           border: Border.symmetric(
//             horizontal: BorderSide(color: AppColors.primary, width: 1.5),
//           ),
//         ),
//         margin: const EdgeInsets.symmetric(horizontal: 6),
//       ),
//       children: children,
//     ),
//   );
//
//   @override
//   Widget build(BuildContext context) => Row(
//     children: [
//       if (widget.pickDay)
//         _buildPicker(
//           controller: FixedExtentScrollController(
//             initialItem: dayList.indexOf(selectedDay),
//           ),
//           children: dayList
//               .map(
//                 (d) => Center(
//                   child: Text(d.toString(), textAlign: TextAlign.center),
//                 ),
//               )
//               .toList(),
//           onChanged: (index) {
//             HapticFeedback.lightImpact();
//             setState(() {
//               selectedDay = dayList[index];
//               _notifyChange();
//             });
//           },
//         ),
//
//       _buildPicker(
//         controller: FixedExtentScrollController(initialItem: selectedMonth - 1),
//         children: monthNames.map((m) => Center(child: Text(m))).toList(),
//         onChanged: (index) {
//           HapticFeedback.lightImpact();
//           setState(() {
//             selectedMonth = index + 1;
//             _generateDayList();
//             _notifyChange();
//           });
//         },
//       ),
//
//       _buildPicker(
//         controller: FixedExtentScrollController(
//           initialItem: selectedYear - widget.minDate.year,
//         ),
//         children: yearList
//             .map((y) => Center(child: Text(y.toString())))
//             .toList(),
//         onChanged: (index) {
//           HapticFeedback.lightImpact();
//           setState(() {
//             selectedYear = yearList[index];
//             _generateDayList();
//             _notifyChange();
//           });
//         },
//       ),
//     ],
//   );
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime) onSubmit;

  const CustomDatePicker({
    Key? key,
    required this.initialDate,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late int selectedDay;
  late int selectedMonth;
  late int selectedYear;

  final List<String> months = const [
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

  @override
  void initState() {
    super.initState();
    selectedDay = widget.initialDate.day;
    selectedMonth = widget.initialDate.month;
    selectedYear = widget.initialDate.year;
  }

  Widget buildPicker({
    required List<Widget> children,
    required int initialIndex,
    required Function(int) onSelectedItemChanged,
  }) {
    return Expanded(
      child: CupertinoPicker(
        scrollController: FixedExtentScrollController(
          initialItem: initialIndex,
        ),
        itemExtent: 40,
        onSelectedItemChanged: onSelectedItemChanged,
        useMagnifier: true,
        magnification: 1.2,
        selectionOverlay: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Color(0xFF28527A), width: 2),
              bottom: BorderSide(color: Color(0xFF28527A), width: 2),
            ),
          ),
        ),
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final days = List<Widget>.generate(31, (index) {
      return Center(
        child: Text(
          '${index + 1}',
          style: TextStyle(
            fontWeight: (selectedDay == index + 1)
                ? FontWeight.bold
                : FontWeight.normal,
            fontSize: 18,
          ),
        ),
      );
    });

    final monthWidgets = List<Widget>.generate(12, (index) {
      return Center(
        child: Text(
          months[index],
          style: TextStyle(
            fontWeight: (selectedMonth == index + 1)
                ? FontWeight.bold
                : FontWeight.normal,
            fontSize: 18,
          ),
        ),
      );
    });

    final yearWidgets = List<Widget>.generate(101, (index) {
      int year = 1925 + index;
      return Center(
        child: Text(
          '$year',
          style: TextStyle(
            fontWeight: (selectedYear == year)
                ? FontWeight.bold
                : FontWeight.normal,
            fontSize: 18,
          ),
        ),
      );
    });

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Pickers Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              buildPicker(
                children: days,
                initialIndex: selectedDay - 1,
                onSelectedItemChanged: (index) {
                  setState(() => selectedDay = index + 1);
                },
              ),
              buildPicker(
                children: monthWidgets,
                initialIndex: selectedMonth - 1,
                onSelectedItemChanged: (index) {
                  setState(() => selectedMonth = index + 1);
                },
              ),
              buildPicker(
                children: yearWidgets,
                initialIndex: selectedYear - 1925,
                onSelectedItemChanged: (index) {
                  setState(() => selectedYear = 1925 + index);
                },
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Submit Button
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF28527A),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'SUBMIT',
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              widget.onSubmit(
                DateTime(selectedYear, selectedMonth, selectedDay),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
