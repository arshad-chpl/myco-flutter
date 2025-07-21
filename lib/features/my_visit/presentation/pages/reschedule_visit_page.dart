import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/customer_page.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/auto_start_checkbox_row.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/custom_visit_type_radio_button.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/field_virtual_visit_toggle.dart';
import 'package:myco_flutter/widgets/big_textfield.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_media_picker_container.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

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
  final List<String> timeSlots = ['9:00 AM - 10:00 AM', '10:00 AM - 11:00 AM', '2:00 PM - 3:00 PM'];
  final List<String> visitPurposes = ['Sales', 'Support', 'Demo'];
  final List<String> rescheduleReasons = ['Client not available', 'Weather issue', 'Personal emergency'];


  String selectedVisitType = 'Self Visit';
  String? selectedCustomer;
  String? selectedTimeSlot;
  String? selectedVisitPurpose;
  String? selectedRescheduleReason;

  final TextEditingController amountController = TextEditingController();
  bool isChecked = false;

  @override
  @override
  Widget build(BuildContext context) {
    String selectedFieldVisit = 'Field Visit';

    return Scaffold(
      appBar: CustomAppbar(
        appBarBackgoundColor: AppTheme.getColor(context).surface,
        elevation: 0,
        centerTitle: false,
        leading: const BackButton(),
        title: 'reschedule_visit',
          isKey: true,
        
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 20 * Responsive.getResponsive(context),
          vertical: 12 * Responsive.getResponsive(context),
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

            // Customer to Visit
            CustomText(
              'customer_to_visit',
              isKey: true,
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 6 * Responsive.getResponsive(context)),


            //Select Customer *
            GestureDetector(
              onTap: () async {
                final selected = await Navigator.push<String>(
                  context,
                  MaterialPageRoute(builder: (_) => CustomerPage()),
                );
                if (selected != null) {
                  setState(() => selectedCustomer = selected);
                }
              },
              child: AbsorbPointer(
                child: CustomPopupDropdownStyled<String>(
                  items: const [],
                  hintText: selectedCustomer ?? 'Select Customer *',
                  prefix: SvgPicture.asset(AppAssets.personalcard, fit: BoxFit.scaleDown),
                  selectedItem: selectedCustomer,
                  itemToString: (item) => item,
                  spacing: 0.02 * Responsive.getWidth(context),
                  hintTextStyle: TextStyle(
                    fontSize: 16 * Responsive.getResponsiveText(context),
                    color: AppTheme.getColor(context).outline,
                    fontWeight: FontWeight.w600,
                  ),
                  border: Border.all(color: AppTheme.getColor(context).outline),
                ),
              ),
            ),
            SizedBox(height: 12 * Responsive.getResponsive(context)),

            // Visit Date
            LabeledTextField(
              label: 'Visit Date',
              hint: 'Select Date',
              hintTextStyle: TextStyle(color: AppTheme.getColor(context).outline),
              controller: amountController,
              widthFactor: Responsive.getWidth(context),
              textInputType: TextInputType.datetime,
              textAlignment: TextAlign.start,
              prefix: SvgPicture.asset(AppAssets.noteFavorite, fit: BoxFit.scaleDown),
              validator: (v) => v == null || v.isEmpty ? 'Please enter a date' : null,
            ),

            SizedBox(height: 12 * Responsive.getResponsive(context)),


            CustomText(
              'visit_slots',
              isKey: true,
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 6 * Responsive.getResponsive(context)),

            //Select Slot
            CustomPopupDropdownStyled<String>(
              items: timeSlots,
              hintText: 'Select Slot',
              prefix: SvgPicture.asset(AppAssets.clock, fit: BoxFit.scaleDown),
              selectedItem: selectedTimeSlot,
              onChanged: (v, i) => setState(() => selectedTimeSlot = v),
              itemToString: (item) => item,
              spacing: 0.02 * Responsive.getWidth(context),
              hintTextStyle: TextStyle(
                fontSize: 16 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
                fontWeight: FontWeight.w600,
              ),
              border: Border.all(color: AppTheme.getColor(context).outline),
            ),
            SizedBox(height: 12 * Responsive.getResponsive(context)),

            // Field / Virtual Visit
            FieldVirtualVisitToggle(
              selectedValue: selectedFieldVisit,
              onChanged: (v) => setState(() => selectedFieldVisit = v),
            ),
            SizedBox(height: 12 * Responsive.getResponsive(context)),

            // Visit Purpose
            CustomText(
              'visit_type',
              isKey: true,
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 6 * Responsive.getResponsive(context)),

            //Select Purpose
            CustomPopupDropdownStyled<String>(
              items: visitPurposes,
              hintText: 'Select Purpose',
              prefix: SvgPicture.asset(AppAssets.gps, fit: BoxFit.scaleDown),
              selectedItem: selectedVisitPurpose,
              onChanged: (v, i) => setState(() => selectedVisitPurpose = v),
              itemToString: (item) => item,
              spacing: 0.02 * Responsive.getWidth(context),
              hintTextStyle: TextStyle(
                fontSize: 16 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
                fontWeight: FontWeight.w600,
              ),
              border: Border.all(color: AppTheme.getColor(context).outline),
            ),
            SizedBox(height: 12 * Responsive.getResponsive(context)),

            // Reason Dropdown
            CustomText(
              'visit_purpose',
              isKey: true,
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 6 * Responsive.getResponsive(context)),

            //Select Reason
            CustomPopupDropdownStyled<String>(
              items: rescheduleReasons,
              hintText: 'Select Reason',
              prefix: SvgPicture.asset(AppAssets.gps, fit: BoxFit.scaleDown),
              selectedItem: selectedRescheduleReason,
              onChanged: (v, i) => setState(() => selectedRescheduleReason = v),
              itemToString: (item) => item,
              spacing: 0.02 * Responsive.getWidth(context),
              hintTextStyle: TextStyle(
                fontSize: 16 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
                fontWeight: FontWeight.w600,
              ),
              border: Border.all(color: AppTheme.getColor(context).outline),
            ),
            SizedBox(height: 12 * Responsive.getResponsive(context)),

            // Reason
            CustomText(
              'reason_for_reschedule',
              isKey: true,
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 8 * Responsive.getResponsive(context)),

            // Type here...
            BigMyCoTextField(
              controller: amountController,
              hintText: 'Type here...',
              prefixImage: SvgPicture.asset(
                AppAssets.stickynote,
                fit: BoxFit.scaleDown,
                height: 20 * Responsive.getResponsive(context),
                width: 20 * Responsive.getResponsive(context),
              ),
              maxLines: 5,
              height: 120 * Responsive.getResponsive(context),
              textInputType: TextInputType.multiline,
              validator: (v) => v == null || v.isEmpty ? 'Please enter a reason' : null,
              hintStyle: TextStyle(
                color: AppTheme.getColor(context).outline,
                fontSize: 16 * Responsive.getResponsiveText(context),
              ),
              style: TextStyle(
                fontSize: 16 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).primary,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(12 * Responsive.getResponsive(context)),
              ),
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
              onChanged: (val) => setState(() => isChecked = val),
            ),
            SizedBox(height: 16 * Responsive.getResponsive(context)),

            //Submit
            MyCoButton(
              title: 'Submit',
              onTap: () {},
              backgroundColor: AppColors.primary,
              textStyle: TextStyle(
                fontSize: 16 * Responsive.getResponsiveText(context),
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              width: double.infinity,
              isShadowBottomLeft: true,
              boarderRadius: 30,
            ),
          ],
        ),
      ),
    );
  }
}
