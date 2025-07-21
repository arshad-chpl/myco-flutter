import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/get_common_row.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class RejectionSection extends StatelessWidget {
  final BuildContext context;

  const RejectionSection({super.key, required this.context});

  @override
  Widget build(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          'end_visit_request',
          isKey: true,
          fontWeight: FontWeight.w600,
          fontSize: 14 * Responsive.getResponsiveText(context),
          color: AppTheme.getColor(context).primary,
        ),
        SizedBox(height: Responsive.getHeight(context) * 0.015),
        getCommonRow(
          context,
          title: 'rejected_by',
          value: 'vatsal soni (UIUX Designer)',
          onTap: () {},
        ),
        getCommonRow(
          context,
          title: 'Date',
          value: '03:58 PM , 03 Jun 2025',
          onTap: () {},
        ),
        getCommonRow(
          context,
          title: 'Reason',
          value: 'There were lots of missing data here',
          onTap: () {},
        ),
      ],
    );
}
