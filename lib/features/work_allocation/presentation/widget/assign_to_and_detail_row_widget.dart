
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AssignToAndDetailRowWidget extends StatefulWidget {
  const AssignToAndDetailRowWidget({super.key});

  @override
  State<AssignToAndDetailRowWidget> createState() =>
      _AssignToAndDetailRowWidgetState();
}

class _AssignToAndDetailRowWidgetState
    extends State<AssignToAndDetailRowWidget> {
  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
        'Assign To',
        fontSize: 12 * Responsive.getResponsive(context),
        fontWeight: FontWeight.w600,
        color: AppTheme.getColor(context).primary,
      ),
      MyCoButton(
        onTap: () {
         context.push('/detail-page');

        },
        title: LanguageManager().get('view_details'),
        fontWeight: FontWeight.w700,
        height: 0.03 * Responsive.getHeight(context),
        width: 0.28 * Responsive.getWidth(context),
        backgroundColor: AppTheme.getColor(context).secondary,
        borderColor: AppTheme.getColor(context).secondary,
        boarderRadius: 23,
      ),
    ],
  );
}
