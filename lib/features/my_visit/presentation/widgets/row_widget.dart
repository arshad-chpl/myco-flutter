import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class LabelRow extends StatelessWidget {
  final String title;
  final String actionLabel;
  final VoidCallback? onTap;
  final bool Isselectbtn;

  const LabelRow({
    Key? key,
    required this.title,
    required this.actionLabel,
    this.onTap,
    this.Isselectbtn = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CustomText(
              LanguageManager().get('${title}'),
            fontWeight: FontWeight.w700,
            fontSize: 15 * Responsive.getResponsiveText(context),
            color: AppTheme.getColor(context).onSurfaceVariant
          ),
           Spacer(),
          Container(
            child:
            Isselectbtn?
            Row(
              children: [
                SvgPicture.asset(AppAssets.Addicon,
                  width: 25 * Responsive.getResponsive(context),
                  height: 25 * Responsive.getResponsive(context),
                  colorFilter: ColorFilter.mode(
                    AppTheme.getColor(context).onSurfaceVariant,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 0.01 * Responsive.getWidth(context)),
                CustomText(
                  LanguageManager().get('${actionLabel}'),
                  isKey: true,
                  fontWeight: FontWeight.w700,
                  fontSize: 15 * Responsive.getResponsiveText(context),
                  color:AppTheme.getColor(context).onSurfaceVariant,
                ),
              ],
            )
                : const SizedBox.shrink()

          ),
        ],
      ),
    );
}
