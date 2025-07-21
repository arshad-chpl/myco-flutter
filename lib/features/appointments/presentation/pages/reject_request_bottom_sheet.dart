import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
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
      left: 16 * Responsive.getResponsive(context),
      right: 16 * Responsive.getResponsive(context),
      top: 25 * Responsive.getResponsive(context),
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
        SizedBox(height: 0.02 * Responsive.getHeight(context)),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //MyCoButton CLOSE button
            MyCoButton(
              boarderRadius: 30 * Responsive.getResponsive(context),
              width: 0.44 * Responsive.getWidth(context),
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
              boarderRadius: 30 * Responsive.getResponsive(context),
              width: 0.44 * Responsive.getWidth(context),
              height: 0.06 * Responsive.getHeight(context),
              onTap: () {},
              title: 'SUBMIT',
              fontWeight: FontWeight.w600,
              isShadowBottomLeft: true,
            ),
          ],
        ),
        SizedBox(height: 0.03 * Responsive.getHeight(context)),
      ],
    ),
  );
}
