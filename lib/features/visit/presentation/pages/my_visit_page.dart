import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/features/visit/presentation/widgets/custom_visit_calender.dart';
import 'package:myco_flutter/features/visit/presentation/widgets/get_common_row.dart';
import 'package:myco_flutter/features/visit/presentation/widgets/visit_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

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
      'title': "Mahakali Tractor ( RT4567 )",
      'time': "01st April, 2025(09:45 AM) TO 01st April, 2025(12:45 PM)",
      'status': "Visit Not Started",
      'showExtraButtons': false,
      "details": {
        "Visit": "Physical",
        "Visit Status": "Approved",
        "Address":
        "101 Sanand - Sarkhej Rd, Makarba, Ahmedabad\nSarkhej-Okaf, Gujarat, 382421, India"
            "\n(You are in Range)",
      },
      "showWhatsapp": true,
      "showShare": true,
      "showDelete": true,
    },
    {
      "title": "Rajdeep Implements ( RJ2020 )",
      "time": "02nd April, 2025(10:00 AM) TO 02nd April, 2025(01:00 PM)",
      "status": "Visit Not Started",
      'showExtraButtons': false,
      "details": {
        "Visit": "Demo",
        "Visit Status": "Pending",
        "Address":
        "Plot 22, Phase-3 GIDC, Vatva, Ahmedabad, Gujarat, 382445",
      },
      "showWhatsapp": true,
      "showShare": true,
      "showDelete": true,
    },
    {
      "title": "Special Customer ( SC2025 )",
      "time": "03rd April, 2025(11:00 AM) TO 03rd April, 2025(02:00 PM)",
      "status": "Visit Not Started",
      'showExtraButtons': true,
      'details': {
        'Visit': "Service",
        "Visit Status": "Approved",
        "Address":
        "SG Highway, Near Infocity, Gandhinagar, Gujarat",
      },
      "showWhatsapp": true,
      "showShare": true,
    },
    {
      "title": "Final Customer ( FC2025 )",
      "time": "05th April, 2025(03:00 PM) TO 05th April, 2025(05:00 PM)",
      "status": "Visit Started",
      'showExtraButtons': true,
      'showStartedVisit': true,
      'isOutOfRange': true,
      'showImage': true,
      'details': {
        'Visit': "Installation",
        "Visit Status": "Approved",
        "Address": "Bapunagar, Ahmedabad, Gujarat - 380024"
      },
      "showWhatsapp": true,
      "showShare": true,
    },
    {
      "title": "Hidden Buttons Visit ( HB2025 )",
      "time": "06th April, 2025(11:00 AM) TO 06th April, 2025(02:00 PM)",
      "status": "Visit Not Started",
      'showExtraButtons': true,
      'showStartedVisit': false,
      'isOutOfRange': true,
      'hideOrderButtons': true,
      'showImage': true,
      'details': {
        'Visit': "Service",
        "Visit Status": "Approved",
        "Address": "101 Sanand - Sarkhej Rd, Makarba, Ahmedabad\nSarkhej-Okaf, Gujarat, 382421, India"
      },
      "showWhatsapp": true,
      "showShare": true,
      "showDelete": true,
    },
    // 6th Container
    {
      "title": "Late Visit End ( LV2025 )",
      "time": "07th April, 2025(01:30 PM) TO 07th April, 2025(03:30 PM)",
      "status": "Visit Started",
      'showExtraButtons': true,
      'showStartedVisit': true,
      'isOutOfRange': true,
      'showImage': true,
      'isSixthContainer': true,
      'hideOrderButtons': true,
      'details': {
        'Visit': "Inspection",
        "Visit Status": "Approved",
        "Address": "101 Sanand - Sarkhej Rd, Makarba, Ahmedabad\nSarkhej-Okaf, Gujarat, 382421, India"
      },
      "showWhatsapp": true,
      "showShare": true,
    },
//7th
    {
      "title": "Late Visit End ( LV2025 )",
      "time": "07th April, 2025(01:30 PM) TO 07th April, 2025(03:30 PM)",
      "status": "Visit Started",
      'showExtraButtons': true,
      'showStartedVisit': true,
      'isOutOfRange': true,
      'showImage': true,
      'isSixthContainer': true,
      'isSeventhContainer': true,
      'hideOrderButtons': true,
      'requestedOn': '03:58 PM , 03 Jun 2025',
      'details': {
        'Visit': "Inspection",
        "Visit Status": "Approved",
        "Address": "101 Sanand - Sarkhej Rd, Makarba, Ahmedabad\nSarkhej-Okaf, Gujarat, 382421, India"
      },
      "showWhatsapp": true,
      "showShare": true,
    },
    // 8th
    {
      "title": "Late Visit End ( LV2025 )",
      "time": "07th April, 2025(01:30 PM) TO 07th April, 2025(03:30 PM)",
      "status": "Visit Started",
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
        'Visit': "Inspection",
        "Visit Status": "Approved",
        "Address": "Maninagar, Ahmedabad, Gujarat"
      },
      "showWhatsapp": true,
      "showShare": true,
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
      backgroundColor: AppTheme.getColor(context).onPrimary,
      appBar: AppBar(
        backgroundColor: AppTheme.getColor(context).onPrimary,
        elevation: 0,
        centerTitle: false,
        leading: Icon(
          Icons.arrow_back,
          color: AppTheme.getColor(context).onSurface,
          size: 28 * multiplier,
        ),
        title: CustomText(
          'Visit',
          fontSize: 24 * multiplier,
          fontWeight: FontWeight.w700,
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
          SizedBox(height: 10 * multiplier),
          MyCustomTabBar(
            tabs: const ['My Visit', 'Other Employee Visit'],
            selectedIndex: selectedTabIndex,
            onTabChange: (index) {
              setState(() {
                selectedTabIndex = index;
              });
            },
            selectedBgColors: const [AppColors.primary, AppColors.secondary],
            unselectedBorderAndTextColor: tabBorderColor,
            tabBarBorderColor: tabBorderColor,
            borderRadius: 35,
            isShadowBottomLeft: true,
          ),
          Expanded(
            child: selectedTabIndex == 0
                ? buildMyVisitTab(screenSize, multiplier)
                : buildOtherEmployeeVisitTab(screenSize,multiplier),
          ),
        ],
      ),
      floatingActionButton: selectedTabIndex == 0
          ? MyCoButton(
        onTap: () {},
        title: '',
        height: 66 * multiplier,
        width: 66 * multiplier,
        boarderRadius: 33 * multiplier,
        backgroundColor: AppTheme.getColor(context).primary,
        image: Icon(
          Icons.add,
          color: Colors.white,
          size: 24 * multiplier,
        ),
        wantBorder: false,
        isShadowBottomLeft: true,
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
                      color: AppColors.black,
                    ),
                  ),
                  Baseline(
                    baselineType: TextBaseline.alphabetic,
                    baseline: 20 * multiplier,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 22 * multiplier,
                      color: AppColors.black,
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
            fillColor: Colors.white,
            boarderRadius: 10,
            contentPadding: EdgeInsets.symmetric(vertical: 12 * multiplier),
            prefix: Padding(
              padding: EdgeInsets.only(left: 12 * multiplier, right: 8 * multiplier),
              child: Icon(
                CupertinoIcons.search,
                color: AppColors.primary,
                size: 24 * multiplier,
              ),
            ),
            typingtextStyle: TextStyle(fontSize: 14 * multiplier),
            hintTextStyle: TextStyle(
              fontSize: 14 * multiplier,
              color: AppColors.textPrimary,
            ),
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
              buildVisitCard(context, visitList[index], index, screenSize),
        ),
      ],
    ),
  );

  Widget buildAutoExpenseCard(double multiplier) => Stack(
    children: [
      Material(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12 * multiplier),
          topRight: Radius.circular(12 * multiplier),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12 * multiplier),
            border: Border.all(color: AppTheme.getColor(context).outline),
            color: AppTheme.getColor(context).onPrimary,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12 * multiplier),
                decoration: BoxDecoration(
                  color: AppColors.myCoCyan,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12 * multiplier)),
                ),
                child: CustomText(
                  'Auto Expense Category',
                  fontSize: 16 * multiplier,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12 * multiplier),
                child: Container(
                  padding: EdgeInsets.all(8 * multiplier),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8 * multiplier),
                    border: Border.all(color: AppTheme.getColor(context).tertiary),
                  ),
                  child: CustomText(
                    'Mukund - Visit Expense',
                    fontSize: 12 * multiplier,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned.fill(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.3),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
    ],
  );

  Widget dateArrowButton(IconData icon, VoidCallback onTap, double multiplier) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(8 * multiplier),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15 * multiplier),
            color: Util.instance.applyOpacity(AppColors.primary, 0.25),
          ),
          child: Icon(icon, size: 22 * multiplier),
        ),
      );

  Widget buildOtherEmployeeVisitTab(Size screenSize, double multiplier)=> SingleChildScrollView(
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
                      color: AppColors.black,
                    ),
                  ),
                  Baseline(
                    baselineType: TextBaseline.alphabetic,
                    baseline: 20 * multiplier,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 22 * multiplier,
                      color: AppColors.black,
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
            fillColor: Colors.white,
            boarderRadius: 10,
            contentPadding: EdgeInsets.symmetric(vertical: 12 * multiplier),
            prefix: Padding(
              padding: EdgeInsets.only(left: 12 * multiplier, right: 8 * multiplier),
              child: Icon(
                CupertinoIcons.search,
                color: AppColors.primary,
                size: 24 * multiplier,
              ),
            ),
            typingtextStyle: TextStyle(fontSize: 14 * multiplier),
            hintTextStyle: TextStyle(
              fontSize: 14 * multiplier,
              color: AppColors.textPrimary,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10 * multiplier)),
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
            ),
          ),
        ),
        SizedBox(height: screenSize.height * 0.012),
        Stack(
      children: [
        Material(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          elevation: 3.0,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(screenSize.height * 0.015),
            decoration: BoxDecoration(
              color: AppTheme.getColor(context).primary,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  'Supreme Auto garge - Kadodra(RT67542) ',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16 * multiplier,
                ),
                SizedBox(height: screenSize.height * 0.01),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/visit/svgs/calendar.svg',
                      height: screenSize.height * 0.025,
                      width: screenSize.width * 0.025,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: CustomText(
                        '03:42 PM 05th Jun 2025',
                        fontSize: 13 * multiplier,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withAlpha(76),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(screenSize.width * 0.035),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.textfieldBorder),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Visit Added For & Reschedule
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      'Visit Added For',
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14 * multiplier,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: CustomText(
                        'Reschedule Visit?',
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14 * multiplier,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),

              // Profile Tile
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.asset(
                    'assets/visit/svgs/user.png',
                    fit: BoxFit.contain,
                    width: 80 * multiplier,
                    height: 80 * multiplier,
                  ),
                  title: CustomText(
                    'Ajju k',
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14 * multiplier,
                  ),
                  subtitle: CustomText(
                    'QA',
                    color: AppColors.textfieldBorder,
                    fontSize: 12 * multiplier,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              // Divider
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.0020),
                child: const Divider(
                  color: AppColors.primary,
                  thickness: 1.2,
                ),
              ),

              // Visit Details
              getCommonRow(
                context,
                title: "Visit",
                value: "Physical",
                onTap: () {},
              ),
              SizedBox(height: screenSize.height * 0.015),
              getCommonRow(
                context,
                title: "Visit Type",
                value: "Visit Type",
                onTap: () {},
              ),
              SizedBox(height: screenSize.height * 0.015),
              getCommonRow(
                context,
                title: "Visit Purpose",
                value: "Visit Purpose",
                onTap: () {},
              ),
              SizedBox(height: screenSize.height * 0.015),
              getCommonRow(
                context,
                title: "Address",
                value: "5XJ6F9J, Haripura, Gujarat 394325, India",
                onTap: () {},
              ),

              SizedBox(height: screenSize.height * 0.015),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Start: 3 SVG icons (wrapped in Flexible)
                  Flexible(
                    flex: 6,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/visit/svgs/whatsapp.svg',
                          height: 25 * multiplier,
                          width: 25 * multiplier,
                        ),
                        SizedBox(width: screenSize.width * 0.03),
                        SvgPicture.asset(
                          'assets/visit/svgs/share.svg',
                          height: 25 * multiplier,
                          width: 25 * multiplier,
                        ),
                        SizedBox(width: screenSize.width * 0.03),
                        SvgPicture.asset(
                          'assets/visit/svgs/delete.svg',
                          height: 25 * multiplier,
                          width: 25 * multiplier,
                        ),
                      ],
                    ),
                  ),

                  // End: Visit Not Started Button (Flexible or Expanded)
                  Flexible(
                    flex: 5,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: MyCoButton(
                        onTap: () {
                          // handle tap
                        },
                        title: 'Visit Not Started',
                        textStyle: TextStyle(
                          color: AppColors.spanishYellow,
                          fontWeight: FontWeight.w500,
                          fontSize: 13 * multiplier,
                        ),
                        boarderRadius: 30,
                        borderColor: AppColors.spanishYellow,
                        borderWidth: 1.2,
                        backgroundColor: Colors.transparent,
                        height: 36 * multiplier,
                        wantBorder: true,
                        width: screenSize.width * 0.4, // button width responsive
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),



      ],
    ),
  );
}
