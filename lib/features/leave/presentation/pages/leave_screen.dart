import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/presentation/pages/add_short_leave_screen.dart';
import 'package:myco_flutter/features/leave/presentation/pages/my_leave_balance_screen.dart';
import 'package:myco_flutter/features/leave/presentation/pages/my_team_leaves_screen.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_action_button.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_card.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_filter_bottom_sheet.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_floating_action_button.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/month_year_header.dart';

import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({super.key});
  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  String selectedValue = 'All Leaves';
  final List<LeaveEntry> leaveList = [
    LeaveEntry(
      date: 'Mon , 27 May 2025',
      leaveType: 'Short leave',
      subType: 'Short leave',
      leaveTime: '6:30 PM',
      reason: 'Meeting with client',
      approvedBy: 'Vatsal Champaneri',
      status: 'Approved',
      payStatus: 'Paid Leave',
    ),
    LeaveEntry(
      date: 'Thu, 22 May 2025',
      leaveType: 'Auto leave',
      subType: 'Auto leave',
      leaveTime: '12:00 PM',
      reason: 'Sick',
      approvedBy: 'N/A',
      status: 'Pending',
      payStatus: 'Unpaid Leave',
    ),
    LeaveEntry(
      date: 'Thu, 22 May 2025',
      leaveType: 'Auto leave',
      subType: 'Auto leave',
      leaveTime: '12:00 PM',
      reason: 'Sick',
      approvedBy: 'N/A',
      status: 'Pending',
      payStatus: 'Unpaid Leave',
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_back_outlined),
      ),
      title: const Text('Leave balance'),
      centerTitle: true,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyCoButton(
            onTap: () {
              showLeaveFilterBottomSheet(context, selectedValue, (p0) {
                selectedValue = p0;
                setState(() {});
              }, ['All Leaves', 'Paid Leaves', 'UnPaid Leaves']);
            },

            textStyle: TextStyle(
              fontSize: 12 * getResponsiveText(context),
              color: MyCoButtonTheme.whitemobileBackgroundColor,
            ),
            title: selectedValue,
            height: 0.035 * getHeight(context),
            width: 0.3 * getWidth(context),
            imagePosition: AxisDirection.right,
            image: const Icon(
              Icons.keyboard_arrow_down,
              color: MyCoButtonTheme.whitemobileBackgroundColor,
            ),
          ),
        ),
      ],
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          spacing: 0.015 * getHeight(context),
          children: [
            MonthYearHeader(
              onChanged: (month, year) {
                // Handle month/year change
                debugPrint('Selected: ${month + 1}, $year');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LeaveActionButton(
                  title: 'My Leave Balance',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyLeaveBalanceScreen(),
                      ),
                    );
                  },
                ),
                LeaveActionButton(
                  title: 'My Team Leaves',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyTeamLeavesScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),

            ...leaveList.map((e) => LeaveCard(leave: e)),
          ],
        ),
      ),
    ),
    floatingActionButton: LeaveFloatingActionButton(
      actions: [
        LeaveFloatingActionButtonModel(
          label: 'Apply Short Leave',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddShortLeaveScreen()),
            );
          },
          icon: Icons.add,
          iconPath: 'assets/images/short_apply_leave.png',
        ),
        LeaveFloatingActionButtonModel(
          label: 'Apply Leave',
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(),
            );
          },

          icon: Icons.add,
        ),
      ],
      innericonsize: 25,
      circleavataradius: 25,
      imageSize: 0.050 * getHeight(context),
      openIcon: Icons.add,
      innerimageheight: 0.02 * getHeight(context),
      innerimagewidth: 0.02 * getHeight(context),
      closeIcon: Icons.close_outlined,
    ),
  );
}
