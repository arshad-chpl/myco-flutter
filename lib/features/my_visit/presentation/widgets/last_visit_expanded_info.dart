import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/get_common_row.dart';
import 'package:myco_flutter/widgets/get_common_row.dart' hide getCommonRow;

class LastVisitExpandedInfo extends StatelessWidget {
  const LastVisitExpandedInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = AppTheme.getColor(context).primary;
    final padding = EdgeInsets.all(16 * Responsive.getResponsive(context));

    return Column(
      children: [
        Container(width: double.infinity, height: 1, color: primaryColor),
        Container(
          width: double.infinity,
          color: const Color(0xFFEEF7FD),
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCommonRow(
                context,
                title: 'Last Order Date',
                value: '02:21 PM, 25th Mar 2025',
                onTap: () {},
                textColor: primaryColor,
              ),
              const SizedBox(height: 12),
              getCommonRow(
                context,
                title: 'Last Visit Date',
                value: '02:21 PM, 25th Mar 2025',
                onTap: () {},
                textColor: primaryColor,
              ),
              const SizedBox(height: 12),
              getCommonRow(
                context,
                title: 'Last Order Amount',
                value: '1164.70',
                onTap: () {},
                textColor: primaryColor,
              ),
              const SizedBox(height: 12),
              getCommonRow(
                context,
                title: 'Last Visit By',
                value: 'Manish Chandra (Tester)',
                onTap: () {},
                textColor: primaryColor,
              ),
              const SizedBox(height: 12),
              getCommonRow(
                context,
                title: 'Last Visit Remarks',
                value: 'Done',
                onTap: () {},
                textColor: primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
