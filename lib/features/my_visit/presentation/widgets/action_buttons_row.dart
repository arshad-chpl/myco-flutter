import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/end_visit_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class ActionButtonsRow extends StatelessWidget {
  final BuildContext context;

  const ActionButtonsRow({super.key, required this.context});

  @override
  Widget build(BuildContext context) => Row(
      children: [
        Expanded(
          child: MyCoButton(
            onTap: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (_) => const EndVisitBottomSheet(),
            ),
            title: 'END VISIT',
            boarderRadius: 40,
            backgroundColor: Util.applyOpacity(AppColors.red, 0.1),
            textStyle: TextStyle(
              color: AppColors.red,
              fontSize: 13.5 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.bold,
            ),
            isShadowBottomLeft: true,
          ),
        ),
        SizedBox(width: Responsive.getWidth(context) * 0.03),
        Expanded(
          child: MyCoButton(
            onTap: () {},
            title: 'TAKE ORDER',
            backgroundColor: AppTheme.getColor(context).primary,
            boarderRadius: 40,
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 13.5 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.bold,
            ),
            isShadowBottomLeft: true,
          ),
        ),
      ],
    );
}
