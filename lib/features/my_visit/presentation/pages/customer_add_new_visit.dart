import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_radio_button.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/field_virtual_visit_toggle.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/my_visit_custom_radio_button.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_labeled_dropdown.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

class CustomerAddNewVisit extends StatefulWidget {
  const CustomerAddNewVisit({super.key});

  @override
  State<CustomerAddNewVisit> createState() => _CustomerAddNewVisitState();
}

class _CustomerAddNewVisitState extends State<CustomerAddNewVisit> {
  String selectedVisitType = 'Self Visit';
  String selectedFieldVisit = 'Field Visit';

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
      appBarBackgoundColor: AppTheme.getColor(context).surface,
      leading: const BackButton(),
    ),
    body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            VariableBag.screenHorizontalPadding *
            Responsive.getResponsive(context),
      ),
      child: SingleChildScrollView(
        child: Column(
          spacing:
              VariableBag.formContentSpacingVertical *
              Responsive.getResponsive(context),
          crossAxisAlignment: CrossAxisAlignment.start,
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
            NewTextField(
              label: 'customer_to_visit',
              isKey: true,
              prefixIconPath: AppAssets.personalcard,
              suffixIconPath: AppAssets.arrow_down,
              hintText: LanguageManager().get('select'),
              onTap: () {
                // handle op tap
              },
            ),

            /// Visit Date
            NewTextField(
              label: 'visit_date',
              isKey: true,
              prefixIconPath: AppAssets.note_favorite,
              hintText: LanguageManager().get('select_date'),
            ),

            /// Visit Slot
            NewTextField(
              label: 'visit_slots',
              isKey: true,
              prefixIconPath: AppAssets.clock,
              hintText: LanguageManager().get('select_time_slot'),
              suffixIconPath: AppAssets.arrow_down,
            ),

            /// Visit Mode Radio Buttons
            FieldVirtualVisitToggle(
              selectedValue: selectedFieldVisit,
              onChanged: (v) => {
                // handle toggle button
              },
            ),

            /// Visit Type
            NewTextField(
              label: 'visit_type',
              isKey: true,
              prefixIconPath: AppAssets.gps,
              hintText: LanguageManager().get('select'),
              suffixIconPath: AppAssets.arrow_down,
            ),

            /// Visit Purpose
            NewTextField(
              label: 'visit_purpose',
              prefixIconPath: AppAssets.gps,
              hintText: LanguageManager().get('select'),
              suffixIconPath: AppAssets.arrow_down,
              isKey: true,
            ),

            /// Submit Button
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 50 * Responsive.getResponsive(context),
              ),
              child: MyCoButton(
                onTap: () {
                  // submit logic
                },
                title: LanguageManager().get('submit'),
                textStyle: TextStyle(
                  color: AppTheme.getColor(context).onPrimary,
                  fontSize: 18 * Responsive.getResponsive(context),
                  fontWeight: FontWeight.w600,
                ),
                isShadowBottomLeft: true,
                boarderRadius:
                    VariableBag.buttonBorderRadius *
                    Responsive.getResponsive(context),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
