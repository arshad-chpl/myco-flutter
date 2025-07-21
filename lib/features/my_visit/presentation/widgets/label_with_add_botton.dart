import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';


class LabelWithAddButton extends StatelessWidget {
  final String label;
  final String actionText;
  final VoidCallback onTap;
  final String iconPath;

  const LabelWithAddButton({
    super.key,
    required this.label,
    required this.actionText,
    required this.onTap,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) => Row(
      children: [
        CustomText(
          label,
          fontWeight: FontWeight.w700,
          fontSize: 12 * Responsive.getResponsiveText(context),
          color: AppTheme.getColor(context).onSurfaceVariant,
        ),
        const Spacer(),

        // Action icon with tap
        InkWell(
          onTap: onTap,
          child: SvgPicture.asset(iconPath),
        ),
        SizedBox(width: 0.009 * Responsive.getWidth(context)),

        // Action text
        CustomText(
          actionText,
          fontWeight: FontWeight.w700,
          fontSize: 12 * Responsive.getResponsiveText(context),
          color: AppTheme.getColor(context).onSurfaceVariant,
        ),
      ],
    );
}
