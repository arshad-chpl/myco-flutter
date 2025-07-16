import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_labeled_dropdown.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class TravelMode extends StatefulWidget {
  const TravelMode({super.key});

  @override
  State<TravelMode> createState() => _TravelModeState();
}

class _TravelModeState extends State<TravelMode> {
  final List<String> travelModes = ['Bike', 'Car', 'Bus'];
  final List<String> sites = ['Site A', 'Site B', 'Site C'];

  String? selectedTravelMode;
  String? selectedSite;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.getColor(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 31.0 * Responsive.getResponsive(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15 * Responsive.getResponsive(context)),

              /// Travel Mode Dropdown with label
              LabeledDropdown<String>(
                spacing: 10 * Responsive.getResponsive(context),
                label: LanguageManager().get('please_select_travel_mode'),
                items: travelModes,
                selectedItem: selectedTravelMode,
                itemToString: (item) => item,
                prefix: SvgPicture.asset(
                  AppAssets.smart_car,
                  fit: BoxFit.scaleDown,
                ),
                prefixImageWidth: 20 * Responsive.getWidth(context),
                prefixImageHeight: 20 * Responsive.getHeight(context),
                hintText: LanguageManager().get('select'),
                hintTextStyle: TextStyle(
                  fontSize: 20 * Responsive.getResponsiveText(context),
                  color: theme.outline,
                ),
                onChanged: (value, index) {
                  // update value if needed
                },
              ),

              SizedBox(height: 20 * Responsive.getResponsive(context)),

              /// Site Dropdown with label
              LabeledDropdown<String>(
                spacing: 10 * Responsive.getResponsive(context),
                label: LanguageManager().get('site'),
                items: sites,
                selectedItem: selectedSite,
                itemToString: (item) => item,
                prefix: SvgPicture.asset(
                  AppAssets.global,
                  fit: BoxFit.scaleDown,
                ),
                prefixImageWidth: 20 * Responsive.getWidth(context),
                prefixImageHeight: 20 * Responsive.getHeight(context),
                hintText: LanguageManager().get('select'),
                hintTextStyle: TextStyle(
                  fontSize: 20 * Responsive.getResponsiveText(context),
                  color: theme.outline,
                ),
                onChanged: (value, index) {
                  // update value if needed
                },
              ),

              SizedBox(height: 30 * Responsive.getResponsive(context)),

              /// Buttons Row
              Row(
                children: [
                  Expanded(
                    child: MyCoButton(
                      onTap: () {
                        // close action
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
                      onTap: () {
                        // start visit action
                      },
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
      ),
    );
  }
}
