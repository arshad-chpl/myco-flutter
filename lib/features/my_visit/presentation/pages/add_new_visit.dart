import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_radio_button.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/assign_to_visit.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/AutoStartVisitCheckboxRow.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/my_visit_custom_radio_button.dart';
import 'package:myco_flutter/widgets/big_textfield.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_labeled_dropdown.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AddNewVisit extends StatefulWidget {
  const AddNewVisit({super.key});

  @override
  State<AddNewVisit> createState() => _AddNewVisitState();
}

class _AddNewVisitState extends State<AddNewVisit> {
  String selectedVisitType = 'Self Visit';
  bool autoStartVisit = false;

  String? selectedCustomer;
  String? selectedVisitSlot;
  String selectedVisitMode = 'field_visit'; // default

  final List<String> visitTypes = [
    'Self Visit',
    'Add visit for other employee',
    'Visit With',
  ];

  final List<String> customers = ['Customer 1', 'Customer 2', 'Customer 3'];
  final List<String> visitSlots = ['Morning', 'Afternoon', 'Evening'];

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
      padding: EdgeInsets.symmetric(
        horizontal: 31.0 * Responsive.getResponsive(context),
      ),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16 * Responsive.getResponsive(context),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Visit type radio buttons
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
              onChanged: (value) =>(
              // handle radio button selection
              ), ),

            /// Customer to Visit dropdown
            LabeledDropdown<String>(
              label: LanguageManager().get('customer_to_visit'),
              items: customers,
              selectedItem: selectedCustomer,
              itemToString: (item) => item,
              onChanged: (value, index) {
                // handle dropdown selection
                  },
              hintText: LanguageManager().get('select'),
              hintTextStyle: TextStyle(
                fontSize: 14 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              height: 0.06 * Responsive.getHeight(context),
              spacing: 10 * Responsive.getResponsive(context),
              prefix: SvgPicture.asset(AppAssets.personalcard),
              prefixImageWidth: 20 * Responsive.getWidth(context),
              prefixImageHeight: 20 * Responsive.getHeight(context),
              suffix: SvgPicture.asset(AppAssets.arrow_down),
            ),

            /// Visit Date text field
            LabeledTextField(
              textAlignment: TextAlign.start,
              label: LanguageManager().get('visit_date'),
              hint: LanguageManager().get('select_date'),
              textFontSize: 12 * Responsive.getResponsiveText(context),
              textFontweight: FontWeight.w500,
              textColor: AppTheme.getColor(context).onSurface,
              hintTextStyle: TextStyle(
                fontSize: 14 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              widthFactor: 0.9 * Responsive.getWidth(context),
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

            /// Visit Slot dropdown
            LabeledDropdown<String>(
              label: LanguageManager().get('visit_slots'),
              items: visitSlots,
              selectedItem: selectedVisitSlot,
              itemToString: (item) => item,
              onChanged: (value, index) {
                // handle dropdown selection
              },
              hintText: LanguageManager().get('select_slot'),
              hintTextStyle: TextStyle(
                fontSize: 14 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              height: 0.06 * Responsive.getHeight(context),
              spacing: 10 * Responsive.getResponsive(context),
              prefix: SvgPicture.asset(AppAssets.clock),
              prefixImageWidth: 20 * Responsive.getWidth(context),
              prefixImageHeight: 20 * Responsive.getHeight(context),
              textFontSize: 12 * Responsive.getResponsiveText(context),
              textFontweight: FontWeight.w600,
              textColor: AppTheme.getColor(context).onSurface,
              suffix: SvgPicture.asset(AppAssets.arrow_down),
            ),

            /// Visit Type label
            CustomText(
              LanguageManager().get('visit_type'),
              fontSize: 12 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
              color: AppTheme.getColor(context).onSurface,
            ),

            /// Visit mode radio buttons
            CustomRadioButton(
              height: 0.05 * Responsive.getHeight(context),
              options: [
                LanguageManager().get('field_visit'),
                LanguageManager().get('virtual_visit'),
              ],
              onChanged: (selected) {
                setState(() => selectedVisitMode = selected);
              },
            ),

            /// Purpose of Visit (big text field)
            Column(
              spacing: 3 * Responsive.getResponsive(context),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  LanguageManager().get('purpose_of_visit'),
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

            /// Auto Start Visit checkbox
            AutoStartVisitCheckboxRow(
              autoStartVisit: autoStartVisit,
              onChanged: (value) {
                // handle change
              },
            ),


            /// Submit button
            Padding(
              padding: EdgeInsets.only(
                top: 0.05 * Responsive.getHeight(context),
              ),
              child: MyCoButton(
                onTap: () {
                  
                },
                title: LanguageManager().get('submit'),
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
