import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CommonRow extends StatelessWidget {
  final String title;
  final String value;
  final Widget? valueWidget;
  final double? size;
  final Color? textColor;
  final TextDecoration? decoration;

  const CommonRow({
    Key? key,
    required this.title,
    required this.value,
    this.valueWidget,
    this.size,
    this.textColor,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.baseline,
    textBaseline: TextBaseline.alphabetic,
    children: [
      Expanded(
        flex: 7,
        child: CustomText(
          LanguageManager().get('${title}'),
          isKey: true,
          fontWeight: FontWeight.w600,
          fontSize: size ?? 15 * Responsive.getResponsiveText(context),
        ),
      ),
      const CustomText(':'),
      SizedBox(width: 0.03 * Responsive.getWidth(context)),
      Expanded(
        flex: 5,
        child:
            valueWidget ??
            CustomText(
              value,
              decoration: decoration,
              color: textColor ?? AppTheme.getColor(context).onSurface,
              fontWeight: FontWeight.w500,
              fontSize: size ?? 13 * Responsive.getResponsiveText(context),
            ),
      ),
    ],
  );
}
