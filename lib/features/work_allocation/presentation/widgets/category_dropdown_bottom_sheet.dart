import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

Widget categoryDropdownBottomSheet(
  BuildContext context, {
  required List<String> visitPurposes,
  String? selectedVisitPurpose,
}) => Container(
  padding: EdgeInsets.symmetric(
    horizontal: 16 * Responsive.getResponsive(context),
    vertical: 12 * Responsive.getResponsive(context),
  ),
  decoration: BoxDecoration(
    color: AppTheme.getColor(context).onPrimary,
    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: visitPurposes.map((item) {
      final isSelected = item == selectedVisitPurpose;
      return ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          item,
          style: TextStyle(
            fontSize: 14 * Responsive.getResponsiveText(context),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected
                ? AppTheme.getColor(context).primary
                : AppTheme.getColor(context).onSurface,
          ),
        ),
        onTap: () => Navigator.of(context).pop(item),
      );
    }).toList(),
  ),
);
