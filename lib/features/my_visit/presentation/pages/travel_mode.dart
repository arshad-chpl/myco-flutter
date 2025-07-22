import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
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
          left: 31.0 * Responsive.getResponsive(context),
          right: 31.0 * Responsive.getResponsive(context),
          top: 20 * Responsive.getResponsive(context),
          bottom: 10 * Responsive.getResponsive(context), // reduced
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // makes it wrap content
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Travel Mode field
            NewTextField(
              label: LanguageManager().get('please_select_travel_mode'),
              prefixIconPath: AppAssets.smart_car,
              suffixIconPath: AppAssets.arrow_down,
              controller: travelModeController,
              hintText: LanguageManager().get('select'),
            ),
            SizedBox(height: 20 * Responsive.getResponsive(context)),

            /// Site field
            NewTextField(
              label: LanguageManager().get('site'),
              prefixIconPath: AppAssets.global,
              suffixIconPath: AppAssets.arrow_down,
              controller: siteController,
              hintText: LanguageManager().get('select'),
            ),
            SizedBox(height: 30 * Responsive.getResponsive(context)),

            /// Buttons row
            Row(
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
                    boarderRadius: 30 * Responsive.getResponsive(context),
                  ),
                ),
                SizedBox(width: 10 * Responsive.getResponsive(context)),
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
                    boarderRadius: 30 * Responsive.getResponsive(context),
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
