
import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widget/assign_to_and_detail_row_widget.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widget/common_row.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widget/work_allocation_person_detail_widget.dart';
import 'package:myco_flutter/widgets/custom_horizontal_stepper.dart';


class WorkAllocationCardListView extends StatefulWidget {
  const WorkAllocationCardListView({super.key});

  @override
  State<WorkAllocationCardListView> createState() => _WorkAllocationCardListViewState();
}

class _WorkAllocationCardListViewState extends State<WorkAllocationCardListView> {

  List<Map<String, dynamic>> workAllocationData = [
    {
      'title': '22 May 2025, 10:00 AM',
      'imagePath': AppAssets.personProfileImage,
      'empName': 'Ajaj Ajmeri',
      'designation': 'H.O.D',
      'fieldWithCity': 'Technical - Ahmedabad',
      'workCategory': 'AI Tools',
      'project': 'FJC',
      'startDate': '21st May 2025',
      'endDate': '22nd May 2025',
      'status': 'Pending' // or 'Approved', 'Completed', 'Authorized', 'Denied'
    },
    {
      'title': '22 May 2025, 10:00 AM',
      'imagePath': AppAssets.personProfileImage,
      'empName': 'vinay parihar',
      'designation': 'H.O.D',
      'fieldWithCity': 'Technical - Ahmedabad',
      'workCategory': 'AI Tools',
      'project': 'FJC',
      'startDate': '21st May 2025',
      'endDate': '22nd May 2025',
      'status': 'Approved' // or 'Approved', 'Completed', 'Authorized', 'Denied'
    },
    {
      'title': '22 May 2025, 10:00 AM',
      'imagePath': AppAssets.personProfileImage,
      'empName': 'vinay parihar',
      'designation': 'H.O.D',
      'fieldWithCity': 'Technical - Ahmedabad',
      'workCategory': 'AI Tools',
      'project': 'FJC',
      'startDate': '21st May 2025',
      'endDate': '22nd May 2025',
      'status': 'Completed' // or 'Approved', 'Completed', 'Authorized', 'Denied'
    },
    {
      'title': '22 May 2025, 10:00 AM',
      'imagePath': AppAssets.personProfileImage,
      'empName': 'vinay parihar',
      'designation': 'H.O.D',
      'fieldWithCity': 'Technical - Ahmedabad',
      'workCategory': 'AI Tools',
      'project': 'FJC',
      'startDate': '21st May 2025',
      'endDate': '22nd May 2025',
      'status': 'Authorized' // or 'Approved', 'Completed', 'Authorized', 'Denied'
    },
    {
      'title': '22 May 2025, 10:00 AM',
      'imagePath': AppAssets.personProfileImage,
      'empName': 'vinay parihar',
      'designation': 'H.O.D',
      'fieldWithCity': 'Technical - Ahmedabad',
      'workCategory': 'AI Tools',
      'project': 'FJC',
      'startDate': '21st May 2025',
      'endDate': '22nd May 2025',
      'status': 'Denied' // or 'Approved', 'Completed', 'Authorized', 'Denied'
    },
  ];

  @override
  Widget build(BuildContext context) => ListView.builder(
      scrollDirection: Axis.vertical,
    padding: EdgeInsets.only(
      top: 13 * Responsive.getResponsive(context),
      left: 13 * Responsive.getResponsive(context),
      bottom: 72 * Responsive.getResponsive(context),
      right: 13 * Responsive.getResponsive(context)
    ),
      itemCount: workAllocationData.length,
        itemBuilder: (context, index) {
        final workAllocation = workAllocationData[index];

        return Padding(
          padding: EdgeInsets.only(bottom: 17 * Responsive.getResponsive(context)),
          child: CommonCard(
            title: workAllocation['title'],
            headerColor: AppTheme.getColor(context).primary,
            headerPrefixIcon: AppAssets.calendarIcon,
            showHeaderPrefixIcon: true,
            bottomWidget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const AssignToAndDetailRowWidget(),
                  WorkAllocationPersonDetailWidget(
                    imagePath: workAllocation['imagePath'],
                    empName: workAllocation['empName'],
                    designation: workAllocation['designation'],
                    fieldWithCity: workAllocation['fieldWithCity'],
                  ),
                  Divider(color: AppTheme.getColor(context).secondary),
                  CommonRow(
                    title: 'Work Category',
                    value: workAllocation['workCategory'],
                    textColor: AppColors.textGray,
                  ),
                  SizedBox(height: 0.005 * Responsive.getHeight(context)),
                   CommonRow(
                    title: 'Project',
                    value: workAllocation['project'],
                    textColor: AppColors.textGray,
                  ),
                  SizedBox(height: 0.005 * Responsive.getHeight(context)),
                   CommonRow(
                    title: 'Work Start Date',
                    value: workAllocation['startDate'],
                    textColor: AppColors.textGray,
                  ),
                  SizedBox(height: 0.005 * Responsive.getHeight(context)),
                   CommonRow(
                    title: 'Target Date of Completion',
                    value: workAllocation['endDate'],
                    textColor: AppColors.textGray,
                  ),
                  SizedBox(height: 0.005 * Responsive.getHeight(context)),
                  Divider(color: AppTheme.getColor(context).secondary),

                  SizedBox(height: 0.005 * Responsive.getHeight(context)),
                  StatusTimeline(
                    steps: getTimelineSteps(workAllocation['status']),
                  ),
                  SizedBox(height: 0.005 * Responsive.getHeight(context)),

                ],
              ),
            ),
          ),
        );
        },
    );


  List<TimelineStep> getTimelineSteps(String currentStatus) {
    final steps = <TimelineStep>[];

    if (currentStatus == 'Denied') {
      // Only show "Pending" and "Denied"
      steps.add(TimelineStep(
        label: 'Pending',
        color: AppTheme.getColor(context).error,
        imagePath: null,
        isActive: true,
      ));
      steps.add(TimelineStep(
        label: 'Denied',
        color: AppTheme.getColor(context).error,
        imagePath: AppAssets.cancelCross,
        isActive: true,
      ));
    } else if (currentStatus == 'Pending') {
      steps.add(const TimelineStep(
          label: 'Pending',
          color: AppColors.spanishYellow,
        imagePath: null,
        isActive: true,
      ));
      steps.add(const TimelineStep(
        label: 'Approved',
        color: AppColors.textGray,
        imagePath: AppAssets.checkMark,
        isActive: false,
      ));
      steps.add(const TimelineStep(
        label: 'Completed',
        color: AppColors.textGray,
        imagePath: AppAssets.checkMark,
        isActive: false,
      ));
      steps.add(const TimelineStep(
        label: 'Authorized',
        color: AppColors.textGray,
        imagePath: AppAssets.checkMark,
        isActive: false,
      ));

    } else if (currentStatus == 'Approved') {
      steps.add(TimelineStep(
        label: 'Pending',
        color: AppTheme.getColor(context).secondary,
        imagePath: null,
        isActive: true,
      ));
      steps.add(TimelineStep(
        label: 'Approved',
        color: AppTheme.getColor(context).secondary,
        imagePath: AppAssets.checkMark,
        isActive: true,
      ));
      steps.add(const TimelineStep(
        label: 'Completed',
        color: AppColors.textGray,
        imagePath: AppAssets.checkMark,
        isActive: false,
      ));
      steps.add(const TimelineStep(
        label: 'Authorized',
        color: AppColors.textGray,
        imagePath: AppAssets.checkMark,
        isActive: false,
      ));
    } else if (currentStatus == 'Completed') {
      steps.add(TimelineStep(
        label: 'Pending',
        color: AppTheme.getColor(context).secondary,
        imagePath: null,
        isActive: true,
      ));
      steps.add(TimelineStep(
        label: 'Approved',
        color: AppTheme.getColor(context).secondary,
        imagePath: AppAssets.checkMark,
        isActive: true,
      ));
      steps.add(TimelineStep(
        label: 'Completed',
        color: AppTheme.getColor(context).secondary,
        imagePath: AppAssets.checkMark,
        isActive: true,
      ));
      steps.add(const TimelineStep(
        label: 'Authorized',
        color: AppColors.textGray,
        imagePath: AppAssets.checkMark,
        isActive: false,
      ));
    } else if(currentStatus == 'Authorized') {
      steps.add(TimelineStep(
        label: 'Pending',
        color: AppTheme.getColor(context).secondary,
        imagePath: null,
        isActive: true,
      ));
      steps.add(TimelineStep(
        label: 'Approved',
        color: AppTheme.getColor(context).secondary,
        imagePath: AppAssets.checkMark,
        isActive: true,
      ));
      steps.add(TimelineStep(
        label: 'Completed',
        color: AppTheme.getColor(context).secondary,
        imagePath: AppAssets.checkMark,
        isActive: true,
      ));
      steps.add(TimelineStep(
        label: 'Authorized',
        color: AppTheme.getColor(context).secondary,
        imagePath: AppAssets.checkMark,
        isActive: true,
      ));
    }
    return steps;
  }
}
