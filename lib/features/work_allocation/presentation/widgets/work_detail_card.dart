import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/common_row.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class WorkDetailCard extends StatelessWidget {
  const WorkDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> commonRowData = [
      {'title': 'Work Category', 'value': 'AI Tools'},
      {'title': 'Project', 'value': 'Abc'},
      {'title': 'Location', 'value': 'Abc'},
      {'title': 'Site', 'value': 'Abc'},
      {'title': 'HOD Remark', 'value': 'Abc'},
      {'title': 'Created Date & Time', 'value': '12 May 2025 , 10:00 AM'},
    ];
    return BorderContainerWraper(
      borderRadius:
          VariableBag.containerBorderRadius * Responsive.getResponsive(context),
      borderColor: AppTheme.getColor(context).outline,
      padding: EdgeInsets.only(
        top: 16 * Responsive.getResponsive(context),
        bottom: 21 * Responsive.getResponsive(context),
        left: 12 * Responsive.getResponsive(context),
        right: 12 * Responsive.getResponsive(context),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Work Start and Completion Date
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    'Work Start Date',
                    fontWeight: FontWeight.w700,
                    color: AppTheme.getColor(context).onSurface,
                    fontSize: 14 * Responsive.getResponsiveText(context),
                  ),
                  CustomText(
                    '21 st May 2025',
                    color: AppTheme.getColor(context).outline,
                    fontWeight: FontWeight.w500,
                    fontSize: 14 * Responsive.getResponsiveText(context),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    'Work Completion Date',
                    fontWeight: FontWeight.w700,
                    color: AppTheme.getColor(context).onSurface,
                    fontSize: 14 * Responsive.getResponsiveText(context),
                  ),
                  CustomText(
                    '22nd May 2025',
                    color: AppTheme.getColor(context).outline,
                    fontWeight: FontWeight.w500,
                    fontSize: 14 * Responsive.getResponsiveText(context),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: AppTheme.getColor(context).secondary,
            thickness: 1 * Responsive.getResponsive(context),
          ),

          // Work-related details using reusable CommonRow
          ...commonRowData.map(
            (item) => CommonRow(
              title: item['title'].toString(),
              value: item['value'].toString(),
              textColor: AppTheme.getColor(context).outline,
            ),
          ),
        ],
      ),
    );
  }
}
