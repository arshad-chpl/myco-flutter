import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_radio_button.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/assign_to_visit.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/AutoStartVisitCheckboxRow.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_radio_button.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/AutoStartVisitCheckboxRow.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/my_visit_custom_radio_button.dart';
import 'package:myco_flutter/widgets/big_textfield.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_labeled_dropdown.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_labeled_dropdown.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

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
  String? selectedVisitSlot;
  String selectedVisitMode = 'field_visit'; // default

  final List<String> visitTypes = [
    'Self Visit',
    'Add visit for other employee',
    'Visit With',
  ];
  final TextEditingController customerController = TextEditingController();
  final TextEditingController visitDateController = TextEditingController();
  final List<String> customers = ['Customer 1', 'Customer 2', 'Customer 3'];
  final List<String> visitSlots = ['Morning', 'Afternoon', 'Evening'];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      title: LanguageManager().get('add_new_visit'),
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
              onChanged: (value) => (
                // handle radio button selection
              ),
            ),

            /// Customer to Visit dropdown
            NewTextField(
              label: LanguageManager().get('customer_to_visit'),
              prefixIconPath: AppAssets.personalcard,
              suffixIconPath: AppAssets.arrow_down,
              controller: customerController,
              hintText: LanguageManager().get('select'),
              onTap: ()  {
                // handle op tap
              },
            ),

            /// Visit Date text field
            NewTextField(
              label: LanguageManager().get('visit_date'),
              prefixIconPath: AppAssets.note_favorite,
              hintText: LanguageManager().get('select_date'),
              controller: visitDateController,
              onTap: () async {
                // show date picker
              },
            ),

            /// Visit Slot dropdown
            NewTextField(
              label: LanguageManager().get('visit_slots'),
              prefixIconPath: AppAssets.clock,
              suffixIconPath: AppAssets.arrow_down,
              hintText: LanguageManager().get('select_slot'),
              onTap: () async {
                // show modal, bottom sheet, or page
              },
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
                // handle radio button selection
              },
            ),

            /// Purpose of Visit (big text field)
            NewTextField(
              label: LanguageManager().get('purpose_of_visit'),
              prefixIconPath: AppAssets.sticky_note,
              hintText: LanguageManager().get('write_here'),
              maxLines: 10,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          AssignToVisit(), // replace with your target page widget
                    ),
                  );
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
