import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

Future<String?> showPicker(
  BuildContext context, {
  DateTime? minDate,
  DateTime? maxDate,
  required bool pickDay,
  required bool timePicker,
  Widget? image,
  double? height,
  double? width,
  bool? use24hFormat,
  double? bottomSheetHeight,
}) async {
  final DateTime selectedDate0 = DateTime.now(); // Initialize properly
  final GlobalKey<_CustomTimePickerState> timePickerKey = GlobalKey();
  final GlobalKey<_CustomDatePickerState> datePickerKey = GlobalKey();

  return await showCupertinoModalPopup<String>(
    context: context,
    builder: (_) => Container(
      height: bottomSheetHeight ?? MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: Column(
        children: [
          Expanded(
            child: timePicker
                ? CustomTimePicker(
                    key: timePickerKey,
                    initialDateTime: selectedDate0,
                    use24hFormat: use24hFormat ?? false,
                    onTimeChanged: (_) {},
                  )
                : CustomDatePicker(
                    key: datePickerKey,
                    initialDate: selectedDate0,
                    minDate: minDate ?? DateTime(1900, 1, 1),
                    maxDate: maxDate ?? DateTime(2100, 12, 31),
                    pickDay: pickDay,
                    onDateChanged: (_) {},
                  ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: CupertinoButton(
              padding: const EdgeInsets.all(0),
              borderRadius: BorderRadius.circular(50),
              color: AppTheme.getColor(context).primary,
              child: Center(
                child: Text(
                  'Submit',
                  style: MyCoButtonTheme.getMobileTextStyle(context),
                ),
              ),
              onPressed: () {
                DateTime newDateTime;
                if (timePicker) {
                  final selectedTime = timePickerKey.currentState
                      ?.getSelectedTime();
                  newDateTime = DateTime(
                    selectedDate0.year,
                    selectedDate0.month,
                    selectedDate0.day,
                    selectedTime?.hour ?? selectedDate0.hour,
                    selectedTime?.minute ?? selectedDate0.minute,
                  );
                } else {
                  final selectedDate = datePickerKey.currentState
                      ?.getSelectedDate();
                  newDateTime = DateTime(
                    selectedDate?.year ?? selectedDate0.year,
                    selectedDate?.month ?? selectedDate0.month,
                    selectedDate?.day ?? selectedDate0.day,
                    selectedDate0.hour,
                    selectedDate0.minute,
                  );
                }

                String formatDate(DateTime date) {
                  String monthName(int month) {
                    const months = [
                      'Jan',
                      'Feb',
                      'Mar',
                      'Apr',
                      'May',
                      'Jun',
                      'Jul',
                      'Aug',
                      'Sep',
                      'Oct',
                      'Nov',
                      'Dec',
                    ];
                    return months[month - 1];
                  }

                  if (timePicker) {
                    return DateFormat('hh:mm a').format(date);
                  } else if (pickDay) {
                    return '${monthName(date.month)} ${date.day}, ${date.year}';
                  } else {
                    return '${monthName(date.month)} ${date.year}';
                  }
                }

                // ✅ Send formatted value
                final formatted = formatDate(newDateTime);
                Navigator.of(context).pop('$formatted');
              },
            ),
          ),
        ],
      ),
    ),
  );
}

// -- For Time Picker --
class CustomTimePicker extends StatefulWidget {
  final DateTime initialDateTime;
  final bool use24hFormat;
  final ValueChanged<DateTime> onTimeChanged;

  const CustomTimePicker({
    required this.initialDateTime,
    required this.onTimeChanged,
    this.use24hFormat = false,
    super.key,
  });

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  late int selectedHour;
  late int selectedMinute;
  late String selectedPeriod;

  late List<int> hourList;
  final List<int> minuteList = List.generate(60, (i) => i);
  final List<String> periods = ['AM', 'PM'];

  @override
  void initState() {
    super.initState();
    final dt = widget.initialDateTime;
    if (widget.use24hFormat) {
      hourList = List.generate(24, (i) => i);
      selectedHour = dt.hour;
    } else {
      hourList = List.generate(12, (i) => i + 1);
      selectedHour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
      selectedPeriod = dt.hour >= 12 ? 'PM' : 'AM';
    }
    selectedMinute = dt.minute;
  }

  DateTime getSelectedTime() {
    int hour = selectedHour;
    if (!widget.use24hFormat) {
      if (selectedPeriod == 'PM' && hour < 12) hour += 12;
      if (selectedPeriod == 'AM' && hour == 12) hour = 0;
    }
    return DateTime(0, 1, 1, hour, selectedMinute);
  }

  Widget _buildStaticPicker<T>({
    required BuildContext context,
    required List<T> items,
    required int selectedIndex,
    required ValueChanged<int> onChanged,
    required String Function(T item) displayText,
  }) => Expanded(
    child: CupertinoPicker(
      scrollController: FixedExtentScrollController(initialItem: selectedIndex),
      diameterRatio: 1,
      itemExtent: 32,
      selectionOverlay: Container(
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              color: AppTheme.getColor(context).primary,
              width: 1.5,
            ),
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 6),
      ),
      onSelectedItemChanged: onChanged,
      children: items
          .map(
            (item) => Center(
              child: CustomText(
                displayText(item),
                fontSize: 22 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w600,
              ),
            ),
          )
          .toList(),
    ),
  );

  @override
  Widget build(BuildContext context) => Row(
    children: [
      _buildLoopingPicker<int>(
        context: context,
        items: hourList,
        selectedIndex: hourList.indexOf(selectedHour),
        onChanged: (i) => setState(() => selectedHour = hourList[i]),
        displayText: (val) => val.toString().padLeft(2, '0'),
      ),
      _buildLoopingPicker<int>(
        context: context,
        items: minuteList,
        selectedIndex: selectedMinute,
        onChanged: (i) => setState(() => selectedMinute = i),
        displayText: (val) => val.toString().padLeft(2, '0'),
      ),
      if (!widget.use24hFormat)
        _buildStaticPicker<String>(
          context: context,
          items: periods,
          selectedIndex: periods.indexOf(selectedPeriod),
          onChanged: (i) => setState(() => selectedPeriod = periods[i]),
          displayText: (val) => val,
        ),
    ],
  );
}

// -- For Date Picker --
class CustomDatePicker extends StatefulWidget {
  final DateTime initialDate;
  final DateTime minDate;
  final DateTime maxDate;
  final ValueChanged<DateTime> onDateChanged;
  final bool pickDay;

  const CustomDatePicker({
    required this.initialDate,
    required this.minDate,
    required this.maxDate,
    required this.onDateChanged,
    super.key,
    this.pickDay = false,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late int selectedDay;
  late int selectedMonth;
  late int selectedYear;

  late List<String> monthNames;
  late List<int> yearList;
  late List<int> dayList;

  @override
  void initState() {
    super.initState();
    selectedDay = widget.initialDate.day;
    selectedMonth = widget.initialDate.month;
    selectedYear = widget.initialDate.year;

    monthNames = List.generate(
      12,
      (i) => DateFormat.MMM().format(DateTime(0, i + 1)),
    );

    yearList = List.generate(
      widget.maxDate.year - widget.minDate.year + 1,
      (i) => widget.minDate.year + i,
    );

    _generateDayList();
  }

  void _generateDayList() {
    final isMinMonth =
        selectedYear == widget.minDate.year &&
        selectedMonth == widget.minDate.month;
    final isMaxMonth =
        selectedYear == widget.maxDate.year &&
        selectedMonth == widget.maxDate.month;

    final int startDay = isMinMonth ? widget.minDate.day : 1;
    int endDay = DateTime(selectedYear, selectedMonth + 1, 0).day;

    if (isMaxMonth) endDay = widget.maxDate.day.clamp(1, endDay);

    dayList = List.generate(endDay - startDay + 1, (i) => startDay + i);

    if (!dayList.contains(selectedDay)) {
      selectedDay = dayList.first;
    }
  }

  DateTime getSelectedDate() =>
      DateTime(selectedYear, selectedMonth, widget.pickDay ? selectedDay : 1);

  @override
  Widget build(BuildContext context) => Row(
    children: [
      if (widget.pickDay)
        _buildLoopingPicker<int>(
          context: context,
          items: dayList,
          selectedIndex: dayList.indexOf(selectedDay),
          onChanged: (index) => setState(() => selectedDay = dayList[index]),
          displayText: (val) => val.toString().padLeft(2, '0'),
        ),
      _buildLoopingPicker<String>(
        context: context,
        items: monthNames,
        selectedIndex: selectedMonth - 1,
        onChanged: (index) {
          setState(() {
            selectedMonth = index + 1;
            _generateDayList();
          });
        },
        displayText: (val) => val,
      ),
      _buildLoopingPicker<int>(
        context: context,
        items: yearList,
        selectedIndex: selectedYear - widget.minDate.year,
        onChanged: (index) {
          setState(() {
            selectedYear = yearList[index];
            _generateDayList();
          });
        },
        displayText: (val) => val.toString(),
      ),
    ],
  );
}

Widget _buildLoopingPicker<T>({
  required BuildContext context,
  required List<T> items,
  required int selectedIndex,
  required ValueChanged<int> onChanged,
  required String Function(T item) displayText,
}) => Expanded(
  child: CupertinoPicker(
    scrollController: FixedExtentScrollController(initialItem: selectedIndex),
    diameterRatio: 1,
    itemExtent: 32,
    selectionOverlay: Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: AppTheme.getColor(context).primary,
            width: 1.5,
          ),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 6),
    ),
    onSelectedItemChanged: onChanged,
    children: items.map((item) {
      final isSelected = items.indexOf(item) == selectedIndex;
      return Center(
        child: CustomText(
          displayText(item),
          fontSize: 22 * Responsive.getResponsiveText(context),
          color: isSelected
              ? AppTheme.getColor(context).primary
              : AppColors.textPrimary,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        ),
      );
    }).toList(),
  ),
);
