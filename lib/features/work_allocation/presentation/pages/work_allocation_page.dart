import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widget/all_common_row.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widget/assign_to_and_detail_row_widget.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widget/work_allocation_person_detail_widget.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';

class WorkAllocationPage extends StatefulWidget {
  const WorkAllocationPage({super.key});

  @override
  State<WorkAllocationPage> createState() => _WorkAllocationPageState();
}

class _WorkAllocationPageState extends State<WorkAllocationPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppbar(title: 'work_allocation', isKey: true),
    body: Padding(
      padding: EdgeInsets.all(13 * Responsive.getResponsive(context)),
      child: Column(
        children: [
          const CustomSearchField(hintText: 'Search'),
          SizedBox(height: 0.023 * Responsive.getHeight(context)),
          // MonthYearHeader(
          //   onChanged: (month, year) => month + year,
          // ),
          // SizedBox(height: 0.023 * Responsive.getHeight(context),),
          CommonCard(
            title: '22 May 2025, 10:00 AM',
            headerColor: AppTheme.getColor(context).primary,
            headerPrefixIcon: 'assets/work_allocation/calendar.png',
            showHeaderPrefixIcon: true,
            bottomWidget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const AssignToAndDetailRowWidget(),
                  const WorkAllocationPersonDetailWidget(
                    imagePath: 'assets/work_allocation/person_image.png',
                    empName: 'Ajaj Ajmeri',
                    designation: 'hod',
                    fieldWithCity: 'Technical - Ahmedabad',
                  ),
                  Divider(color: AppTheme.getColor(context).secondary),
                  const AllCommonRow()
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
