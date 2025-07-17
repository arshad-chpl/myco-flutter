// sundays are selectable in range mode
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:table_calendar/table_calendar.dart';


enum SelectionMode { multi, range }

class CustomCalendar extends StatefulWidget {
  final Function(DateTime, String)? onLeaveTypeChanged;
  final Color? todayColor;
  final Color? selectedDayColor;
  final Color? leftArrowBackgroundColor;
  final Color? rightArrowBackgroundColor;
  final Color? leftArrowColor;
  final Color? rightArrowColor;
  final Color? rangeSelectedDayColor;
  final DateTime? totalPreviousYear;
  final DateTime? totalNextYear;
  final bool showThirdHalf;
  final bool showFourthHalf;
  final bool showFifthHHalf;

  const CustomCalendar({
    super.key,
    this.onLeaveTypeChanged,
    this.selectedDayColor,
    this.todayColor,
    this.leftArrowBackgroundColor,
    this.rightArrowBackgroundColor,
    this.leftArrowColor,
    this.rightArrowColor,
    this.rangeSelectedDayColor,
    this.totalPreviousYear,
    this.totalNextYear,
    this.showThirdHalf = true, 
    this.showFourthHalf = false,
    this.showFifthHHalf= false, 
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _focusedDay = DateTime.now();

  SelectionMode _selectionMode = SelectionMode.multi;

  // Multi-select storage
  final List<DateTime> _selectedDays = [];

  // Range-select storage
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  final Map<DateTime, String> _leaveTypeSelection = {};
  final Map<DateTime, Color> _customDayColors = {};

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {

    if (selectedDay.isBefore(
      DateTime.now().subtract(const Duration(days: 1)),
    )) {
      return;
    }

    setState(() {
      _focusedDay = focusedDay;

      if (_selectionMode == SelectionMode.multi) {
        if (_selectedDays.any((d) => isSameDay(d, selectedDay))) {
          _selectedDays.removeWhere((d) => isSameDay(d, selectedDay));
          _leaveTypeSelection.removeWhere(
            (key, _) => isSameDay(key, selectedDay),
          );
        } else {
          _selectedDays.add(selectedDay);
        }

        // Sort selected dates
        _selectedDays.sort((a, b) => a.compareTo(b));

        _rangeStart = null;
        _rangeEnd = null;
      } else {
        if (_rangeStart == null || (_rangeStart != null && _rangeEnd != null)) {
          _rangeStart = selectedDay;
          _rangeEnd = null;
        } else if (_rangeStart != null && _rangeEnd == null) {
          // Allow selecting Sunday as the end of the range
          if (!selectedDay.isBefore(_rangeStart!)) {
            _rangeEnd = selectedDay;
          } else {
            _rangeStart = selectedDay;
          }
        }

        _selectedDays.clear();
        _leaveTypeSelection.removeWhere(
          (key, _) => !_isWithinRange(key, _rangeStart, _rangeEnd),
        );
      }
    });
  }

  bool _isWithinRange(DateTime day, DateTime? start, DateTime? end) {
    if (start == null) return false;
    if (end == null) return isSameDay(day, start);
    return (day.isAtSameMomentAs(start) ||
        day.isAtSameMomentAs(end) ||
        (day.isAfter(start) && day.isBefore(end)));
  }

  void _onLeaveTypeChanged(DateTime day, String type) {
    setState(() {
      _leaveTypeSelection[day] = type;
    });
    if (widget.onLeaveTypeChanged != null) {
      widget.onLeaveTypeChanged!(day, type);
    }
  }

  List<DateTime> get _currentlySelectedDays {
    if (_selectionMode == SelectionMode.multi) {
      return _selectedDays;
    } else {
      if (_rangeStart != null && _rangeEnd != null) {
        return List.generate(
          _rangeEnd!.difference(_rangeStart!).inDays + 1,
          (index) => _rangeStart!.add(Duration(days: index)),
        );
      } else if (_rangeStart != null) {
        return [_rangeStart!];
      }
      return [];
    }
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Radio<SelectionMode>(
                        splashRadius: 0,
                        value: SelectionMode.multi,
                        groupValue: _selectionMode,
                        onChanged: (SelectionMode? value) {
                          setState(() {
                            _selectionMode = value!;
                            _rangeStart = null;
                            _rangeEnd = null;
                          });
                        },
                        activeColor: const Color(0xFF2F648E),
                      ),
                      const Text(
                        'Day Selection',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF2F648E),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Gilroy-semiBold',
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Radio<SelectionMode>(
                        splashRadius: 0,
                        value: SelectionMode.range,
                        groupValue: _selectionMode,
                        onChanged: (SelectionMode? value) {
                          setState(() {
                            _selectionMode = value!;
                            _selectedDays.clear();
                          });
                        },
                        activeColor: const Color(0xFF2F648E),
                      ),
                      const Text(
                        'Range Selection',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF2F648E),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Gilroy-semiBold',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TableCalendar(
              firstDay: widget.totalPreviousYear ?? DateTime.utc(2020, 1),
              lastDay: widget.totalNextYear ?? DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              startingDayOfWeek: StartingDayOfWeek.monday,
              selectedDayPredicate: (day) {
                if (_selectionMode == SelectionMode.multi) {
                  return _selectedDays.any((d) => isSameDay(d, day));
                }
                return false;
              },
              onDaySelected: _onDaySelected,
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                todayDecoration: BoxDecoration(
                  color: widget.todayColor ?? Colors.teal,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: widget.selectedDayColor ?? AppColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(3, 3),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                leftChevronVisible: false,
                rightChevronVisible: false,
                titleTextFormatter: (date, _) => _formattedHeaderDate(date),
                titleTextStyle: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Gilroy-semiBold',
                  fontSize: 16,
                ),
                leftChevronMargin: EdgeInsets.zero,
                rightChevronMargin: EdgeInsets.zero,
              ),
              calendarBuilders: CalendarBuilders(
                headerTitleBuilder: (context, day) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: widget.leftArrowBackgroundColor ??
                            AppColors.primary,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.chevron_left,
                          color: widget.leftArrowColor ?? AppColors.secondary,
                        ),
                        onPressed: () {
                          final firstDay = widget.totalPreviousYear ??
                              DateTime.utc(2020, 1);

                          final previousMonth = DateTime(
                            _focusedDay.year,
                            _focusedDay.month - 1,
                          );

                          if (!previousMonth.isBefore(firstDay)) {
                            setState(() {
                              _focusedDay = previousMonth;
                            });
                          }
                        },
                      ),
                    ),
                    Text(
                      _formattedHeaderDate(day),
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppColors.black,
                        fontFamily: 'Gilroy-semiBold',
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: widget.rightArrowBackgroundColor ??
                            AppColors.primary,
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.chevron_right,
                          color: widget.rightArrowColor ?? AppColors.secondary,
                        ),
                        onPressed: () {
                          final lastDay = widget.totalNextYear ??
                              DateTime.utc(2030, 12, 31);

                          final nextMonth = DateTime(
                            _focusedDay.year,
                            _focusedDay.month + 1,
                          );

                          if (!nextMonth.isAfter(lastDay)) {
                            setState(() {
                              _focusedDay = nextMonth;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                defaultBuilder: (context, day, focusedDay) {
                  final now = DateTime.now();
                  final isPast = day.isBefore(
                    DateTime(now.year, now.month, now.day),
                  );
                  final isSelected = _currentlySelectedDays.any(
                    (d) => isSameDay(d, day),
                  );

                  if (isPast) {
                    return Container(
                      margin: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black26),
                          BoxShadow(
                            color: Color(0xFFE6E6E6),
                            blurRadius: 3,
                            offset: Offset(1, 2),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${day.day}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Gilroy-semiBold',
                        ),
                      ),
                    );
                  }

                  if (isSelected) {
                    return Container(
                      margin: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: widget.rangeSelectedDayColor ?? AppColors.primary,
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(3, 3),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${day.day}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Gilroy-semiBold',
                        ),
                      ),
                    );
                  }

                  return Container(
                    margin: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black26),
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 3,
                          offset: Offset(1.5, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${day.day}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Gilroy-semiBold',
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Divider(color: Color(0xFFC4D9EB), thickness: 3, height: 25),
            const SizedBox(height: 20),
            if (_currentlySelectedDays.isNotEmpty)
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 115, // Fixed width for the icon section
                        child: Center(
                          child: Icon(
                            Icons.calendar_month,
                            color: Colors.teal,
                            size: 26,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded( 
                              child: Text(
                                'Full\nDay',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff2F648E),
                                  fontFamily: 'Gilroy-semiBold',
                                ),
                              ),
                            ),

                            Expanded(
                              child: Text(
                                '1st\nHalf',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff2F648E),
                                  fontFamily: 'Gilroy-semiBold',
                                ),
                              ),
                            ),

                            Expanded(
                              child: Text(
                                '2nd\nHalf',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff2F648E),
                                  fontFamily: 'Gilroy-semiBold',
                                ),
                              ),
                            ),

                            // Conditionally show 3rd Half header
                            if (widget.showThirdHalf)
                              Expanded(
                                child: Text(
                                  '3rd\nHalf',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff2F648E),
                                    fontFamily: 'Gilroy-semiBold',
                                  ),
                                ),
                              ),

                            // Conditionally show 4th Half header
                            if (widget.showFourthHalf)
                              Expanded( 
                                child: Text(
                                  '4th\nHalf',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff2F648E),
                                    fontFamily: 'Gilroy-semiBold',
                                  ),
                                ),
                              ),

                              // Conditionally show 5th Half header
                              if (widget.showFifthHHalf)
                              Expanded( 
                                child: Text(
                                  '5th\nHalf',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff2F648E),
                                    fontFamily: 'Gilroy-semiBold',
                                  ),
                                ),
                              ),
            
                            Expanded(
                              child: SizedBox(
                                width: 30, 
                                child: Center( 
                                  child: Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ..._currentlySelectedDays.map((day) {
                    final String? selectedType = _leaveTypeSelection[day];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        children: [
                          Container(
                            width: 115, // Fixed width for the date container
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xff2FBBA4),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                             child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown, // Shrink text if it's too large
                                      child: Text(
                                        '${day.day} ${_monthName(day.month)}',
                                        style: TextStyle(
                                          color: const Color(0xffFFFFFF),
                                          fontFamily: 'Gilroy-semiBold',
                                          fontWeight: FontWeight.w500,
                                          fontSize:
                                              13 * MediaQuery.of(context).textScaleFactor, // Scale with textScaleFactor
                                        ),
                                       
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        // Year on the second line
                                        '${day.year}',
                                        style: TextStyle(
                                          color: const Color(0xffFFFFFF),
                                          fontFamily: 'Gilroy-semiBold',
                                          fontWeight: FontWeight.w500,
                                          fontSize:
                                              12 * MediaQuery.of(context).textScaleFactor, // Scale with textScaleFactor
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ),
                          ),
                          
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded( 
                                  child: Radio<String>(
                                    splashRadius:0,
                                    value: 'Full Day',
                                    groupValue: selectedType,
                                    onChanged: (val) =>
                                        _onLeaveTypeChanged(day, val!),
                                    activeColor: const Color(0xFF2F648E),
                                  ),
                                ),
                                
                                Expanded( 
                                  child: Radio<String>(
                                    splashRadius: 0,
                                    value: '1st Half',
                                    groupValue: selectedType,
                                    onChanged: (val) =>
                                        _onLeaveTypeChanged(day, val!),
                                    activeColor: const Color(0xFF2F648E),
                                  ),
                                ),

                                Expanded(
                                  child: Radio<String>(
                                    value: '2nd Half',
                                    groupValue: selectedType,
                                    splashRadius: 0,
                                    onChanged: (val) =>
                                        _onLeaveTypeChanged(day, val!),
                                    activeColor: const Color(0xFF2F648E),
                                  ),
                                ),

                                // Conditionally show 3rd Half radio button
                                if (widget.showThirdHalf)
                                  Expanded(
                                    child: Radio<String>(
                                      value: '3rd Half',
                                      groupValue: selectedType,
                                      splashRadius: 0,
                                      onChanged: (val) =>
                                          _onLeaveTypeChanged(day, val!),
                                      activeColor: const Color(0xFF2F648E),
                                    ),
                                  ),

                                // Conditionally show 4th Half radio button
                                if (widget.showFourthHalf)
                                  Expanded(
                                    child: Radio<String>(
                                      value: '4th Half',
                                      groupValue: selectedType,
                                      splashRadius: 0,
                                      onChanged: (val) =>
                                          _onLeaveTypeChanged(day, val!),
                                      activeColor: const Color(0xFF2F648E),
                                    ),
                                  ),

                                // Conditionally show 5th Half radio button
                                  if (widget.showFifthHHalf)
                                  Expanded(
                                    child: Radio<String>(
                                      value: '5th Half',
                                      groupValue: selectedType,
                                      splashRadius: 0,
                                      onChanged: (val) =>
                                          _onLeaveTypeChanged(day, val!),
                                      activeColor: const Color(0xFF2F648E),
                                    ),
                                  ),

                                Expanded(
                                  child: SizedBox(
                                    width: 20,
                                    child: GestureDetector(
                                      child: const Icon(
                                        Icons.cancel_outlined,
                                        color: Colors.red,
                                      ),
                                      onTap: () => _onCancelLeave(day),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
          ],
        ),
      );

  String _formattedHeaderDate(DateTime date) =>
      '${date.day} ${_monthName(date.month)}, ${date.year}';

  String _monthName(int month) {
    const months = [
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
    return months[month - 1];
  }

  void _onCancelLeave(DateTime day) {
    setState(() {
      _selectedDays.removeWhere((d) => isSameDay(d, day));
      _leaveTypeSelection.removeWhere((key, _) => isSameDay(key, day));

      if (_selectionMode == SelectionMode.range) {
        if (_rangeStart != null && _rangeEnd != null) {
          final isInRange =
              (day.isAfter(_rangeStart!) || isSameDay(day, _rangeStart)) &&
                  (day.isBefore(_rangeEnd!) || isSameDay(day, _rangeEnd));

          if (isInRange) {
            _rangeStart = null;
            _rangeEnd = null;
            _leaveTypeSelection.clear();
          }
        } else if (_rangeStart != null && isSameDay(day, _rangeStart)) {
          _rangeStart = null;
        }
      }
    });
  }

  void setCustomDayColor(DateTime date, Color color) {
    setState(() {
      _customDayColors[DateTime.utc(date.year, date.month, date.day)] = color;
    });
  }
}


