import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/widgets/custom_dash_line.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/ios_calendar_time_picker.dart';
import 'package:myco_flutter/widgets/calender/horizontal_progress_bar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

import 'package:table_calendar/table_calendar.dart';


class CustomCalendar extends StatefulWidget {
  final Function(DateTime, String)? onLeaveTypeChanged;
  final Color? rangeSelectedDayColor;
  final DateTime? totalPreviousYear;
  final DateTime? totalNextYear;
  final bool allowSaturdaySelection;
  final bool allowSundaySelection;
  final String titleName;


  const CustomCalendar({
    super.key,
    this.onLeaveTypeChanged,
    this.rangeSelectedDayColor,
    this.totalPreviousYear,
    this.totalNextYear,
    this.allowSaturdaySelection = false,
    this.allowSundaySelection = false,
    this.titleName = 'Time Sheet',
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _focusedDay = DateTime.now();
  late String _selectedDay = '';

  final List<DateTime> _selectedDays = [];

  final Map<DateTime, String> _leaveTypeSelection = {};
  final Map<DateTime, Color> _customDayColors = {};

  CalendarFormat _calendarFormat = CalendarFormat.month;

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {

    // Prevent selection of past days if want to select then comment this code


    // if (selectedDay.isBefore(
    //   DateTime.now().subtract(const Duration(days: 1)),
    // )) {
    //   return;
    // }

    if (!widget.allowSaturdaySelection &&
        selectedDay.weekday == DateTime.saturday) {
      return;
    }

    if (!widget.allowSundaySelection &&
        selectedDay.weekday == DateTime.sunday) {
      return;
    }

    setState(() {
      _focusedDay = focusedDay;

      if (_selectedDays.any((d) => isSameDay(d, selectedDay))) {
        _selectedDays.removeWhere((d) => isSameDay(d, selectedDay));
        _leaveTypeSelection.removeWhere(
          (key, _) => isSameDay(key, selectedDay),
        );
      } else {
        _selectedDays.add(selectedDay);
      }

      _selectedDays.sort((a, b) => a.compareTo(b));
    });
  }



  void _onLeaveTypeChanged(DateTime day, String type) {
    setState(() {
      _leaveTypeSelection[day] = type;
    });
    if (widget.onLeaveTypeChanged != null) {
      widget.onLeaveTypeChanged!(day, type);
    }
  }

  // ignore: prefer_expression_function_bodies
  List<DateTime> get _currentlySelectedDays {
    
    return _selectedDays.where((day) {
      if (!widget.allowSaturdaySelection && day.weekday == DateTime.saturday) {
        return false;
      }
      if (!widget.allowSundaySelection && day.weekday == DateTime.sunday) {
        return false;
      }
      return true;
    }).toList();
  }

  DateTime _getStartOfWeek(DateTime date) => date.subtract(Duration(days: date.weekday - 1));

  DateTime _getEndOfWeek(DateTime date) {
    final startOfWeek = _getStartOfWeek(date);
    return startOfWeek.add(const Duration(days: 6));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16 * Responsive.getResponsive(context),
              vertical: 8 * Responsive.getResponsive(context),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppTheme.getColor(context).primary,
                    size: 24 * Responsive.getResponsive(context),
                  ),
                ),
                SizedBox(width: 8 * Responsive.getResponsive(context)),
                CustomText(
                  widget.titleName,
                  fontSize: 22 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).primary,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                _buildFormatToggleButton(context),
              ],
            ),
          ),
    
          TableCalendar(
            firstDay: widget.totalPreviousYear ?? DateTime.utc(2020),
            lastDay: widget.totalNextYear ?? DateTime.utc(2035, 12, 31),
            focusedDay: _focusedDay,
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
              CalendarFormat.week: 'Week',
            },
    
            //  starting day of month can be change 
            startingDayOfWeek: StartingDayOfWeek.monday,
    
            selectedDayPredicate: (day) => _selectedDays.any((d) => isSameDay(d, day)),
            onDaySelected: _onDaySelected,
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
                // If switching to week view, focus on today's week
                if (format == CalendarFormat.week) {
                  _focusedDay = DateTime.now();
                }
              });
            },
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              todayDecoration: BoxDecoration(
                color: AppTheme.getColor(context).secondary,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: AppTheme.getColor(context).primary,
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
    
              //  date and year textstyle
              titleTextStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                fontSize: 16 * Responsive.getResponsiveText(context),
              ),
              leftChevronMargin: EdgeInsets.zero,
              rightChevronMargin: EdgeInsets.zero,
            ),
            calendarBuilders: CalendarBuilders(
              // left and right arrow button
              headerTitleBuilder: (context, day) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 0.04 * Responsive.getHeight(context),
                    width: 0.1 * Responsive.getWidth(context),
                    margin: EdgeInsets.all(
                      4.0 * Responsive.getResponsive(context),
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.getColor(context).onPrimary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      child: Image.asset(
                        AppAssets.caretLeft,
                        color: AppTheme.getColor(context).onSurface,
                      ),
                      onTap: () {
                        final firstDay =
                            widget.totalPreviousYear ?? DateTime.utc(2020);
                        DateTime newFocusedDay;
    
                        if (_calendarFormat == CalendarFormat.week) {
                          newFocusedDay = _focusedDay.subtract(
                            const Duration(days: 7),
                          );
                        } else {
                          newFocusedDay = DateTime(
                            _focusedDay.year,
                            _focusedDay.month - 1,
                          );
                        }
    
                        if (!newFocusedDay.isBefore(firstDay)) {
                          setState(() {
                            _focusedDay = newFocusedDay;
                          });
                        }
                      },
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final selectedDate = await showPicker(
                            context,
                            minDate: DateTime(2020),
                            maxDate: DateTime(2030),
                            pickDay: false,
                            timePicker: false,
                          );
    
                          if (selectedDate != null) {
                            setState(() {
                              _selectedDay = selectedDate;
                              
                            });
                          }
                        },
                        child: CustomText(
                          _selectedDay.isNotEmpty
                              ? _selectedDay
                              : _formattedHeaderDate(day),
                          fontSize: 20 * Responsive.getResponsiveText(context),
                          color: AppColors.black,
                        ),
                      ),
    
                      if (_calendarFormat == CalendarFormat.week)
                        CustomText(
                          '${_formattedHeaderDate(_getStartOfWeek(_focusedDay))} - ${_formattedHeaderDate(_getEndOfWeek(_focusedDay))}',
                          fontSize: 14 * Responsive.getResponsiveText(context),
                          color: AppTheme.getColor(context).onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                    ],
                  ),
                  Container(
                    height: 0.04 * Responsive.getHeight(context),
                    width: 0.1 * Responsive.getWidth(context),
                    margin: EdgeInsets.all(
                      4.0 * Responsive.getResponsive(context),
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.getColor(context).onPrimary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: GestureDetector(
                      child: Image.asset(
                        AppAssets.caretRight,
                        color: AppTheme.getColor(context).onSurface,
                      ),
                      onTap: () {
                        final lastDay =
                            widget.totalNextYear ?? DateTime.utc(2030, 12, 31);
                        DateTime newFocusedDay;
    
                        if (_calendarFormat == CalendarFormat.week) {
                          newFocusedDay = _focusedDay.add(
                            const Duration(days: 7),
                          );
                        } else {
                          newFocusedDay = DateTime(
                            _focusedDay.year,
                            _focusedDay.month + 1,
                          );
                        }
    
                        if (!newFocusedDay.isAfter(lastDay)) {
                          setState(() {
                            _focusedDay = newFocusedDay;
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
    
    
    // slected date color 
                if (isSelected) {
                  return Container(
                    margin: EdgeInsets.all(6 * Responsive.getResponsive(context)),
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
                    child: CustomText(
                      '${day.day}',
                      color: AppTheme.getColor(context).onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }
    
    
    // saturday day color
                if (day.weekday == DateTime.saturday) {
                  return Container(
                    margin: EdgeInsets.all(6 * Responsive.getResponsive(context)),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        const BoxShadow(color: Colors.black26),
                        BoxShadow(
                          color: AppTheme.getColor(context).onPrimary,
                          blurRadius: 3,
                          offset: const Offset(1, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: CustomText(
                      '${day.day}',
                      color: AppTheme.getColor(context).onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }
    
    // sunday day color
                if (day.weekday == DateTime.sunday) {
                  return Container(
                    margin: EdgeInsets.all(6 * Responsive.getResponsive(context)),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        const BoxShadow(color: Colors.black26),
                        BoxShadow(
                          color: AppTheme.getColor(context).onPrimary,
                          blurRadius: 3,
                          offset: const Offset(1, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: CustomText(
                      '${day.day}',
                      color: AppTheme.getColor(context).onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }
    
    // for all past date color
                if (isPast) {
                  return Container(
                    margin: EdgeInsets.all(6 * Responsive.getResponsive(context)),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black26),
                        BoxShadow(
                          color: Color(0xFFCECECE),
                          blurRadius: 3,
                          offset: Offset(1, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: CustomText(
                      '${day.day}',
                      color: AppTheme.getColor(context).onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }
    
                return Container(
                  margin: EdgeInsets.all(6 * Responsive.getResponsive(context)),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      const BoxShadow(color: Colors.black26),
                      BoxShadow(
                        color: AppTheme.getColor(context).onPrimary,
                        blurRadius: 3,
                        offset: const Offset(1.5, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: CustomText(
                    '${day.day}',
                    color: AppTheme.getColor(context).onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                );
              },
            ),
          ),
    
          SizedBox(height: 0.015 * Responsive.getHeight(context)),
    
          // Inserted the progress bar here
          _buildProgressBar(context), 
          
        ],
      ),
    ),
  );

  Widget _buildFormatToggleButton(BuildContext context) {
    final String buttonText = _calendarFormat == CalendarFormat.month
        ? 'Week'
        : 'Month';
    final CalendarFormat nextFormat = _calendarFormat == CalendarFormat.month
        ? CalendarFormat.week
        : CalendarFormat.month;

    return GestureDetector(
      onTap: () {
        setState(() {
          _calendarFormat = nextFormat;
          // If switching to week view, focus on today's week
          if (nextFormat == CalendarFormat.week) {
            _focusedDay = DateTime.now();
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.getColor(context).onSurface),
          borderRadius: BorderRadius.circular(15),
          color: AppTheme.getColor(context).onPrimary,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: CustomText(
          buttonText,
          fontSize: 14 * Responsive.getResponsiveText(context),
          color: AppTheme.getColor(context).onSurface,
        ),
      ),
    );
  }

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
    });
  }

  void setCustomDayColor(DateTime date, Color color) {
    setState(() {
      _customDayColors[DateTime.utc(date.year, date.month, date.day)] = color;
    });
  }








// progress bar 

  // ignore: prefer_expression_function_bodies
  Widget _buildProgressBar(BuildContext context) {


    // Example values,
    // const double totalHours = 250.0;
    // const double monthlyHoursSpent = 27.10;

    // final double progress = monthlyHoursSpent / totalHours;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16 * Responsive.getResponsive(context),
        vertical: 10 * Responsive.getResponsive(context),
      ),
      decoration: BoxDecoration(
        color: AppTheme.getColor(
          context,
        ).onPrimary, // A light background for the bar
        borderRadius: BorderRadius.circular(12*Responsive.getResponsive(context)),
        border: Border.all(color: AppTheme.getColor(context).outline),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppTheme.getColor(context).outline))),
            child: HorizontalColorfulProgressBar(
              height: 0.055 * Responsive.getHeight(context) ,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              backgroundColor: const Color(0xFFD8EEFF),
              colorRanges: [(0, 90, AppTheme.getColor(context).primary)],
              totalSeconds: 90,
            ),
          ),
          Padding(
            padding:  EdgeInsets.fromLTRB(25,15,25,15  * Responsive.getResponsive(context)),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          '250 Hours',
                          fontSize: 16 * Responsive.getResponsiveText(context),
                          fontWeight: FontWeight.w700,
                          color: AppTheme.getColor(context).primary,
                        ),
                        CustomText(
                          'Total Hours',
                          fontSize: 12 * Responsive.getResponsiveText(context),
                          color: AppTheme.getColor(context).onSurface,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 14.0*Responsive.getResponsive(context)),
                    child: DashedLine(
                      color: AppTheme.getColor(context).primary,
                      axis: Axis.vertical,
                      dashLength: 2,
                      width: 1,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(
                          '27 Hours 10 Minutes',
                          fontSize: 16 * Responsive.getResponsiveText(context),
                          fontWeight: FontWeight.w700,
                          color: AppTheme.getColor(context).primary,
                        ),
                        CustomText(
                          'Monthly Hours Spent',
                          fontSize: 12 * Responsive.getResponsiveText(context),
                          color: AppTheme.getColor(context).onSurface,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),










//  donut chart
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:myco_flutter/core/theme/app_theme.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   // ignore: prefer_expression_function_bodies
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: EnvelopePeekCardGrid(),
//     );
//   }
// }

// /// Grid of peekable cards
// class EnvelopePeekCardGrid extends StatelessWidget {
//   const EnvelopePeekCardGrid({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cardList = [
//       {
//         'count': '01',
//         'title': 'Punch-Out',
//         'subtitle': 'Missing',
//         'icon': Icons.logout,
//         'color': AppTheme.getColor(context).secondary,
//       },
//       {
//         'count': '02',
//         'title': 'Punch-In',
//         'subtitle': 'Missing',
//         'icon': Icons.login,
//         'color': AppTheme.getColor(context).primary,
//       },
//       {
//         'count': '03',
//         'title': 'Leaves',
//         'subtitle': 'Pending',
//         'icon': Icons.beach_access,
//         'color': AppTheme.getColor(context).error,
//       },
//       {
//         'count': '04',
//         'title': 'Approvals',
//         'subtitle': 'Required',
//         'icon': Icons.task_alt,
//         'color': AppTheme.getColor(context).error,
//       },
//       {
//         'count': '05',
//         'title': 'Late Login',
//         'subtitle': 'Today',
//         'icon': Icons.access_time,
//         'color': AppTheme.getColor(context).error,
//       },
//       {
//         'count': '06',
//         'title': 'Early Logout',
//         'subtitle': 'Yesterday',
//         'icon': Icons.exit_to_app,
//         'color': AppTheme.getColor(context).error,
//       },
//     ];

//     return Scaffold(
//       // backgroundColor: Colors.red,
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           children: [
//             const SizedBox(height: 120),
//             SizedBox(
//               height: 120,
//               width: 120,
//               child: CustomPaint(
//                 size: const Size(120, 120),
//                 painter: DonutChartPainter(
//                   values: [33, 33, 34],
//                   colors: [Colors.teal, Colors.orange, Colors.indigo],
//                   labels: ['Hours', 'Days', 'Irregularities'],
//                   icons: [Icons.access_time, Icons.event, Icons.warning],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 200),
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//                 childAspectRatio: 1.8,
//                 // ignore: prefer_expression_function_bodies
//                 children: cardList.map((data) {
//                   return PeekableStatusCard(
//                     count: data['count'] as String,
//                     title: data['title'] as String,
//                     subtitle: data['subtitle'] as String,
//                     icon: data['icon'] as IconData,
//                     color: data['color'] as Color,
//                   );
//                 }).toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PeekableStatusCard extends StatefulWidget {
//   final String title;
//   final String subtitle;
//   final String count;
//   final Color color;
//   final IconData icon;

//   const PeekableStatusCard({
//     super.key,
//     // ignore: always_put_required_named_parameters_first
//     required this.title,
//     // ignore: always_put_required_named_parameters_first
//     required this.subtitle,
//     // ignore: always_put_required_named_parameters_first
//     required this.count,
//     // ignore: always_put_required_named_parameters_first
//     required this.color,
//     // ignore: always_put_required_named_parameters_first
//     required this.icon,
//   });

//   @override
//   State<PeekableStatusCard> createState() => _PeekableStatusCardState();
// }

// class _PeekableStatusCardState extends State<PeekableStatusCard>
//     with SingleTickerProviderStateMixin {
//   bool isOpen = false;
//   late AnimationController _controller;
//   late Animation<double> _slideAnimation;

//   final double cardHeight = 80;
//   final double peekHeight = 15;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _slideAnimation = Tween<double>(
//       begin: cardHeight - peekHeight,
//       end: 0,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//   }

//   void toggleCard() {
//     setState(() {
//       isOpen = !isOpen;
//       isOpen ? _controller.forward() : _controller.reverse();
//     });
//   }

//   @override
//   // ignore: prefer_expression_function_bodies
//   Widget build(BuildContext context) {
//     return ClipRect(
//       child: SizedBox(
//         width: double.infinity,
//         height: cardHeight,
//         child: AnimatedBuilder(
//           animation: _slideAnimation,
//           // ignore: prefer_expression_function_bodies
//           builder: (context, child) {
//             return Transform.translate(
//               offset: Offset(0, _slideAnimation.value),
//               child: child,
//             );
//           },
//           child: GestureDetector(
//             onTap: toggleCard,
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 boxShadow: [
//                   BoxShadow(color: widget.color.withAlpha(180)),
//                   BoxShadow(
//                     color: widget.color,
//                     offset: const Offset(0, 9),
//                     spreadRadius: -6.0,
//                     blurRadius: 12.0,
//                   ),
//                 ],
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
//               child: Row(
//                 children: [
//                   Icon(widget.icon, color: Colors.white, size: 28),
//                   const SizedBox(width: 12),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             widget.count,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Text(
//                         widget.title,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       Text(
//                         widget.subtitle,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

// class DonutChartPainter extends CustomPainter {
//   final List<double> values;
//   final List<Color> colors;
//   final List<String> labels;
//   final List<IconData> icons;

//   DonutChartPainter({
//     required this.values,
//     required this.colors,
//     required this.labels,
//     required this.icons,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = Offset.zero & size;
//     final center = rect.center;
//     final radius = min(size.width, size.height) / 1.4;

//     const strokeWidth = 40.0;
//     final total = values.fold(0.0, (sum, val) => sum + val);
//     double startAngle = -pi / 2;

//     for (int i = 0; i < values.length; i++) {
//       final sweepAngle = (values[i] / total) * 2 * pi;

//       final paint = Paint()
//         ..color = colors[i]
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = strokeWidth
//         ..strokeCap = StrokeCap.butt;

//       // Draw arc
//       canvas.drawArc(
//         Rect.fromCircle(center: center, radius: radius),
//         startAngle,
//         sweepAngle,
//         false,
//         paint,
//       );

//       // Midpoint angle for label
//       final middleAngle = startAngle + sweepAngle / 2;

//       // Position for label (center of arc thickness)
//       final labelRadius = radius - strokeWidth / 15;

//       // --- Icon Painter ---
//       final iconSpan = TextSpan(
//         text: String.fromCharCode(icons[i].codePoint),
//         style: TextStyle(
//           fontSize: 14,
//           fontFamily: icons[i].fontFamily,
//           package: icons[i].fontPackage,
//           color: Colors.white,
//         ),
//       );

//       final iconPainter = TextPainter(
//         text: iconSpan,
//         textDirection: TextDirection.ltr,
//       );
//       iconPainter.layout();

//       final iconArcLength = iconPainter.width;
//       final iconAngleSpan = iconArcLength / labelRadius;

//       // Starting base angle for entire icon+label span
//       final labelText = labels[i];
//       final labelStyle = const TextStyle(
//         color: Colors.white,
//         fontSize: 11,
//         fontWeight: FontWeight.w500,
//       );

//       final labelPainter = TextPainter(
//         text: TextSpan(text: labelText, style: labelStyle),
//         textDirection: TextDirection.ltr,
//       );
//       labelPainter.layout();

//       final labelArcLength = labelPainter.width;
//       final totalArcLength = iconArcLength + labelArcLength;
//       final angleSpan = totalArcLength / labelRadius;
//       final baseAngle = middleAngle - angleSpan / 2;

//       double currentX = 0.0;

//       // Draw icon (at start)
//       final iconAngle = baseAngle + (iconPainter.width / 2) / labelRadius;
//       final iconDx = center.dx + labelRadius * cos(iconAngle);
//       final iconDy = center.dy + labelRadius * sin(iconAngle);

//       canvas.save();
//       canvas.translate(iconDx, iconDy);
//       canvas.rotate(iconAngle + pi / 2);
//       iconPainter.paint(canvas, Offset(-iconPainter.width / 2, -iconPainter.height / 2));
//       canvas.restore();

//       currentX += iconPainter.width;

//       // Draw label characters individually (to follow arc)
//       for (int j = 0; j < labelText.length; j++) {
//         final char = labelText[j];

//         final charSpan = TextSpan(text: char, style: labelStyle);
//         final charPainter = TextPainter(
//           text: charSpan,
//           textDirection: TextDirection.ltr,
//         );
//         charPainter.layout();

//         final charWidth = charPainter.width;

//         final angle = baseAngle + (currentX + charWidth / 2) / labelRadius;
//         final dx = center.dx + labelRadius * cos(angle);
//         final dy = center.dy + labelRadius * sin(angle);

//         canvas.save();
//         canvas.translate(dx, dy);
//         canvas.rotate(angle + pi / 2);
//         charPainter.paint(canvas, Offset(-charPainter.width / 2, -charPainter.height / 2));
//         canvas.restore();

//         currentX += charWidth;
//       }

//       // Move to next segment
//       startAngle += sweepAngle;
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }











        ],
      ),
    );
  }
}
