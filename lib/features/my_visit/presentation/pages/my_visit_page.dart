import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/auto_expense_card.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/custom_visit_calender.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/my_visit_tab.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/visit_card.dart';
import 'package:myco_flutter/features/visit/presentation/widgets/build_other_employee_visit_tab.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/floating_action_btn.dart';

class MyVisitPage extends StatefulWidget {
  const MyVisitPage({super.key});

  @override
  State<MyVisitPage> createState() => _VisitPageState();
}

class _VisitPageState extends State<MyVisitPage> {
  DateTime selectedDate = DateTime.now();
  bool isAllDateSelected = false;

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  int selectedTabIndex = 0;

  final List<Map<String, dynamic>> visitList = [
    {
      'title': 'Mahakali Tractor ( RT4567 )',
      'time': '01st April, 2025(09:45 AM) TO 01st April, 2025(12:45 PM)',
      'status': 'Visit Not Started',
      'showExtraButtons': false,
      'details': {
        'Visit': 'Physical',
        'Visit Status': 'Approved',
        'Address':
            '101 Sanand - Sarkhej Rd, Makarba, Ahmedabad\nSarkhej-Okaf, Gujarat, 382421, India'
            '\n(You are in Range)',
      },
      'showWhatsapp': true,
      'showShare': true,
      'showDelete': true,
    },
    {
      'title': 'Rajdeep Implements ( RJ2020 )',
      'time': '02nd April, 2025(10:00 AM) TO 02nd April, 2025(01:00 PM)',
      'status': 'Visit Not Started',
      'showExtraButtons': false,
      'details': {
        'Visit': 'Demo',
        'Visit Status': 'Pending',
        'Address': 'Plot 22, Phase-3 GIDC, Vatva, Ahmedabad, Gujarat, 382445',
      },
      'showWhatsapp': true,
      'showShare': true,
      'showDelete': true,
    },
    {
      'title': 'Special Customer ( SC2025 )',
      'time': '03rd April, 2025(11:00 AM) TO 03rd April, 2025(02:00 PM)',
      'status': 'Visit Not Started',
      'showExtraButtons': true,
      'details': {
        'Visit': 'Service',
        'Visit Status': 'Approved',
        'Address': 'SG Highway, Near Infocity, Gandhinagar, Gujarat',
      },
      'showWhatsapp': true,
      'showShare': true,
    },
    {
      'title': 'Final Customer ( FC2025 )',
      'time': '05th April, 2025(03:00 PM) TO 05th April, 2025(05:00 PM)',
      'status': 'Visit Started',
      'showExtraButtons': true,
      'showStartedVisit': true,
      'isOutOfRange': true,
      'showImage': true,
      'details': {
        'Visit': 'Installation',
        'Visit Status': 'Approved',
        'Address': 'Bapunagar, Ahmedabad, Gujarat - 380024',
      },
      'showWhatsapp': true,
      'showShare': true,
    },
    {
      'title': 'Hidden Buttons Visit ( HB2025 )',
      'time': '06th April, 2025(11:00 AM) TO 06th April, 2025(02:00 PM)',
      'status': 'Visit Not Started',
      'showExtraButtons': true,
      'showStartedVisit': false,
      'isOutOfRange': true,
      'hideOrderButtons': true,
      'showImage': true,
      'details': {
        'Visit': 'Service',
        'Visit Status': 'Approved',
        'Address':
            '101 Sanand - Sarkhej Rd, Makarba, Ahmedabad\nSarkhej-Okaf, Gujarat, 382421, India',
      },
      'showWhatsapp': true,
      'showShare': true,
      'showDelete': true,
    },
    // 6th Container
    {
      'title': 'Late Visit End ( LV2025 )',
      'time': '07th April, 2025(01:30 PM) TO 07th April, 2025(03:30 PM)',
      'status': 'Visit Started',
      'showExtraButtons': true,
      'showStartedVisit': true,
      'isOutOfRange': true,
      'showImage': true,
      'isSixthContainer': true,
      'hideOrderButtons': true,
      'details': {
        'Visit': 'Inspection',
        'Visit Status': 'Approved',
        'Address':
            '101 Sanand - Sarkhej Rd, Makarba, Ahmedabad\nSarkhej-Okaf, Gujarat, 382421, India',
      },
      'showWhatsapp': true,
      'showShare': true,
    },
    //7th
    {
      'title': 'Late Visit End ( LV2025 )',
      'time': '07th April, 2025(01:30 PM) TO 07th April, 2025(03:30 PM)',
      'status': 'Visit Started',
      'showExtraButtons': true,
      'showStartedVisit': true,
      'isOutOfRange': true,
      'showImage': true,
      'isSixthContainer': true,
      'isSeventhContainer': true,
      'hideOrderButtons': true,
      'requestedOn': '03:58 PM , 03 Jun 2025',
      'details': {
        'Visit': 'Inspection',
        'Visit Status': 'Approved',
        'Address':
            '101 Sanand - Sarkhej Rd, Makarba, Ahmedabad\nSarkhej-Okaf, Gujarat, 382421, India',
      },
      'showWhatsapp': true,
      'showShare': true,
    },
    // 8th
    {
      'title': 'Late Visit End ( LV2025 )',
      'time': '07th April, 2025(01:30 PM) TO 07th April, 2025(03:30 PM)',
      'status': 'Visit Started',
      'showExtraButtons': true,
      'showStartedVisit': true,
      'isOutOfRange': true,
      'showImage': true,
      'isSixthContainer': true,
      'isSeventhContainer': true,
      'isEighthContainer': true,
      'hideOrderButtons': true,
      'requestedOn': '03:58 PM , 03 Jun 2025',
      'details': {
        'Visit': 'Inspection',
        'Visit Status': 'Approved',
        'Address': 'Maninagar, Ahmedabad, Gujarat',
      },
      'showWhatsapp': true,
      'showShare': true,
    },
  ];

  String get formattedDate =>
      '${selectedDate.day} ${monthName(selectedDate.month)}, ${selectedDate.year}';

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

  void goToPreviousDate() {
    setState(() {
      selectedDate = selectedDate.subtract(const Duration(days: 1));
    });
  }

  void goToNextDate() {
    setState(() {
      selectedDate = selectedDate.add(const Duration(days: 1));
    });
  }

  void selectDateFromPicker() async {
    final result = await showModalBottomSheet<Map<String, int>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => CustomVisitCupertinoDatePicker(initialDate: selectedDate),
    );

    if (result != null) {
      setState(() {
        selectedDate = DateTime(
          result['year']!,
          result['month']!,
          result['day']!,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    final Color tabBorderColor = selectedTabIndex == 0
        ? AppColors.primary
        : AppColors.secondary;

    return Scaffold(
      appBar: CustomAppbar(
        appBarBackgoundColor: AppTheme.getColor(context).onPrimary,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/visit/svgs/backarrow.svg'),
        ),
        title: 'Visit',
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 12 * Responsive.getResponsiveText(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  'Latitude: 22.938088',
                  isKey: true,
                  fontSize: 10 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getColor(context).primary,
                ),
                CustomText(
                  'Longitude: 72.938088',
                  fontSize: 10 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getColor(context).primary,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          MyCustomTabBar(
            tabs: const ['My Visit', 'Other Employee Visit'],
            selectedIndex: selectedTabIndex,
            onTabChange: (index) {
              setState(() {
                selectedTabIndex = index;
              });
            },
            selectedBgColors: [
              AppTheme.getColor(context).primary,
              AppTheme.getColor(context).secondary,
            ],
            unselectedBorderAndTextColor: tabBorderColor,
            tabBarBorderColor: tabBorderColor,
            isShadowBottomLeft: true,
          ),
          Expanded(
            child: selectedTabIndex == 0
                //my visit tab
                ? MyVisitTab(
                    searchController: searchController,
                    searchFocus: searchFocus,
                    formattedDate: formattedDate,
                    goToPreviousDate: goToPreviousDate,
                    goToNextDate: goToNextDate,
                    selectDateFromPicker: selectDateFromPicker,
                    visitList: visitList,
                    buildVisitCard: buildVisitCard,
                    buildAutoExpenseCard: buildAutoExpenseCard(context),
                  )
                //other emp visit tab
                : buildOtherEmployeeVisitTab(
                    context,
                    MediaQuery.of(context).size,
                    searchController: searchController,
                    searchFocus: searchFocus,
                    formattedDate: formattedDate,
                    goToPreviousDate: goToPreviousDate,
                    goToNextDate: goToNextDate,
                    selectDateFromPicker: selectDateFromPicker,
                  ),
          ),
        ],
      ),
      floatingActionButton: selectedTabIndex == 0
          ? ExpandableFab(
              openIcon: Icons.add,
              closeIcon: Icons.close,
              actions: [
                ExpandableFabAction(
                  label: 'Add Visit',
                  icon: Icons.location_on,
                  onTap: () {},
                ),
                ExpandableFabAction(
                  label: 'Add Expense',
                  icon: Icons.money,
                  onTap: () {},
                ),
              ],
              imageSize: 66 * Responsive.getResponsiveText(context),
              innericonsize: 20 * Responsive.getResponsiveText(context),
              circleavataradius: 22 * Responsive.getResponsiveText(context),
              innericonbgr: AppColors.white,
              margin: EdgeInsets.only(
                right: 10 * Responsive.getResponsiveText(context),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 14 * Responsive.getResponsiveText(context),
                vertical: 8 * Responsive.getResponsiveText(context),
              ),
            )
          : null,
    );
  }
}
