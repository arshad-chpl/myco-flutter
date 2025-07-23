import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CustomTableWidget extends StatelessWidget {
  final String? name;
  final String? designation;

  CustomTableWidget({super.key, required this.name, required this.designation});

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
          fontSize: 14 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w600,
          color: AppTheme.getColor(context).onSurface,
        ),
        SizedBox(width: 0.006 * Responsive.getWidth(context)),
        CustomText(
          '$designation',
          fontSize: 14 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w600,
          color: AppTheme.getColor(context).outline,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => Column(
    children: List.generate(8, (index) {
      bool isLastRow = index == 7;

      return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: Colors.grey.shade300),
            bottom: index == 7
                ? BorderSide.none
                : BorderSide(width: 1, color: Colors.grey.shade300),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: _styledFullName(context),
                ),
              ),
              if (!isLastRow) Container(width: 1, color: Colors.grey.shade300),
              if (!isLastRow)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _styledFullName(context),
                  ),
                ),
            ],
          ),
        ),
      );
    }),
  );
}