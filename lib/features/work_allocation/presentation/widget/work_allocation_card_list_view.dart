
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widget/assign_to_and_detail_row_widget.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widget/common_row.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widget/work_allocation_person_detail_widget.dart';

class WorkAllocationCardListView extends StatefulWidget {
  const WorkAllocationCardListView({super.key});

  @override
  State<WorkAllocationCardListView> createState() => _WorkAllocationCardListViewState();
}

class _WorkAllocationCardListViewState extends State<WorkAllocationCardListView> {

  List<Map<String, dynamic>> workAllocationData = [
    {
      'title': '22 May 2025, 10:00 AM',
      'imagePath': 'assets/work_allocation/person_image.png',
      'empName': 'Ajaj Ajmeri',
      'designation': 'H.O.D',
      'fieldWithCity': 'Technical - Ahmedabad',
      'workCategory': 'AI Tools',
      'project': 'FJC',
      'startDate': '21st May 2025',
      'endDate': '22nd May 2025',
    },
    {
      'title': '22 May 2025, 10:00 AM',
      'imagePath': 'assets/work_allocation/person_image.png',
      'empName': 'vinay parihar',
      'designation': 'H.O.D',
      'fieldWithCity': 'Technical - Ahmedabad',
      'workCategory': 'AI Tools',
      'project': 'FJC',
      'startDate': '21st May 2025',
      'endDate': '22nd May 2025',
    },
  ];


  @override
  Widget build(BuildContext context) => ListView.builder(
      scrollDirection: Axis.vertical,
    padding: EdgeInsets.all(13 * Responsive.getResponsive(context)),
      itemCount: workAllocationData.length,
        itemBuilder: (context, index) {
        final workAllocation = workAllocationData[index];

        return Padding(
          padding: EdgeInsets.only(bottom: 17 * Responsive.getResponsive(context)),
          child: CommonCard(
            title: workAllocation['title'],
            headerColor: AppTheme.getColor(context).primary,
            headerPrefixIcon: 'assets/work_allocation/calendar.png',
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
                ],
              ),
            ),
          ),
        );
        },
    );
}
