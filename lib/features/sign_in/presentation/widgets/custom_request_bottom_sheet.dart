import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/change_request_bottom_sheet.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/custom_dialog.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';

class CustomRequestBottomSheet extends StatelessWidget {
  const CustomRequestBottomSheet({super.key});

  @override
  Widget build(BuildContext context) => MyCoDialog(
      isBottomSheet: true,
      image: Image.asset(
        'assets/sign_in/update.png',
        height: .15 * Responsive.getHeight(context),
        width: .5 * Responsive.getWidth(context),
      ),
      isDescriptionThere: false,
      title:
      'You were registered with Google - sdk_gphonr64_arm64, please contact to \nadmin or request for new phone registration.',
      actions: [
        MyCoButton(
          onTap: () {},
          title: 'Close',
          height: 0.068 * Responsive.getHeight(context),
          width: .7 * Responsive.getWidth(context),
          backgroundColor: AppTheme.getColor(context).onPrimary,
          textStyle: MyCoButtonTheme.getWhiteBackgroundTextStyle(context),
          boarderRadius: 30 * Responsive.getResponsive(context),
        ),
        MyCoButton(
          onTap: () {
            context.pop();
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: AppTheme.getColor(context).onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20 * Responsive.getResponsive(context)),
                  ),
                ),
                builder: (_) => ChangeRequestBottomSheet()
            );
          },
          title: 'Request',
          height: 0.068 * Responsive.getHeight(context),
          width: .7 * Responsive.getWidth(context),
          boarderRadius: 30 * Responsive.getResponsive(context),
          isShadowBottomLeft: true,
        ),
      ],
    );
}
