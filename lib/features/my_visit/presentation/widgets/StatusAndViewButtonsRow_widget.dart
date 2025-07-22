import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
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
          width: 0.35 * Responsive.getWidth(context),
          onTap: () {},
          title: LanguageManager().get(status),
          backgroundColor: Colors.transparent,
          textStyle: TextStyle(
            color: statusColor,
            fontSize: 14 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w400,
          ),
          boarderRadius: VariableBag.buttonBorderRadius,
          borderColor: statusColor,
          borderWidth: 1,
          wantBorder: true,
        ),
        Spacer(),
        MyCoButton(
          height: 0.034 * Responsive.getHeight(context),
          width: 0.34 * Responsive.getWidth(context),
          onTap: () => context.pushNamed('view-visit-details'),
          title: LanguageManager().get('view_details'),
          backgroundColor: AppTheme.getColor(context).primary,
          textStyle: TextStyle(
            color: AppTheme.getColor(context).onPrimary,
            fontSize: 15 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w400,
          ),
          boarderRadius: VariableBag.buttonBorderRadius,
          wantBorder: false,
          isShadowBottomLeft: true,
        ),
      ],
    );
}
