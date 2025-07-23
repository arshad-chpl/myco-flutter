import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

class RejectRequestBottomSheet extends StatefulWidget {
  const RejectRequestBottomSheet({super.key});

  @override
  State<RejectRequestBottomSheet> createState() =>
      _RejectRequestBottomSheetState();
}

class _RejectRequestBottomSheetState extends State<RejectRequestBottomSheet> {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
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
      children: [
        //NewTextField for Reject Request
        NewTextField(
          prefixIconPath: AppAssets.assetMsgEdit.toString(),
          maxLines: 3,
          hintText: 'Type Here',
          label: 'Reject Request',
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
              onTap: () {},
              title: 'SUBMIT',
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
