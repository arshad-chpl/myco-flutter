import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/StatusAndViewButtonsRow_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/action_buttons_row.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/get_common_row.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/primary_visit_action_button.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/rejection_section.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/reschedule_and_icons_row.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/visit_detail_row_list.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

Widget MyVisitBottomWidget(
    BuildContext context,
    Map<String, dynamic> visit,
    int index,
    ) {
  final bool showExtraButtons = visit['showExtraButtons'] == true;
  final bool showStartedVisit = visit['showStartedVisit'] == true;
  final bool isSixthContainer = visit['isSixthContainer'] == true;

  final statusText = visit['status']?.toString().toLowerCase() ?? '';
  final statusColor = statusText == 'visit started'
      ? AppTheme.getColor(context).secondary
      : AppColors.spanishYellow;

  return Padding(
    padding: EdgeInsets.all(Responsive.getWidth(context) * 0.03),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StatusAndViewButtonsRow(
          context: context,
          status: visit['status'] ?? '',
          statusColor: statusColor,
        ),
        SizedBox(height: Responsive.getHeight(context) * 0.02),
        VisitDetailRowList(context: context, visit: visit),
        SizedBox(height: Responsive.getHeight( context) * 0.02),
        RescheduleAndIconsRow(context: context, visit: visit),
        SizedBox(height: Responsive.getHeight(context) * 0.02),
        if (index == 2 || index == 3) ActionButtonsRow(context: context),
        SizedBox(height: Responsive.getHeight(context) * 0.01),
        if (index == 6)  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              'You Already Have sent End Visit Request',
              isKey: true,
              fontWeight: FontWeight.w600,
              fontSize: 15 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).primary,
            ),
            SizedBox(height: Responsive.getHeight(context) * 0.007),
            getCommonRow(
              context,
              title: 'Requested On',
              value: '03:58 PM , 03 Jun 2025',
              textColor:  AppTheme.getColor(context).onSurface,
              onTap: () {},
            )
          ],
        ),
        if (isSixthContainer && index == 5)
          Center(
            child: CustomText(
              'forgot_to_end_visit',
              isKey: true,
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
              color: AppTheme.getColor(context).primary,
              textAlign: TextAlign.center,
            ),
          ),
        if (visit['isSeventhContainer'] != true)
          PrimaryVisitActionButton(
            context: context,
            visit: visit,
            isSixthContainer: isSixthContainer,
            showExtraButtons: showExtraButtons,
            showStartedVisit: showStartedVisit,
          ),
        if (visit['isEighthContainer'] == true)
          RejectionSection(context: context),
      ],
    ),
  );
}
