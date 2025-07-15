import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_radio_button.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/AutoStartVisitCheckboxRow.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/my_visit_custom_radio_button.dart';
import 'package:myco_flutter/widgets/big_textfield.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_checkbox.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_labeled_dropdown.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_radio_button.dart';

class AddNewVisit extends StatefulWidget {
  const AddNewVisit({super.key});

  @override
  State<AddNewVisit> createState() => _AddNewVisitState();
}

class _AddNewVisitState extends State<AddNewVisit> {
  /// State variables for form data
  String selectedVisitType = 'Self Visit';
  bool autoStartVisit = false;
  String? selectedCustomer;
  String? selectedSlot;
  DateTime? selectedDate;
  String selectedVisitMode = 'Field Visit';

  final List<String> visitTypes = [
    'Self Visit',
    'Add visit for other employee',
    'Visit With',
  ];

  String selectedGender = '';
  bool selectedValue = true;

  final List<String> visitSlots = ['Morning', 'Afternoon', 'Evening'];
  final List<String> customers = ['Customer 1', 'Customer 2', 'Customer 3'];
  final List<String> leavetype = ['Paid leave', 'Unpaid leave', 'Casual leave'];
  String? selectedleavetype;

  @override
  Widget build(BuildContext context) => Scaffold(
    // Custom App Bar
    appBar: CustomAppbar(
      appBarText: 'Add New Visit',
      appbartxtcolor: AppTheme.getColor(context).onSurface,
      size: 16 * Responsive.getResponsiveText(context),
      appBarBackgoundColor: AppTheme.getColor(context).surface,
      leading: const BackButton(),
    ),

    body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 31.0 * Responsive.getResponsive(context),
      ),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16 * Responsive.getResponsive(context),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Visit Type Radio Buttons
            CustomVisitTypeRadioButton(
              textStyle: TextStyle(
                fontSize: 20 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).onSurface,
              ),
              borderRadius: 8 * Responsive.getResponsive(context),
              height: 30 * Responsive.getHeight(context),
              borderColor: AppTheme.getColor(context).primary,
              options: visitTypes,
              selectedValue: selectedVisitType,
              onChanged: (value) => setState(() => selectedVisitType = value),
            ),

            CustomText(
              'customer_to_visit',
              isKey: true,
              fontSize: 12 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w500,
              color: AppTheme.getColor(context).onSurface,
            ),
            // Customer Dropdown
            CustomPopupDropdownStyled<String>(
              height: 0.06 * Responsive.getHeight(context),
              spacing: 10 * Responsive.getResponsive(context),
              prefix: SvgPicture.asset(AppAssets.personalcard),
              prefixImageWidth: 20 * Responsive.getWidth(context),
              prefixImageHeight: 20 * Responsive.getHeight(context),
              items: leavetype,
              hintText: 'Select ',
              hintTextStyle: TextStyle(
                fontSize: 14 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              selectedItem: selectedleavetype,
              itemToString: (item) => item,
              onChanged: (value, index) {},
            ),

            /// Visit Date Input
            LabeledTextField(
              textAlignment: TextAlign.start,
              label: 'Visit Date',
              labelTextStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).onSurface,
              ),
              hint: 'Select Date',
              hintTextStyle: TextStyle(
                fontSize: 14 * Responsive.getResponsiveText(context),
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
            ),

            // Visit Slot Label
            CustomText(
              'visit_slots',
              isKey: true,
              fontSize: 12 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
              color: AppTheme.getColor(context).onSurface,
            ),

            ///Visit Slot Dropdown
            CustomPopupDropdownStyled<String>(
              height: 0.06 * Responsive.getHeight(context),
              spacing: 10 * Responsive.getResponsive(context),
              prefix: SvgPicture.asset(AppAssets.clock),
              prefixImageWidth: 20 * Responsive.getWidth(context),
              prefixImageHeight: 20 * Responsive.getHeight(context),
              items: leavetype,
              hintText: 'Select Slot',
              hintTextStyle: TextStyle(
                fontSize: 14 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              selectedItem: selectedleavetype,
              itemToString: (item) => item,
              onChanged: (value, index) {
                // Handle dropdown change
              },
            ),

            // Visit Type Label
            CustomText(
              'visit_type',
              isKey: true,
              fontSize: 12 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
              color: AppTheme.getColor(context).onSurface,
            ),

            // Visit Mode Radio Buttons
            CustomRadioButton(
              height: 0.05 * Responsive.getHeight(context),
              options: ['field visit', 'virtual visit'],
              onChanged: (selected) {
                // Handle radio button change
              },
            ),

            ///Purpose of Visit Label & TextField
            Column(
              spacing: 3 * Responsive.getResponsive(context),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  'Purpose Of Visit',
                  fontSize: 12 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w500,
                  color: AppTheme.getColor(context).onSurface,
                ),
                BigMyCoTextField(
                  textInputType: TextInputType.multiline,
                  prefixImage: SvgPicture.asset(AppAssets.sticky_note),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppTheme.getColor(context).onSurface,
                    ),
                    borderRadius: BorderRadius.circular(
                      10 * Responsive.getResponsive(context),
                    ),
                  ),
                ),
              ],
            ),

            /// Auto Start Visit Checkbox
            AutoStartVisitCheckboxRow(
              autoStartVisit: autoStartVisit,
              onChanged: (value) =>
                  setState(() => autoStartVisit = value ?? false),
            ),

            ///Submit Button
            Padding(
              padding: EdgeInsets.only(
                top: 0.05 * Responsive.getHeight(context),
              ),
              child: MyCoButton(
                onTap: () {
                  //  Handle form submission here
                },
                title: 'SUBMIT',
                textStyle: TextStyle(
                  color: AppTheme.getColor(context).onPrimary,
                  fontSize: 18 * Responsive.getResponsiveText(context),
                ),
                isShadowBottomLeft: true,
                boarderRadius: 50 * Responsive.getResponsive(context),
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    ),
  );
}
