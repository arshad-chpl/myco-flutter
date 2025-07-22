import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/reschedule_visit_page.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/StatusAndViewButtonsRow_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/end_visit_bottom_sheet.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/get_common_row.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/start_visit_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

Widget MyVisitBottomWidget(
    BuildContext context,
    Map<String, dynamic> visit,
    int index,
    ) {
  final bool showExtraButtons = visit['showExtraButtons'] == true;
  final bool showStartedVisit = visit['showStartedVisit'] == true;
  final bool isSixthContainer = visit['isSixthContainer'] == true;
  final bool hideOrderButtons = visit['hideOrderButtons'] == true;

  String buttonText = LanguageManager().get('start_visit');
  if (isSixthContainer) {
    buttonText = LanguageManager().get('request_to_end_visit');
  } else if (showExtraButtons) {
    buttonText = (!hideOrderButtons && showStartedVisit)
        ? LanguageManager().get('request_to_end_visit')
        : LanguageManager().get('add_expenses');
  }

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

        // Visit details
        ...visit['details'].entries.map<Widget>((e) {
          final key = e.key.trim();
          final value = e.value.toString();
          final lowerKey = key.toLowerCase();

          Color valueColor = AppTheme.getColor(context).onSurface;
          if (lowerKey == 'visit status') {
            valueColor = value.toLowerCase() == 'approved'
                ? AppTheme.getColor(context).secondary
                : AppColors.spanishYellow;
          } else if (lowerKey == 'visit') {
            valueColor = AppColors.textGray;
          }

          return getCommonRow(
            context,
            title: key,
            value: value,
            textColor: valueColor,
            onTap: () {},
            showMap: lowerKey == 'address' && visit['showImage'] == true,
          );
        }),
        SizedBox(height: Responsive.getHeight(context) * 0.02),

        // Reschedule & Icons Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RescheduleVisitPage()),
              ),
              child: CustomText(
                'Reschedule Visit?',
                isKey: true,
                fontWeight: FontWeight.w600,
                fontSize: 14 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).primary,
                decoration: TextDecoration.underline,
              ),
            ),
            Row(
              children: [
                if (visit['showWhatsapp'] == true)
                  ...[
                    SvgPicture.asset(AppAssets.whatsapp),
                    SizedBox(width: Responsive.getWidth(context) * 0.03),
                  ],
                if (visit['showShare'] == true)
                  ...[
                    SvgPicture.asset(AppAssets.share),
                    SizedBox(width: Responsive.getWidth(context) * 0.03),
                  ],
                if (visit['showDelete'] == true)
                  SvgPicture.asset(AppAssets.delete),
              ],
            ),
          ],
        ),
        SizedBox(height: Responsive.getHeight(context) * 0.02),

        // Action Buttons
        if (index == 2 || index == 3)
          Row(
            children: [
              MyCoButton(
                onTap: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  builder: (_) => const EndVisitBottomSheet(),
                ),
                title: 'END VISIT',
                boarderRadius: VariableBag.buttonBorderRadius,
                backgroundColor: Util.applyOpacity(AppColors.red, 0.1),
                textStyle: TextStyle(
                  color: AppColors.red,
                  fontSize: 13.5 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.bold,
                ),
                isShadowBottomLeft: true,
                height: 0.050 * Responsive.getHeight(context),
                width: 0.38 * Responsive.getWidth(context),
              ),
              SizedBox(width: VariableBag.buttonRowSpacing * Responsive.getResponsive(context),),
              MyCoButton(
                onTap: () {},
                title: 'TAKE ORDER',
                backgroundColor: AppTheme.getColor(context).primary,
                boarderRadius: VariableBag.buttonBorderRadius,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 13.5 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.bold,
                ),
                isShadowBottomLeft: true,
                height: 0.050 * Responsive.getHeight(context),
                width: 0.38 * Responsive.getWidth(context),
              ),
            ],
          ),

        if (index == 2 || index == 3)
          SizedBox(height: Responsive.getHeight(context) * 0.01),

        if (index == 6)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                'You Already Have sent End Visit Request',
                fontWeight: FontWeight.w600,
                fontSize: 15 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).primary,
              ),
              SizedBox(height: Responsive.getHeight(context) * 0.007),
              getCommonRow(
                context,
                title: 'Requested On',
                value: '03:58 PM , 03 Jun 2025',
                textColor: AppTheme.getColor(context).onSurface,
                onTap: () {},
              ),
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
          MyCoButton(
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
            boarderRadius: VariableBag.buttonBorderRadius,
            isShadowBottomLeft: true,
          ),

        if (visit['isEighthContainer'] == true)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                'end_visit_request',
                isKey: true,
                fontWeight: FontWeight.w600,
                fontSize: 14 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).primary,
              ),
              SizedBox(height: Responsive.getHeight(context) * 0.015),
              getCommonRow(
                context,
                title: LanguageManager().get('rejected_by'),
                value: 'vatsal soni (UIUX Designer)',
                onTap: () {},
              ),
              getCommonRow(
                context,
                title: LanguageManager().get('date'),
                value: '03:58 PM , 03 Jun 2025',
                onTap: () {},
              ),
              getCommonRow(
                context,
                title: LanguageManager().get('reason'),
                value: 'There were lots of missing data here',
                onTap: () {},
              ),
            ],
          ),
      ],
    ),
  );
}
