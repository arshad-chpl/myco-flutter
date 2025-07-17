import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widget/common_row.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class WorkDetailCard extends StatelessWidget {
  const WorkDetailCard({super.key});

  @override
  Widget build(BuildContext context) => BorderContainerWraper(
    borderRadius: 16 * Responsive.getResponsive(context),
    borderColor: AppTheme.getColor(context).outline,
    padding: EdgeInsets.symmetric(
      horizontal: 0.03 * Responsive.getWidth(context),
      vertical: 0.02 * Responsive.getHeight(context),
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
                ),
                CustomText(
                  '21 st May 2025',
                  color: AppTheme.getColor(context).outline,
                  fontWeight: FontWeight.w500,
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
                ),
                CustomText(
                  '22nd May 2025',
                  color: AppTheme.getColor(context).outline,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
        Divider(color: AppTheme.getColor(context).secondary),

        // Work-related details using reusable CommonRow
        CommonRow(
          title: 'Work Category',
          value: 'AI Tools',
          textColor: AppTheme.getColor(context).outline,
        ),
        CommonRow(
          title: 'Project',
          value: 'Abc',
          textColor: AppTheme.getColor(context).outline,
        ),
        CommonRow(
          title: 'Location',
          value: 'Abc',
          textColor: AppTheme.getColor(context).outline,
        ),
        CommonRow(
          title: 'Site',
          value: 'Abc',
          textColor: AppTheme.getColor(context).outline,
        ),
        CommonRow(
          title: 'HOD Remark',
          value: 'Abc',
          textColor: AppTheme.getColor(context).outline,
        ),
        CommonRow(
          title: 'Created Date & Time',
          value: '12 May 2025 , 10:00 AM',
          textColor: AppTheme.getColor(context).outline,
        ),
      ],
    ),
  );
}
