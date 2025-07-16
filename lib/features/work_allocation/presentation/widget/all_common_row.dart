import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widget/common_row.dart';

class AllCommonRow extends StatefulWidget {
  const AllCommonRow({super.key});

  @override
  State<AllCommonRow> createState() => _AllCommonRowState();
}

class _AllCommonRowState extends State<AllCommonRow> {
  @override
  Widget build(BuildContext context) => Column(
    children: [
      CommonRow(
        title: 'Work Category',
        value: 'AI Tools',
        textColor: AppColors.textGray,
        onTap: () {},
      ),
      SizedBox(height: 0.005 * Responsive.getHeight(context)),
      CommonRow(
        title: 'Project',
        value: 'Fjc',
        textColor: AppColors.textGray,
        onTap: () {},
      ),
      SizedBox(height: 0.005 * Responsive.getHeight(context)),
      CommonRow(
        title: 'Work Start Date',
        value: '21st May 2025',
        textColor: AppColors.textGray,
        onTap: () {},
      ),
      SizedBox(height: 0.005 * Responsive.getHeight(context)),
      CommonRow(
        title: 'Target Date of Completion',
        value: '22nd May 2025',
        textColor: AppColors.textGray,
        onTap: () {},
      ),
      SizedBox(height: 0.005 * Responsive.getHeight(context)),
      Divider(color: AppTheme.getColor(context).secondary),
    ],
  );
}
