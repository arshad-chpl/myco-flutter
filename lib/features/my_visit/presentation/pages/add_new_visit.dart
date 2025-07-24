import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/auto_start_checkbox_row.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/field_virtual_visit_toggle.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/my_visit_custom_radio_button.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
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
  String selectedFieldVisit = 'Field Visit';
  bool isChecked = false;

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
  final TextEditingController visitSlotController = TextEditingController();
  final List<String> customers = ['Customer 1', 'Customer 2', 'Customer 3'];
  final List<String> visitSlots = ['Morning', 'Afternoon', 'Evening'];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      title: LanguageManager().get('add_new_visit'),
      appBarBackgoundColor: AppTheme.getColor(context).surface,
      leading: const BackButton(),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:
              VariableBag.screenHorizontalPadding *
              Responsive.getResponsive(context),
        ),
        child: Column(
          spacing:
              VariableBag.formContentSpacingVertical *
              Responsive.getResponsive(context),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Visit type radio buttons
            CustomVisitTypeRadioButton(
              textStyle: TextStyle(
                fontSize: 16 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).onSurface,
              ),
              borderRadius: 8 * Responsive.getResponsive(context),
              borderColor: AppTheme.getColor(context).primary,
              options: visitTypes,
              selectedValue: selectedVisitType,
              onChanged: (value) => (
                // handle radio button selection
              ),
            ),

            /// Customer to Visit dropdown
            NewTextField(
              label: 'customer_to_visit',
              isKey: true,
              prefixIconPath: AppAssets.personalcard,
              suffixIconPath: AppAssets.arrow_down,
              hintText: LanguageManager().get('select'),
              onTap: () {
                context.pop(context);
                context.pushNamed('customerPage');
              },
              controller: customerController,
            ),

            /// Visit Date text field
            NewTextField(
              label: 'visit_date',
              isKey: true,
              prefixIconPath: AppAssets.note_favorite,
              hintText: LanguageManager().get('select_date'),
              controller: visitDateController,
              onTap: () async {
                // show date picker
              },
            ),

            /// Visit Slot dropdown
            NewTextField(
              label: 'visit_slots',
              isKey: true,
              prefixIconPath: AppAssets.clock,
              suffixIconPath: AppAssets.arrow_down,
              hintText: LanguageManager().get('select_time_slot'),
              controller: visitSlotController,
              onTap: () async {
                // handle op tap
              },
            ),

            /// Visit Type label
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  LanguageManager().get('visit_type'),
                  fontSize: 12 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getColor(context).onSurface,
                ),
                FieldVirtualVisitToggle(
                  selectedValue: selectedFieldVisit,
                  onChanged: (v) => {
                    // handle toggle button
                  },
                ),
              ],
            ),

            /// Purpose of Visit
            NewTextField(
              label: 'purpose_of_visiting',
              isKey: true,
              prefixIconPath: AppAssets.sticky_note,
              hintText: LanguageManager().get('write_here'),
              maxLines: 2,
            ),

            /// Auto Start Visit checkbox
            AutoStartCheckboxRow(
              isChecked: isChecked,
              onChanged: (val) => {
                // handle checkbox change
              },
            ),

            /// Submit button
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 50 * Responsive.getResponsive(context),
              ),
              child: MyCoButton(
                onTap: () {},

                title: LanguageManager().get('submit'),
                textStyle: TextStyle(
                  color: AppTheme.getColor(context).onPrimary,
                  fontSize: 18 * Responsive.getResponsiveText(context),
                ),
                isShadowBottomLeft: true,
                boarderRadius:
                    VariableBag.buttonBorderRadius *
                    Responsive.getResponsive(context),
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    ),
  );
}
