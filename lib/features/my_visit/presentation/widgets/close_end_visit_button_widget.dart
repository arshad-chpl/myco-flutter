import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/test_new_visit1.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class CloseEndVistButtonWidget extends StatelessWidget {
  const CloseEndVistButtonWidget({super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // Close Button
      MyCoButton(
        onTap: () => Navigator.pop(context),
        title: 'CLOSE',
        textStyle: TextStyle(
          color: AppTheme.getColor(context).primary,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.transparent,
        boarderRadius: 30,

        width: 0.40 * Responsive.getWidth(context),
        height: 0.06 * Responsive.getHeight(context),
        borderColor: AppTheme.getColor(context).primary,
      ),

      // End Visit Button
      MyCoButton(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16 * Responsive.getResponsive(context)),
              ),
            ),
            builder: (context) => const TestNewVisit1(),
          );
        },
        title: 'END VISIT',
        textStyle: TextStyle(
          color: AppTheme.getColor(context).onPrimary,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: AppTheme.getColor(context).primary,
        boarderRadius: 30,
        width: 0.40 * Responsive.getWidth(context),
        height: 0.06 * Responsive.getHeight(context),
        wantBorder: false,
        isShadowBottomLeft: true,
      ),
    ],
  );
}
