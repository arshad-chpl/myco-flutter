import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bottom_sheet/approve_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_alert_dialog.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

class CompletionRemarkBottomSheet extends StatefulWidget {
  const CompletionRemarkBottomSheet({super.key});

  @override
  State<CompletionRemarkBottomSheet> createState() =>
      _CompletionRemarkBottomSheetState();
}

class _CompletionRemarkBottomSheetState
    extends State<CompletionRemarkBottomSheet> {
  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(
      bottom: MediaQuery.of(context).viewInsets.bottom,
      left:
          VariableBag.bottomSheetLeftPadding *
          Responsive.getResponsive(context),
      right:
          VariableBag.bottomSheetRightPadding *
          Responsive.getResponsive(context),
      top:
          VariableBag.bottomSheetTopPadding * Responsive.getResponsive(context),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        //NewTextField for Reject Request
        NewTextField(
          enabled: false,
          prefixIconPath: AppAssets.assetCalendarTick,
          hintText: LanguageManager().get('before_time'),
          label: 'completion_remark',
          suffixIconPath: AppAssets.assetArrowDown,
          isRequired: true,
          isKey: true,
        ),
        NewTextField(
          prefixIconPath: AppAssets.assetMessageEdit,
          maxLines: 3,
          hintText: LanguageManager().get('good'),
          label: 'remark',
          isKey: true,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Please enter Remark';
            }
            return null;
          },
        ),
        SizedBox(
          height:
              VariableBag.textFieldRowGap * Responsive.getResponsive(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //MyCoButton CLOSE button
            MyCoButton(
              boarderRadius:
                  VariableBag.buttonBorderRadius *
                  Responsive.getResponsive(context),
              width: 0.42 * Responsive.getWidth(context),
              height: 0.06 * Responsive.getHeight(context),
              onTap: () {
                context.pop();
              },
              backgroundColor: AppTheme.getColor(context).surfaceBright,
              title: 'CLOSE',
              textStyle: TextStyle(
                color: AppTheme.getColor(context).primary,
                fontWeight: FontWeight.w600,
              ),
            ),

            // MyCoButton SUBMIT button to confirm rejection
            MyCoButton(
              boarderRadius:
                  VariableBag.buttonBorderRadius *
                  Responsive.getResponsive(context),
              width: 0.42 * Responsive.getWidth(context),
              height: 0.06 * Responsive.getHeight(context),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const Center(
                    child: Material(
                      child: CustomAlertDialog(
                        alertType: AlertType.custom,
                        icon: AppAssets.assetApproveWork,
                        cancelText: 'DENY',
                        confirmText: 'APPROVE',

                        title:
                            'Are you sure you want to approve this request ?',
                      ),
                    ),
                  ),
                );
              },
              title: 'Authorize',
              fontWeight: FontWeight.w600,
              isShadowBottomLeft: true,
            ),
          ],
        ),
        SizedBox(
          height:
              VariableBag.textFieldRowGap * Responsive.getResponsive(context),
        ),
      ],
    ),
  );
}
