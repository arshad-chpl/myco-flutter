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

  final double? labelFontSize;
  final double? actionFontSize;
  final FontWeight? labelFontWeight;
  final FontWeight? actionFontWeight;
  final Color? labelColor;
  final Color? actionColor;

  const LabelWithAddButton({
    super.key,
    required this.label,
    required this.actionText,
    required this.onTap,
    required this.iconPath,
    this.labelFontSize,
    this.actionFontSize,
    this.labelFontWeight,
    this.actionFontWeight,
    this.labelColor,
    this.actionColor,
  });

  @override
  Widget build(BuildContext context) {
    final responsiveText = Responsive.getResponsiveText(context);
    final double defaultFontSize = 12 * responsiveText;
    final defaultColor = AppTheme.getColor(context).onSurfaceVariant;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(
          label,
          fontSize: labelFontSize ?? defaultFontSize,
          fontWeight: labelFontWeight ?? FontWeight.w700,
          color: labelColor ?? defaultColor,
        ),
        const Spacer(),
        InkWell(onTap: onTap, child: SvgPicture.asset(iconPath)),
        SizedBox(width: 8),
        CustomText(
          actionText,
          fontSize: actionFontSize ?? defaultFontSize,
          fontWeight: actionFontWeight ?? FontWeight.w700,
          color: actionColor ?? defaultColor,
        ),
      ],
    );
  }
}
