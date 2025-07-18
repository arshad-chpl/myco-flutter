import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/get_common_row.dart';


class VisitDetailRows extends StatelessWidget {
  final String visit;
  final String visitType;
  final String visitPurpose;
  final String address;

  final VoidCallback onVisitTap;
  final VoidCallback onVisitTypeTap;
  final VoidCallback onVisitPurposeTap;
  final VoidCallback onAddressTap;

  const VisitDetailRows({
    super.key,
    required this.visit,
    required this.visitType,
    required this.visitPurpose,
    required this.address,
    required this.onVisitTap,
    required this.onVisitTypeTap,
    required this.onVisitPurposeTap,
    required this.onAddressTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color outlineColor = AppTheme.getColor(context).outline;
    final Color surfaceColor = AppTheme.getColor(context).onSurface;

    return Column(
      children: [
        getCommonRow(
          context,
          title: 'Visit',
          value: visit,
          onTap: onVisitTap,
          textColor: outlineColor,
        ),
        getCommonRow(
          context,
          title: 'Visit Type',
          value: visitType,
          onTap: onVisitTypeTap,
          textColor: outlineColor,
        ),
        getCommonRow(
          context,
          title: 'Visit Purpose',
          value: visitPurpose,
          onTap: onVisitPurposeTap,
          textColor: outlineColor,
        ),
        getCommonRow(
          context,
          title: 'Address',
          value: address,
          onTap: onAddressTap,
          textColor: surfaceColor,
        ),
      ],
    );
  }
}
