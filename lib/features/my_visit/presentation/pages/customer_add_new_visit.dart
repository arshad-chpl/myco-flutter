import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_radio_button.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/my_visit_custom_radio_button.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CustomerAddNewVisit extends StatefulWidget {
  const CustomerAddNewVisit({super.key});

  @override
  State<CustomerAddNewVisit> createState() => _CustomerAddNewVisitState();
}

class _CustomerAddNewVisitState extends State<CustomerAddNewVisit> {
  // Visit type radio button selected value
  String selectedVisitType = 'Self Visit';

  ///  Dropdown options
  final List<String> VisitType = ['Field Visit', 'Virtual Visit'];
  final List<String> VisitSlot = ['Morning', 'Afternoon', 'Evening'];
  final List<String> Customer = ['Customer 1', 'Customer 2', 'Customer 3'];
  final List<String> VisitPurpose = ['Purpose 1', 'Purpose 2', 'Purpose 3'];

  // Selected dropdown value (shared for all dropdowns for demo)
  String? selectedleavetype;

  String selectedGender = '';
  bool selectedValue = true;

  // Radio button visit type options
  final List<String> visitTypes = [
    'Self Visit',
    'Add visit for other employee',
    'Visit With',
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    // Custom AppBar
    appBar: CustomAppbar(
      appBarText: 'Add New Visit',
      appbartxtcolor: AppTheme.getColor(context).onSurface,
      size: 16 * Responsive.getResponsiveText(context),
      appBarBackgoundColor: AppTheme.getColor(context).surface,
      leading: BackButton(),
    ),

    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 31.0 * Responsive.getResponsive(context)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16 * Responsive.getResponsive(context),
          children: [
            /// Visit Type Radio Buttons
            CustomVisitTypeRadioButton(
              textStyle: TextStyle(
                fontSize: 16 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).onSurface,
              ),
              borderRadius: 8 * Responsive.getResponsive(context),
              height: 30 * Responsive.getHeight(context),
              borderColor: AppTheme.getColor(context).primary,
              options: visitTypes,
              selectedValue: selectedVisitType,
              onChanged: (value) {
                // Handle radio button change
              },
            ),

            // Customer to visit label
            CustomText(
              'Customer to visit',
              fontSize: 12 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w500,
              color: AppTheme.getColor(context).onSurface,
            ),

            /// Customer Dropdown
            CustomPopupDropdownStyled<String>(
              height: 0.06 * Responsive.getHeight(context),
              spacing: 10 * Responsive.getResponsive(context),
              prefix: SvgPicture.asset(AppAssets.personalcard),
              prefixImageHeight: 20 * Responsive.getResponsive(context),
              prefixImageWidth: 20 * Responsive.getResponsive(context),
              items: Customer,
              hintText: '  Select ',
              hintTextStyle: TextStyle(
                fontSize: 15 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              selectedItem: selectedleavetype,
              itemToString: (item) => item,
              onChanged: (value, index) {},
            ),

            /// Visit Date TextField
            LabeledTextField(
              textAlignment: TextAlign.start,
              label: 'Visit Date',
              hint: 'Select Date',
              hintTextStyle: TextStyle(
                fontSize: 15 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              widthFactor: Responsive.getWidth(context),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.getColor(context).primary,
                ),
                borderRadius: BorderRadius.circular(
                  10 * Responsive.getResponsive(context),
                ),
              ),
              prefix: SvgPicture.asset(
                AppAssets.note_favorite,
                fit: BoxFit.scaleDown,
              ),
              prefixImageHeight: 20 * Responsive.getHeight(context),
              prefixImageWidth: 20 * Responsive.getWidth(context),
            ),

            // Visit Slot Label
            CustomText(
              'Visit Slot',
              fontSize: 12 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
              color: AppTheme.getColor(context).onSurfaceVariant,
            ),

            /// Visit Slot Dropdown
            CustomPopupDropdownStyled<String>(
              height: 0.06 * Responsive.getHeight(context),
              spacing: 12 * Responsive.getResponsive(context),
              prefix: SvgPicture.asset(AppAssets.clock),
              prefixImageHeight: 20 * Responsive.getResponsive(context),
              prefixImageWidth: 20 * Responsive.getResponsive(context),
              items: VisitSlot,
              hintText: 'Select Slot',
              hintTextStyle: TextStyle(
                fontSize: 15 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              selectedItem: selectedleavetype,
              itemToString: (item) => item,
              onChanged: (value, index) {},
            ),

            // Visit Mode Radio Buttons
            CustomRadioButton(
              height: 0.05 * Responsive.getHeight(context),
              options: ["field visit", "virtual visit"],
              onChanged: (selected) {
                // Handle radio button change
              },
            ),

            // Visit Type Label
            CustomText(
              'Visit Type',
              fontSize: 12 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
              color: AppTheme.getColor(context).onSurfaceVariant,
            ),

            /// Visit Type Dropdown
            CustomPopupDropdownStyled<String>(
              height: 0.06 * Responsive.getHeight(context),
              spacing: 10 * Responsive.getResponsive(context),
              prefix: SvgPicture.asset(AppAssets.gps),
              items: VisitType,
              hintText: 'Select',
              hintTextStyle: TextStyle(
                fontSize: 15 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              selectedItem: selectedleavetype,
              itemToString: (item) => item,
              onChanged: (value, index) {
                // Handle dropdown change
              },
            ),

            // Visit Purpose Label
            CustomText(
              'Visit Purpose',
              fontSize: 12 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
              color: AppTheme.getColor(context).onSurfaceVariant,
            ),

            /// Visit Purpose Dropdown
            CustomPopupDropdownStyled<String>(
              height: 0.06 * Responsive.getHeight(context),
              spacing: 10 * Responsive.getResponsive(context),
              prefix: SvgPicture.asset(AppAssets.gps),
              items: VisitPurpose,
              hintText: 'Select',
              hintTextStyle: TextStyle(
                fontSize: 15 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              selectedItem: selectedleavetype,
              itemToString: (item) => item,
              onChanged: (value, index) {
                // Handle dropdown change
              },
            ),
            // Submit Button
            Padding(
              padding:
                  EdgeInsets.only(top: 60, right: 20, bottom: 12, left: 20) *
                      Responsive.getResponsive(context),
              child: MyCoButton(
                onTap: () {
                  // Handle form submission
                },
                title: 'SUBMIT',
                textStyle: TextStyle(
                  color: AppTheme.getColor(context).onPrimary,
                  fontSize: 18 * Responsive.getResponsive(context),
                  fontWeight: FontWeight.w600,
                ),
                isShadowBottomLeft: true,
                boarderRadius: 50 * Responsive.getResponsive(context),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
