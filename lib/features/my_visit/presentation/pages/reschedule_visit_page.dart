import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/customer_page.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/auto_start_checkbox_row.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/custom_visit_type_radio_button.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/field_virtual_visit_toggle.dart';
import 'package:myco_flutter/widgets/big_textfield.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_labeled_dropdown.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';
import 'package:myco_flutter/widgets/media_picker/widgets/custom_media_picker_container.dart';

class RescheduleVisitPage extends StatefulWidget {
  const RescheduleVisitPage({super.key});

  @override
  State<RescheduleVisitPage> createState() => _RescheduleVisitPageState();
}

class _RescheduleVisitPageState extends State<RescheduleVisitPage> {
  final List<String> visitTypes = [
    'Self Visit',
    'Add visit for other employee',
    'Visit With',
  ];

  final List<String> customers = ['Customer A', 'Customer B', 'Customer C'];
  final List<String> timeSlots = [
    '9:00 AM - 10:00 AM',
    '10:00 AM - 11:00 AM',
    '2:00 PM - 3:00 PM',
  ];
  final List<String> visitPurposes = ['Sales', 'Support', 'Demo'];
  final List<String> rescheduleReasons = [
    'Client not available',
    'Weather issue',
    'Personal emergency',
  ];

  String selectedVisitType = 'Self Visit';
  String? selectedCustomer;
  String? selectedTimeSlot;
  String? selectedVisitPurpose;
  String? selectedRescheduleReason;

  final TextEditingController amountController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    String selectedFieldVisit = 'Field Visit';

    return Scaffold(
      appBar: const CustomAppbar(title: 'reschedule_visit', isKey: true),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 31 * Responsive.getResponsive(context),
          // vertical: 12 * Responsive.getResponsive(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Visit Type Radio Group
            CustomVisitTypeRadioButton(
              options: visitTypes,
              selectedValue: selectedVisitType,
              onChanged: (value) => setState(() => selectedVisitType = value),
              borderRadius: 12,
              activeColor: AppTheme.getColor(context).primary,
              borderColor: AppTheme.getColor(context).primary,
              textStyle: TextStyle(color: AppTheme.getColor(context).onSurface),
            ),
            SizedBox(height: 12 * Responsive.getResponsive(context)),

            //Select Customer *
            NewTextField(
              label: 'Customer',
              prefixIconPath: AppAssets.personalcard,
              suffixIconPath: AppAssets.arrow_down,
              hintText: selectedCustomer ?? 'Select Customer *',
              controller: TextEditingController(
                text: selectedCustomer ?? '',
              ),
              onTap: () async {
                final selected = await context.pushNamed<String>('customerPage');
                if (selected != null) {
                  setState(() => selectedCustomer = selected);
                }
              },
            ),

            SizedBox(height: 12 * Responsive.getResponsive(context)),

            // Visit Date
            NewTextField(
              label: 'Visit Date',
              prefixIconPath: AppAssets.calendar,
              hintText: 'Select Date',
              controller: amountController,
              keyboardType: TextInputType.datetime,
              validator: (v) =>
              v == null || v.isEmpty ? 'Please enter a date' : null,
              onTap: () async {
                // Example: show date picker
              },
            ),

            SizedBox(height: 12 * Responsive.getResponsive(context)),

            //Select Slot
            NewTextField(
              label: 'visit_slots',
              prefixIconPath: AppAssets.clock,
              suffixIconPath: AppAssets.arrow_down,
              hintText: selectedTimeSlot ?? 'Select Slot',
              controller: TextEditingController(
                text: selectedTimeSlot ?? '',
              ),
              onTap: ()  {
                // handle tap function
              },
            ),

            SizedBox(height: 12 * Responsive.getResponsive(context)),

            // Field / Virtual Visit
            FieldVirtualVisitToggle(
              selectedValue: selectedFieldVisit,
              onChanged: (v) => setState(() => selectedFieldVisit = v),
            ),
            SizedBox(height: 12 * Responsive.getResponsive(context)),
            //Select Purpose
            NewTextField(
              label: 'visit_type',
              prefixIconPath: AppAssets.gps,
              suffixIconPath: AppAssets.arrow_down,
              hintText: selectedVisitPurpose ?? 'Select Purpose',
              controller: TextEditingController(
                text: selectedVisitPurpose ?? '',
              ),
              onTap: ()  {
                // handle tap function
              },
            ),

            SizedBox(height: 12 * Responsive.getResponsive(context)),

            // Visit Purpose dropdown
            NewTextField(
              label: 'visit_purpose',
              prefixIconPath: AppAssets.gps,
              suffixIconPath: AppAssets.arrow_down,
              hintText: selectedRescheduleReason ?? 'Select Reason',
              controller: TextEditingController(
                text: selectedRescheduleReason ?? '',
              ),
              onTap: () {
                // handle on tap function
              },
            ),

            SizedBox(height: 12 * Responsive.getResponsive(context)),
            NewTextField(
              label: LanguageManager().get('purpose_of_visit'),
              prefixIconPath: AppAssets.sticky_note,
              hintText: LanguageManager().get('write_here'),
              maxLines: 10,
            ),
            SizedBox(height: 12 * Responsive.getResponsive(context)),

            const CustomMediaPickerContainer(
              title: 'Attachment *',
              imageTitle: 'Select Attachment',
              multipleImage: 1,
              imagePath: AppAssets.bookmark,
              isDocumentShow: true,
            ),

            SizedBox(height: 0.10 * Responsive.getHeight(context)),

            // Agreement + Submit
            AutoStartCheckboxRow(
              isChecked: isChecked,
              onChanged: (val) => {
                // handle checkbox change
              },
            ),
            SizedBox(height: 16 * Responsive.getResponsive(context)),

            //Submit
            MyCoButton(
              title: 'Submit',
              onTap: () {
                // handle submit button
              },
              backgroundColor: AppColors.primary,
              textStyle: TextStyle(
                fontSize: 16 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).onPrimary,
                fontWeight: FontWeight.w600,
              ),
              width: 1.2 * Responsive.getWidth(context),
              isShadowBottomLeft: true,
              boarderRadius: 30 * Responsive.getResponsive(context),
            ),
            SizedBox(height: 0.01 * Responsive.getHeight(context)),
          ],
        ),
      ),
    );
  }
}
