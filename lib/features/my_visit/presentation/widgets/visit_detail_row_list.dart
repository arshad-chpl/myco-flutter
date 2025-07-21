import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/get_common_row.dart';

class VisitDetailRowList extends StatelessWidget {
  final BuildContext context;
  final Map<String, dynamic> visit;

  const VisitDetailRowList({
    super.key,
    required this.context,
    required this.visit,
  });

  @override
  Widget build(BuildContext context) => Column(
      children: visit['details'].entries.map<Widget>((e) {
        final key = e.key.trim();
        final value = e.value.toString();
        final lowerKey = key.toLowerCase();

        Color valueColor = AppTheme.getColor(context).onSurface;
        if (lowerKey == 'visit status') {
          valueColor = value.toLowerCase() == 'approved'
              ? AppTheme.getColor(context).secondary
              : AppColors.spanishYellow;
        } else if (lowerKey == 'visit') {
          valueColor = AppColors.textGray;
        }

        return getCommonRow(
          context,
          title: key,
          value: value,
          textColor: valueColor,
          onTap: () {},
          showMap: lowerKey == 'address' && visit['showImage'] == true,
        );
      }).toList(),
    );
}
