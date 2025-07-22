import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_radio_button.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/my_visit_custom_radio_button.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_labeled_dropdown.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class CustomerAddNewVisit extends StatefulWidget {
  const CustomerAddNewVisit({super.key});

  @override
  State<CustomerAddNewVisit> createState() => _CustomerAddNewVisitState();
}

class _CustomerAddNewVisitState extends State<CustomerAddNewVisit> {
  String selectedVisitType = 'Self Visit';

  // Dropdown options
  final List<String> customerList = ['Customer 1', 'Customer 2', 'Customer 3'];
  final List<String> visitSlotList = ['Morning', 'Afternoon', 'Evening'];
  final List<String> visitTypeList = ['Field Visit', 'Virtual Visit'];
  final List<String> visitPurposeList = ['Purpose 1', 'Purpose 2', 'Purpose 3'];

  // Radio button options
  final List<String> visitTypes = [
    'Self Visit',
    'Add visit for other employee',
    'Visit With',
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: CustomAppbar(
        title: LanguageManager().get('add_new_visit'),
        // appbartxtcolor: AppTheme.getColor(context).onSurface,
        // size: 16 * Responsive.getResponsiveText(context),
        appBarBackgoundColor: AppTheme.getColor(context).surface,
        leading: const BackButton(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 31 * Responsive.getResponsive(context)),
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
                  // handle radio change
                },
              ),

              /// Customer to visit
              LabeledDropdown<String>(
                label: LanguageManager().get('customer_to_visit'),
                items: customerList,
                selectedItem: null,
                itemToString: (item) => item,
                hintText: LanguageManager().get('selec'),
                prefix: SvgPicture.asset(AppAssets.personalcard),
                prefixImageHeight: 20 * Responsive.getResponsive(context),
                prefixImageWidth: 20 * Responsive.getResponsive(context),
                spacing: 10 * Responsive.getResponsive(context),
                height: 0.06 * Responsive.getHeight(context),
                hintTextStyle: TextStyle(
                  fontSize: 15 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).outline,
                ),
                onChanged: (value, index) {
                  // handle dropdown change
                },
              ),

              /// Visit Date
              LabeledTextField(
                label: LanguageManager().get('visit_date'),
                hint: LanguageManager().get('select_date'),
                widthFactor: Responsive.getWidth(context),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.getColor(context).primary),
                  borderRadius: BorderRadius.circular(10 * Responsive.getResponsive(context)),
                ),
                prefix: SvgPicture.asset(AppAssets.note_favorite, fit: BoxFit.scaleDown),
                prefixImageHeight: 20 * Responsive.getHeight(context),
                prefixImageWidth: 20 * Responsive.getWidth(context),
                hintTextStyle: TextStyle(
                  fontSize: 15 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).outline,
                ),
              ),

              /// Visit Slot
              LabeledDropdown<String>(
                label: LanguageManager().get('visit_slots'),
                items: visitSlotList,
                selectedItem: null,
                itemToString: (item) => item,
                hintText: LanguageManager().get('select_time_slot'),
                prefix: SvgPicture.asset(AppAssets.clock),
                prefixImageHeight: 20 * Responsive.getResponsive(context),
                prefixImageWidth: 20 * Responsive.getResponsive(context),
                spacing: 12 * Responsive.getResponsive(context),
                height: 0.06 * Responsive.getHeight(context),
                hintTextStyle: TextStyle(
                  fontSize: 15 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).outline,
                ),
                onChanged: (value, index) {
                  // handle dropdown change
                },
              ),

              /// Visit Mode Radio Buttons
              CustomRadioButton(
                height: 0.05 * Responsive.getHeight(context),
                options: ['Field Visit', 'Virtual Visit'],
                onChanged: (selected) {
                  // handle radio button change
                },
              ),

              /// Visit Type
              LabeledDropdown<String>(
                label: LanguageManager().get('visit_type'),
                items: visitTypeList,
                selectedItem: null,
                itemToString: (item) => item,
                hintText: LanguageManager().get('select'),
                prefix: SvgPicture.asset(AppAssets.gps),
                prefixImageHeight: 20 * Responsive.getResponsive(context),
                prefixImageWidth: 20 * Responsive.getResponsive(context),
                spacing: 10 * Responsive.getResponsive(context),
                height: 0.06 * Responsive.getHeight(context),
                hintTextStyle: TextStyle(
                  fontSize: 15 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).outline,
                ),
                onChanged: (value, index) {
                  // handle dropdown change
                },
              ),

              /// Visit Purpose
              LabeledDropdown<String>(
                label: LanguageManager().get('visit_purpose'),
                items: visitPurposeList,
                selectedItem: null,
                itemToString: (item) => item,
                hintText: LanguageManager().get('select'),
                prefix: SvgPicture.asset(AppAssets.gps),
                prefixImageHeight: 20 * Responsive.getResponsive(context),
                prefixImageWidth: 20 * Responsive.getResponsive(context),
                spacing: 10 * Responsive.getResponsive(context),
                height: 0.06 * Responsive.getHeight(context),
                hintTextStyle: TextStyle(
                  fontSize: 15 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).outline,
                ),
                onChanged: (value, index) {
                  // handle dropdown change
                },
              ),

              /// Submit Button
              Padding(
                padding: EdgeInsets.only(top: 60, right: 20, bottom: 12, left: 20) *
                    Responsive.getResponsive(context),
                child: MyCoButton(
                  onTap: () {

                  },
                  title: LanguageManager().get('submit'),
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
