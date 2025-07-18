import 'package:flutter/cupertino.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

Widget labelWithAsterisk(BuildContext context, String label) => Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    CustomText(
      label,
      fontSize: 14 * Responsive.getResponsiveText(context),
      fontWeight: FontWeight.w700,
      color: AppTheme.getColor(context).onSurfaceVariant,
    ),
    CustomText(
      ' *',
      fontSize: 14 * Responsive.getResponsiveText(context),
      fontWeight: FontWeight.w600,
      color: AppTheme.getColor(context).error,
      isKey: false, // prevents translation for '*'
    ),
  ],
);
