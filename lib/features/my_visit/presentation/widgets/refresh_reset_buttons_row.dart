import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class RefreshResetButtonsRow extends StatelessWidget {
  final VoidCallback onRefresh;
  final VoidCallback onReset;
  final double buttonHeight;

  const RefreshResetButtonsRow({
    super.key,
    required this.onRefresh,
    required this.onReset,
    required this.buttonHeight,
  });

  @override
  Widget build(BuildContext context) {
    final double width = Responsive.getWidth(context);
    final double fontSize = 14 * Responsive.getResponsiveText(context);
    final double spacing = 8 * Responsive.getResponsive(context);

    return Row(
      children: [
        MyCoButton(
          title: 'Refresh',
          onTap: onRefresh,
          width: 0.17 * width,
          height: buttonHeight,
          backgroundColor: AppColors.secondary,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
          boarderRadius: 40,
          borderColor: AppTheme.getColor(context).secondary,
          isShadowBottomLeft: true,
        ),
        SizedBox(width: spacing),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: MyCoButton(
            title: 'Reset',
            onTap: onReset,
            width: 0.17 * width,
            height: buttonHeight,
            backgroundColor: AppColors.primary,
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
            boarderRadius: 40,
            isShadowBottomLeft: true,
          ),
        ),
      ],
    );
  }
}
