import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/features/visit/presentation/widgets/build_other_employee_visit_tab.dart';
import 'package:myco_flutter/features/visit/presentation/widgets/custom_visit_calender.dart';
import 'package:myco_flutter/features/visit/presentation/widgets/visit_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';
import 'package:myco_flutter/widgets/common_card.dart';
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
            "\n(You are in Range)",
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
        'Address':
        'Plot 22, Phase-3 GIDC, Vatva, Ahmedabad, Gujarat, 382445',
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
        'Address':
        'SG Highway, Near Infocity, Gandhinagar, Gujarat',
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
        'Address': 'Bapunagar, Ahmedabad, Gujarat - 380024'
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
        'Address': '101 Sanand - Sarkhej Rd, Makarba, Ahmedabad\nSarkhej-Okaf, Gujarat, 382421, India'
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
        'Address': '101 Sanand - Sarkhej Rd, Makarba, Ahmedabad\nSarkhej-Okaf, Gujarat, 382421, India'
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
        'Address': '101 Sanand - Sarkhej Rd, Makarba, Ahmedabad\nSarkhej-Okaf, Gujarat, 382421, India'
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
        'Address': 'Maninagar, Ahmedabad, Gujarat'
      },
      'showWhatsapp': true,
      'showShare': true,
    },

  ];

  String get formattedDate =>
      '${selectedDate.day} ${monthName(selectedDate.month)}, ${selectedDate.year}';

  String monthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
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
      builder: (_) => CustomVisitCupertinoDatePicker(
        initialDate: selectedDate,
      ),
    );

    if (result != null) {
      setState(() {
        selectedDate =
            DateTime(result['year']!, result['month']!, result['day']!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    final Color tabBorderColor = selectedTabIndex == 0
        ? AppColors.primary
        : AppColors.secondary;

    final screenSize = MediaQuery.of(context).size;
    final multiplier = getResponsiveText(context);

    return Scaffold(
      appBar: CustomAppbar(
        leading: BackButton(),
        title: CustomText(
          'Visit',
          fontSize: 22 * multiplier,
          fontWeight: FontWeight.w600,
          color: AppTheme.getColor(context).onSurface,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12 * multiplier),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  'Latitude: 22.938088',
                  fontSize: 10 * multiplier,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getColor(context).primary,
                ),
                CustomText(
                  'Longitude: 72.938088',
                  fontSize: 10 * multiplier,
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
          SizedBox(height: 0.10 * multiplier),
          MyCustomTabBar(
            tabs: const ['My Visit', 'Other Employee Visit'],
            selectedIndex: selectedTabIndex,
            onTabChange: (index) {
              setState(() {
                selectedTabIndex = index;
              });
            },
            selectedBgColors: [AppTheme.getColor(context).primary, AppTheme.getColor(context).secondary],
            unselectedBorderAndTextColor: tabBorderColor,
            tabBarBorderColor: tabBorderColor,
            isShadowBottomLeft: true,
          ),
          Expanded(
            child: selectedTabIndex == 0
                ? buildMyVisitTab(screenSize, multiplier) //visit page
                : buildOtherEmployeeVisitTab( // other emp page
              context,
              screenSize,
              multiplier,
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
        imageSize: 66 * multiplier,
        innericonsize: 20 * multiplier,
        circleavataradius: 22 * multiplier,
        innericonbgr: AppColors.white,
        margin: EdgeInsets.only(right: 10 * multiplier),
        padding: EdgeInsets.symmetric(horizontal: 14 * multiplier, vertical: 8 * multiplier),
      )
          : null,

    );
  }

  Widget buildMyVisitTab(Size screenSize, double multiplier) => SingleChildScrollView(
    padding: EdgeInsets.all(screenSize.width * 0.04),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            dateArrowButton(Icons.chevron_left_rounded, goToPreviousDate, multiplier),
            GestureDetector(
              onTap: selectDateFromPicker,
              child: Row(
                children: [
                  Baseline(
                    baselineType: TextBaseline.alphabetic,
                    baseline: 20 * multiplier,
                    child: CustomText(
                      formattedDate,
                      fontSize: 16 * multiplier,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.getColor(context).onSurface,
                    ),
                  ),
                  Baseline(
                    baselineType: TextBaseline.alphabetic,
                    baseline: 20 * multiplier,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppTheme.getColor(context).onSurface,
                      size: 22 * multiplier,
                    ),
                  ),
                ],
              ),
            ),
            dateArrowButton(Icons.chevron_right_rounded, goToNextDate, multiplier),
          ],
        ),
        SizedBox(height: 16 * multiplier),
        SizedBox(
          height: 45 * multiplier,
          child: MyCoTextfield(
            controller: searchController,
            focusNode: searchFocus,
            hintText: 'Search with Customer',
            fillColor: AppTheme.getColor(context).onPrimary,
            boarderRadius: 10,
            contentPadding: EdgeInsets.symmetric(vertical: 12 * multiplier),
            prefix: Padding(
              padding: EdgeInsets.only(left: 12 * multiplier, right: 8 * multiplier),
              child: Icon(
                CupertinoIcons.search,
                color: AppTheme.getColor(context).primary,
                size: 24 * multiplier,
              ),
            ),
            typingtextStyle: TextStyle(fontSize: 14 * multiplier),
            hintTextStyle: TextStyle(
              fontSize: 14 * multiplier,
            ),
            textAlignment: TextAlign.start,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10 * multiplier)),
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
            ),
          ),
        ),
        SizedBox(height: screenSize.height * 0.012),
        buildAutoExpenseCard(multiplier),
        SizedBox(height: screenSize.height * 0.02),
        ListView.builder(
          itemCount: visitList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) =>
              buildVisitCard(context, visitList[index], index, screenSize,visitList.length,),
        ),
      ],
    ),
  );

  Widget buildAutoExpenseCard(double multiplier) => CommonCard(
      title: 'Auto Expense Category',
      headerColor: AppTheme.getColor(context).tertiary,
      borderColor: AppTheme.getColor(context).outline,
      showHeaderPrefixIcon: false,
      showBlackShadowInChild: true,
      bottomWidget: Padding(
        padding: EdgeInsets.all(12 * multiplier),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 8 * multiplier,
              horizontal: 12 * multiplier,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8 * multiplier),
              border: Border.all(color: AppTheme.getColor(context).tertiary),
            ),
            child: IntrinsicWidth(
              child: CustomText(
                'Mukund - Visit Expense',
                fontSize: 12 * multiplier,
                fontWeight: FontWeight.w700,
                color: AppTheme.getColor(context).onSurface,
              ),
            ),
          ),

        ),

      ),
    );

  Widget dateArrowButton(IconData icon, VoidCallback onTap, double multiplier) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(8 * multiplier),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15 * multiplier),
            color: Util.applyOpacity(AppTheme.getColor(context).primary, 0.25),
          ),
          child: Icon(icon, size: 22 * multiplier),
        ),
      );
}
