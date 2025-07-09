import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/text_field.dart';

class HolidayListPage extends StatefulWidget {
  final TextEditingController controller;

  const HolidayListPage({required this.controller, super.key});

  @override
  State<HolidayListPage> createState() => _HolidayListPageState();
}

class _HolidayListPageState extends State<HolidayListPage> {
  DateTime _currentDate = DateTime.now();

  void _goToPreviousYear() {
    setState(() {
      _currentDate = DateTime(_currentDate.year - 1, _currentDate.month);
    });
  }

  void _goToNextYear() {
    setState(() {
      _currentDate = DateTime(_currentDate.year + 1, _currentDate.month);
    });
  }

  final List<Map<String, String>> holidays = [
    {
      "date": "15 Aug 2025",
      "title": "Independence Day",
      "day": "Friday",
      "status": "true",
      "image": "assets/search_society/contact_admin.png",
    },
    {
      "date": "22 Aug 2025",
      "title": "Rath Yatra",
      "day": "Monday",
      "status": "false",
      "image": "assets/search_society/contact_admin.png",
    },
    {
      "date": "2 Oct 2025",
      "title": "Gandhi Jayanti",
      "day": "Tuesday",
      "status": "true",
      "image": "assets/search_society/contact_admin.png",
    },
    {
      "date": "15 Oct 2025",
      "title": "UVWXYZ",
      "day": "Monday",
      "status": "false",
      "image": "assets/search_society/contact_admin.png",
    },
    {
      "date": "16 Oct 2025",
      "title": "ABCDE",
      "day": "Tuesday",
      "status": "true",
      "image": "assets/search_society/contact_admin.png",
    },
    {
      "date": "15 Aug 2025",
      "title": "Independence Day",
      "day": "Friday",
      "status": "true",
      "image": "assets/search_society/contact_admin.png",
    },
    {
      "date": "22 Aug 2025",
      "title": "Rath Yatra",
      "day": "Monday",
      "status": "false",
      "image": "assets/search_society/contact_admin.png",
    },
    {
      "date": "2 Oct 2025",
      "title": "Gandhi Jayanti",
      "day": "Tuesday",
      "status": "true",
      "image": "assets/search_society/contact_admin.png",
    },
  ];

  final List<Color> backgroundColors = [
    Color(0xFF2F648E),
    Color(0xFF2FBBA4),
    Color(0xFF08A4BB),
    Color(0xFFFFC026),
    Color(0xFFDCA7A7),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_outlined),
      ),
      title: const Text('Holiday'),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            MyCoTextField(
              controller: widget.controller,
              preFixImage: 'assets/lost_and_found/search-normal.png',
              hintText: 'Search',
              border: Border.all(color: AppTheme.getColor(context).outline),
              typingtextStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: "Gilroy-Medium",
                fontSize: 20 * Responsive.getResponsiveText(context),
              ),
              hintTextStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: "Gilroy-Medium",
                fontSize: 20 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: _goToPreviousYear,
                  icon: const Icon(Icons.arrow_left),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        DateFormat('MMMM, yyyy').format(_currentDate),
                        style: TextStyle(
                          fontSize: 18 * Responsive.getResponsiveText(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        size: 24,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: _goToNextYear,
                  icon: const Icon(Icons.arrow_right),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: holidays.length,
              itemBuilder: (context, index) {
                final holiday = holidays[index];
                final backgroundColor =
                    backgroundColors[index % backgroundColors.length];

                return Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: index == 0
                        ? const Color(0xFF999999)
                        : backgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/visit_svgs/calendar.svg',
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "${holiday['date']}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  20 * Responsive.getResponsiveText(context),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Image.asset(
                            holiday['image']!,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}
