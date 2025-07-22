import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

class TravelMode extends StatefulWidget {
  const TravelMode({super.key});

  @override
  State<TravelMode> createState() => _TravelModeState();
}

class _TravelModeState extends State<TravelMode> {
  final TextEditingController travelModeController = TextEditingController();
  final TextEditingController siteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.getColor(context);

    return SafeArea(
      top: true,
      bottom: false, // remove extra bottom safe area
      child: Padding(
        padding: EdgeInsets.only(
          left:
              VariableBag.bottomSheetLeftPadding *
              Responsive.getResponsive(context),
          right:
              VariableBag.bottomSheetRightPadding *
              Responsive.getResponsive(context),
          top:
              VariableBag.bottomSheetTopPadding *
              Responsive.getResponsive(context),
          bottom:
              VariableBag.bottomSheetBottomPadding *
              Responsive.getResponsive(context),
        ),
        child: Column(
          spacing:
              VariableBag.textFieldRowGap * Responsive.getResponsive(context),
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Travel Mode field
            NewTextField(
              label: 'please_select_travel_mode',
              isKey: true,
              prefixIconPath: AppAssets.smart_car,
              suffixIconPath: AppAssets.arrow_down,
              controller: travelModeController,
              hintText: LanguageManager().get('select'),
            ),

            /// Site field
            NewTextField(
              label: 'site',
              isKey: true,
              prefixIconPath: AppAssets.global,
              suffixIconPath: AppAssets.arrow_down,
              controller: siteController,
              hintText: LanguageManager().get('select'),
            ),

            /// Buttons row
            Row(
              spacing:
                  VariableBag.buttonRowSpacing *
                  Responsive.getResponsive(context),
              children: [
                Expanded(
                  child: MyCoButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: LanguageManager().get('close'),
                    textStyle: TextStyle(
                      color: theme.primary,
                      fontSize: 16 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w400,
                    ),
                    backgroundColor: Colors.white,
                    borderColor: theme.primary,
                    boarderRadius:
                        VariableBag.buttonBorderRadius *
                        Responsive.getResponsive(context),
                  ),
                ),
                Expanded(
                  child: MyCoButton(
                    onTap: () {},
                    title: LanguageManager().get('start_visit'),
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w400,
                    ),
                    backgroundColor: theme.primary,
                    boarderRadius:
                        VariableBag.buttonBorderRadius *
                        Responsive.getResponsive(context),
                    isShadowBottomLeft: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
