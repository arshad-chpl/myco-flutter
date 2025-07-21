import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class StatusAndViewButtonsRow extends StatelessWidget {
  final BuildContext context;
  final String status;
  final Color statusColor;

  const StatusAndViewButtonsRow({
    super.key,
    required this.context,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) => Row(
      children: [
        MyCoButton(
          height: 0.034 * Responsive.getHeight(context),
          width: 0.29 * Responsive.getWidth(context),
          onTap: () {},
          title: status,
          backgroundColor: Colors.transparent,
          textStyle: TextStyle(
            color: statusColor,
            fontSize: 14 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w400,
          ),
          boarderRadius: 40,
          borderColor: statusColor,
          borderWidth: 1,
          wantBorder: true,
        ),
        Spacer(),
        MyCoButton(
          height: 0.034 * Responsive.getHeight(context),
          width: 0.29 * Responsive.getWidth(context),
          onTap: () => context.push("/view-visit-details"),
          title: 'View Details',
          backgroundColor: AppTheme.getColor(context).primary,
          textStyle: TextStyle(
            color: AppTheme.getColor(context).onPrimary,
            fontSize: 15 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w400,
          ),
          boarderRadius: 40,
          wantBorder: false,
          isShadowBottomLeft: true,
        ),
      ],
    );
}
