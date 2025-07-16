import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/month_year_header.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_calendar_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class WorkAllocationPage extends StatefulWidget {
  const WorkAllocationPage({super.key});

  @override
  State<WorkAllocationPage> createState() => _WorkAllocationPageState();
}

class _WorkAllocationPageState extends State<WorkAllocationPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppbar(
      title: 'work_allocation',
      isKey: true,
    ),
    body: Padding(
      padding: EdgeInsets.all(13 * Responsive.getResponsive(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSearchField(
            hintText: 'Search',
          ),
          SizedBox(height: 0.023 * Responsive.getHeight(context),),
          // MonthYearHeader(
          //   onChanged: (month, year) => month + year,
          // ),
          // SizedBox(height: 0.023 * Responsive.getHeight(context),),
          CommonCard(
              title: 'title',
              headerColor: AppTheme.getColor(context).primary,
              // headerPrefixIcon: ,
              bottomWidget: Column(
                children: [
                  Row(
                    children: [
                      CustomText('Assign To')
                    ],
                  )
                ],
              )
          )
        ],
      ),
    ),
  );
}
