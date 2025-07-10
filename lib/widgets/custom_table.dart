import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CustomTableWidget extends StatelessWidget {
  final String name = 'Yash Soni';
  final String designation = '( UI UX )';

  CustomTableWidget({super.key});

  TableRow _buildRow(BuildContext context) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 6.0),
          child: _styledFullName(context),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: _styledFullName(context),
          ),
        ),
      ],
    );
  }

  Widget _styledFullName(BuildContext context) {
    return Row(
      children: [
        CustomText(
          '$name',
          fontSize: 12 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w600,
          color: AppTheme.getColor(context).onSurface,
        ),
        SizedBox(width: 0.006 * Responsive.getWidth(context)),
        CustomText(
          '$designation',
          fontSize: 12 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w600,
          color: AppTheme.getColor(context).outline,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder(
        top: BorderSide(width: 1, color: Colors.grey.shade300),
        horizontalInside: BorderSide(width: 1, color: Colors.grey.shade300),
        verticalInside: BorderSide(width: 1, color: Colors.grey.shade300),
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const {0: FlexColumnWidth(), 1: FlexColumnWidth()},
      children: List.generate(8, (_) => _buildRow(context)),
    );
  }
}
