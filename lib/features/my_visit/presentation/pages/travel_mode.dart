import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class TravelMode extends StatefulWidget {
  const TravelMode({super.key});

  @override
  State<TravelMode> createState() => _TravelModeState();
}

class _TravelModeState extends State<TravelMode> {
  // Dropdown data for travel modes and sites
  final List<String> travelModes = ['Bike', 'Car', 'Bus'];
  final List<String> sites = ['Site A', 'Site B', 'Site C'];

  // Selected dropdown values
  String? selectedTravelMode;
  String? selectedSite;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.getColor(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 31.0 * getResponsive(context),
          ),
          child: Column(
            spacing: 15 * getResponsive(context),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Label for Travel Mode Dropdown
              CustomText(
                'Select Travel Mode',
                fontSize: 12 * getResponsiveText(context),
                fontWeight: FontWeight.w400,
                color: theme.onSurface,
              ),

              /// Travel Mode Dropdown
              CustomPopupDropdownStyled<String>(
                height: 0.06 * getHeight(context),
                spacing: 8 * getResponsive(context),
                prefix: SvgPicture.asset(
                  AppAssets.smart_car,
                  fit: BoxFit.scaleDown,
                ),
                prefixImageWidth: 20 * getWidth(context),
                prefixImageHeight: 20 * getHeight(context),
                items: travelModes,
                hintText: 'Select',
                hintTextStyle: TextStyle(
                  fontSize: 20 * getResponsiveText(context),
                  color: theme.outline,
                ),
                selectedItem: selectedTravelMode,
                itemToString: (item) => item,
                onChanged: (value, index) {
                  // Handle dropdown change
                },
              ),

              // Label for Site Dropdown
              CustomText(
                'Site',
                fontSize: 12 * getResponsiveText(context),
                fontWeight: FontWeight.w500,
                color: theme.onSurface,
              ),

              /// Site Dropdown
              CustomPopupDropdownStyled<String>(
                height: 0.06 * getHeight(context),
                spacing: 10 * getResponsive(context),
                prefix: SvgPicture.asset(
                  AppAssets.global,
                  fit: BoxFit.scaleDown,
                ),
                items: sites,
                hintText: 'Select',
                hintTextStyle: TextStyle(
                  fontSize: 20 * getResponsiveText(context),
                  color: theme.outline,
                ),
                selectedItem: selectedSite,
                itemToString: (item) => item,
                onChanged: (value, index) {
                  // Handle dropdown change
                },
              ),

              // Buttons Row: CLOSE and START VISIT
              Padding(
                padding:
                    EdgeInsets.only(top: 20, left: 5, right: 5) *
                    getResponsive(context),
                child: Row(
                  spacing: 10 * getResponsive(context),
                  children: [
                    // CLOSE Button
                    Expanded(
                      child: MyCoButton(
                        onTap: () {
                          // Add your close logic here
                        },
                        title: 'CLOSE',
                        textStyle: TextStyle(
                          color: theme.primary,
                          fontSize: 16 * getResponsiveText(context),
                          fontWeight: FontWeight.w400,
                        ),
                        backgroundColor: Colors.white,
                        borderColor: theme.primary,
                        boarderRadius: 30 * getResponsive(context),
                      ),
                    ),

                    // START VISIT Button
                    Expanded(
                      child: MyCoButton(
                        onTap: () {
                          // Add your start visit logic here
                        },
                        title: 'START VISIT',
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16 * getResponsiveText(context),
                          fontWeight: FontWeight.w400,
                        ),
                        backgroundColor: theme.primary,
                        boarderRadius: 30 * getResponsive(context),
                        isShadowBottomLeft: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
