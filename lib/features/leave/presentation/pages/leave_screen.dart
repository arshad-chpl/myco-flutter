import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/presentation/pages/add_short_leave_screen.dart';
import 'package:myco_flutter/features/leave/presentation/pages/my_leave_balance_screen.dart';
import 'package:myco_flutter/features/leave/presentation/pages/my_team_leaves_screen.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/custom_fab_menu.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_action_button.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_card.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_detail_bottom_sheet.dart';
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
      date: 'Mon , 15 Jan 2024',
      leaveType: 'Sick Leave (Paid)',
      subType: 'Half Day Leave',
      leaveTime: '10:15 AM, 15th Jan 2024',
      reason: 'Feeling unwell and need to rest.',
      approvedBy:
          'Jay', // Assuming 'approvedBy' should reflect who approved the leave
      // in the detail view.
      status: 'Approved',
      payStatus: 'Paid Leave',
      onViewDetailWidget: const LeaveDetailBottomSheet(
        requestDate: '10:15 AM, 15th Jan 2024',
        approvedDate: '10:20 AM, 15th Jan 2024',
        leaveType: 'Sick Leave (Paid)',
        leaveDuration: 'Half Day Leave', // This is subType in LeaveEntry
        reason: 'Feeling unwell and need to rest.',
        altPhone: '9876543210',
        taskDependency: 'No',
        status: 'Approved',
        dependencyHandle: 'No critical tasks pending. Will catch up on return.',
        attachments: ['/abs/path/to/medical_certificate.pdf'],
        detailColor: AppColors.secondary,
      ),
    ),
    LeaveEntry(
      date: 'Thu, 10 Feb 2024',
      leaveType: 'Personal Leave (Unpaid)',
      subType: 'Two Days Leave',
      leaveTime: '03:30 PM, 10th Feb 2024',
      reason: 'Attending a family function out of station.',
      approvedBy: 'Kevin',
      status: 'Pending',
      payStatus: 'Unpaid Leave',
      onViewDetailWidget: const LeaveDetailBottomSheet(
        requestDate: '03:30 PM, 10th Feb 2024',
        approvedDate: 'N/A',
        leaveType: 'Personal Leave (Unpaid)', // This is leaveType in LeaveEntry
        leaveDuration: 'Two Days Leave',
        reason: 'Attending a family function out of station.',
        altPhone: '8765432109',
        taskDependency: 'Yes',
        status: 'Pending',
        dependencyHandle:
            'John will handle urgent client queries. Project X documentation needs to be completed by me upon return.',
        attachments: [
          '/abs/path/to/invitation.jpg',
          '/abs/path/to/travel_tickets.pdf',
        ],
        detailColor: AppColors.spanishYellow,
      ),
    ),
    LeaveEntry(
      date: 'Thu, 5 Mar 2024',
      leaveType: 'Work From Home',
      subType: 'Full Day',
      leaveTime: '09:00 AM, 5th Mar 2024',
      reason: 'Internet outage at office. Will work remotely.',
      approvedBy: 'Alice',
      status: 'Reject',
      payStatus: 'Unpaid Leave',
      onViewDetailWidget: const LeaveDetailBottomSheet(
        requestDate: '09:00 AM, 5th Mar 2024',
        approvedDate: '09:05 AM, 5th Mar 2024',
        leaveType: 'Work From Home',
        leaveDuration: 'Full Day',
        reason: 'Internet outage at office. Will work remotely.',
        altPhone: '7654321098',
        taskDependency: 'No',
        status: 'Reject',
        dependencyHandle:
            'Will be available online for all communications and tasks.',
        attachments: ["rtthrthr"],
        detailColor: AppColors.red,
      ),
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
              fontSize: 12 * Responsive.getResponsiveText(context),
              color: MyCoButtonTheme.whitemobileBackgroundColor,
            ),
            title: selectedValue,
            height: 0.035 * Responsive.getHeight(context),
            width: 0.3 * Responsive.getWidth(context),
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
        padding: const EdgeInsets.all(25.0),
        child: Column(
          spacing: 0.015 * Responsive.getHeight(context),
          children: [
            MonthYearHeader(
              onChanged: (month, year) {
                // Handle month/year change
                debugPrint('Selected: ${month + 1}, $year');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    // floatingActionButton: LeaveFloatingActionButton(
    //   actions: [
    //     LeaveFloatingActionButtonModel(
    //       label: 'Apply Short Leave',
    //       onTap: () {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) => AddShortLeaveScreen()),
    //         );
    //       },
    //       icon: Icons.add,
    //       iconPath: 'assets/images/short_apply_leave.png',
    //     ),
    //     LeaveFloatingActionButtonModel(
    //       label: 'Apply Leave',
    //       onTap: () {
    //         showModalBottomSheet(
    //           context: context,
    //           builder: (context) => Container(),
    //         );
    //       },
    //
    //       icon: Icons.add,
    //     ),
    //   ],
    //   innericonsize: 25,
    //   circleavataradius: 25,
    //   imageSize: 0.050 * getHeight(context),
    //   openIcon: Icons.add,
    //   innerimageheight: 0.02 * getHeight(context),
    //   innerimagewidth: 0.02 * getHeight(context),
    //   closeIcon: Icons.close_outlined,
    // ),
    floatingActionButton: CustomFabMenu(
      buttons: [
        FabButtonModel(
          label: 'Apply Leave',
          icon: Icons.event_available_outlined,
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(),
            );
          },
        ),
        FabButtonModel(
          label: 'Apply Short Leave',
          imagePath: 'assets/images/short_apply_leave.png',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddShortLeaveScreen()),
            );
          },
        ),
      ],
    ),
  );
}
