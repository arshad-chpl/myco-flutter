import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/start_visit_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class PrimaryVisitActionButton extends StatelessWidget {
  final BuildContext context;
  final Map<String, dynamic> visit;
  final bool isSixthContainer;
  final bool showExtraButtons;
  final bool showStartedVisit;

  const PrimaryVisitActionButton({
    super.key,
    required this.context,
    required this.visit,
    required this.isSixthContainer,
    required this.showExtraButtons,
    required this.showStartedVisit,
  });

  @override
  Widget build(BuildContext context) {
    final bool hideOrderButtons = visit['hideOrderButtons'] == true;

    String buttonText = 'START VISIT';
    if (isSixthContainer) {
      buttonText = 'ADD REQUEST TO END VISIT';
    } else if (showExtraButtons) {
      buttonText =
      (!hideOrderButtons && showStartedVisit) ? 'ADD REQUEST TO END VISIT' : 'ADD EXPENSES';
    }

    return MyCoButton(
      onTap: () {
        if (!showExtraButtons && !isSixthContainer) {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: AppTheme.getColor(context).onPrimary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (_) => startVisitBottomSheet(context),
          );
        }
      },
      title: buttonText,
      backgroundColor: AppTheme.getColor(context).secondary,
      textStyle: TextStyle(
        color: AppTheme.getColor(context).onPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 14 * Responsive.getResponsiveText(context),
      ),
      boarderRadius: 30,
      isShadowBottomLeft: true,
    );
  }
}
