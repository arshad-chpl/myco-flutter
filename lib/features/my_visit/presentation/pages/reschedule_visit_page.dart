import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/employees/presentation/widgets/custom_appbar.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/customer_page.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/custom_visit_type_radio_button.dart';
import 'package:myco_flutter/widgets/big_textfield.dart';
import 'package:myco_flutter/widgets/custom_checkbox.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_media_picker_container.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_radio_button.dart';

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
  Widget build(BuildContext context) {
    final multiplier = Responsive.getResponsiveText(context);
    final theme = AppTheme.getColor(context);

    String selectedFieldVisit = 'Field Visit';

    return Scaffold(

      appBar: CustomAppbar(
        appBarBackgoundColor: theme.surface,
        elevation: 0,
        centerTitle: false,
        leading: const BackButton(),
        title: CustomText(
          'Reschedule Visit',
          fontSize: 24 * multiplier,
          fontWeight: FontWeight.w700,
          color: AppTheme.getColor(context).onSurface,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16 * Responsive.getResponsive(context),
          vertical: 12 * Responsive.getResponsive(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //Visit Type Radio Group
            CustomVisitTypeRadioButton(
              options: visitTypes,
              selectedValue: selectedVisitType,
              onChanged: (value) => setState(() => selectedVisitType = value),
              borderRadius: 12,
              activeColor: theme.primary,
              borderColor: theme.primary,
              textStyle: TextStyle(
                color: theme.onSurface
              ),
            ),
            SizedBox(height: 12 * Responsive.getResponsive(context)),

            //Customer to Visit
            CustomText(
              'Customer to Visit',
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 6 * Responsive.getResponsive(context)),
            GestureDetector(
              onTap: () async {
                final selected = await Navigator.push<String>(
                  context,
                  MaterialPageRoute(builder: (_) => CustomerPage()), // Navigate to your CustomerPage
                );

                if (selected != null) {
                  setState(() {
                    selectedCustomer = selected;
                  });
                }
              },
              child: AbsorbPointer(
                child: CustomPopupDropdownStyled<String>(
                  items: const [],
                  hintText: selectedCustomer ?? 'Select Customer *',
                  prefix: SvgPicture.asset(
                    'assets/visit/svgs/personalcard.svg',
                    fit: BoxFit.scaleDown,
                  ),
                  selectedItem: selectedCustomer,
                  itemToString: (item) => item,
                  spacing: 0.02 * Responsive.getWidth(context),
                  hintTextStyle: TextStyle(
                    fontSize: 16 * Responsive.getResponsiveText(context),
                    color: theme.outline,
                    fontWeight: FontWeight.w600,
                  ),
                  border: Border.all(color: theme.outline),
                ),
              ),
            ),

            SizedBox(height: 12 * Responsive.getResponsive(context)),

            //Visit Date
            LabeledTextField(
              label: 'Visit Date',
              hint: 'Select Date',
              hintTextStyle: TextStyle(color: theme.outline),
              controller: amountController,
              widthFactor: Responsive.getWidth(context),
              textInputType: TextInputType.datetime,
              textAlignment: TextAlign.start,
              prefix: SvgPicture.asset('assets/visit/svgs/note-favorite.svg', fit: BoxFit.scaleDown),
              validator: (v) => v == null || v.isEmpty ? 'Please enter a date' : null,
            ),
            SizedBox(height: 12 * Responsive.getResponsive(context)),

            //Visit Slots
            CustomText(
              'Visit Slots',
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 6 * Responsive.getResponsive(context)),
            CustomPopupDropdownStyled<String>(
              items: timeSlots,
              hintText: 'Select Slot',
              prefix: SvgPicture.asset('assets/visit/svgs/clock.svg', fit: BoxFit.scaleDown),
              selectedItem: selectedTimeSlot,
              onChanged: (v, i) => setState(() => selectedTimeSlot = v),
              itemToString: (item) => item,
              spacing: 0.02 * Responsive.getWidth(context),
              hintTextStyle: TextStyle(
                fontSize: 16 * Responsive.getResponsiveText(context),
                color: theme.outline,
                fontWeight: FontWeight.w600,
              ),
              border: Border.all(color: theme.outline),
            ),

            SizedBox(height: 12 * Responsive.getResponsive(context)),

            //Field / Virtual Visit
            Row(
              children: [
                Expanded(
                  child: CustomTextRadioButton(
                    gender: 'Field Visit',
                    selectedGender: selectedFieldVisit,
                    onSelect: (v) => setState(() => selectedFieldVisit = v),
                    height: 0.06 * Responsive.getHeight(context),
                    width: double.infinity,
                    customDecoration: BoxDecoration(
                      color: selectedFieldVisit == 'Field Visit'
                          ? AppTheme.getColor(context).surfaceContainer
                          : AppTheme.getColor(context).onPrimary,
                      border: Border.all(color: theme.outline),
                      borderRadius: BorderRadius.circular(10 * Responsive.getResponsive(context)),
                    ),
                  ),
                ),
                SizedBox(width: 12 * Responsive.getResponsive(context)),
                Expanded(
                  child: CustomTextRadioButton(
                    gender: 'Virtual Visit',
                    selectedGender: selectedFieldVisit,
                    onSelect: (v) => setState(() => selectedFieldVisit = v),
                    height: 0.06 * Responsive.getHeight(context),
                    width: double.infinity,
                    customDecoration: BoxDecoration(
                      color: selectedFieldVisit == 'Virtual Visit'
                          ? AppTheme.getColor(context).surfaceContainer
                          : AppTheme.getColor(context).onPrimary,
                      border: Border.all(color: theme.outline),
                      borderRadius: BorderRadius.circular(10 * Responsive.getResponsive(context)),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 12 * Responsive.getResponsive(context)),

            //Visit Purpose
            CustomText(
              'Visit Type',
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 6 * Responsive.getResponsive(context)),
            CustomPopupDropdownStyled<String>(
              items: visitPurposes,
              hintText: 'Select Purpose',
              prefix: SvgPicture.asset('assets/visit/svgs/gps.svg', fit: BoxFit.scaleDown),
              selectedItem: selectedVisitPurpose,
              onChanged: (v, i) => setState(() => selectedVisitPurpose = v),
              itemToString: (item) => item,
              spacing: 0.02 * Responsive.getWidth(context),
              hintTextStyle: TextStyle(
                fontSize: 16 * Responsive.getResponsiveText(context),
                color: theme.outline,
                fontWeight: FontWeight.w600,
              ),
              border: Border.all(color: theme.outline),
            ),

            SizedBox(height: 12 * Responsive.getResponsive(context)),

            //Reason for Reschedule (dropdown)
            CustomText(
              'Visit Purpose',
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 6 * Responsive.getResponsive(context)),
            CustomPopupDropdownStyled<String>(
              items: rescheduleReasons,
              hintText: 'Select Reason',
              prefix: SvgPicture.asset('assets/visit/svgs/gps.svg', fit: BoxFit.scaleDown),
              selectedItem: selectedRescheduleReason,
              onChanged: (v, i) => setState(() => selectedRescheduleReason = v),
              itemToString: (item) => item,
              spacing: 0.02 * Responsive.getWidth(context),
              hintTextStyle: TextStyle(
                fontSize: 16 * Responsive.getResponsiveText(context),
                color: theme.outline,
                fontWeight: FontWeight.w600,
              ),
              border: Border.all(color: theme.outline),
            ),

            SizedBox(height: 12 * Responsive.getResponsive(context)),

            //Reason for Reschedule
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  'Reason for Reschedule',
                  color: AppTheme.getColor(context).onSurfaceVariant,
                  fontSize: 14 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 8 * Responsive.getResponsive(context)),
                BigMyCoTextField(
                  controller: amountController,
                  hintText: 'Type here...',
                  prefixImage: SvgPicture.asset(
                    'assets/visit/svgs/stickynote.svg',
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
                    borderSide: const BorderSide(
                      color: AppColors.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(12 * Responsive.getResponsive(context)),
                  ),
                )

              ],
            ),
            SizedBox(height: 12 * Responsive.getResponsive(context)),
            const CustomMediaPickerContainer(
                title: 'Attachment *',
                imageTitle: 'Select Attachment',
                multipleImage: 1,
                imagePath: 'assets/visit/svgs/bookmark-2.png',
                isDocumentShow: true,
            ),
            SizedBox(height: 0.10 * Responsive.getHeight(context)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomCheckbox(
                      value: isChecked,
                      onChanged: (val) => setState(() => isChecked = val),
                      borderColor: AppTheme.getColor(context).primary,
                      activeColor: AppColors.primary,
                      checkColor: Colors.white,
                      height: 24 * Responsive.getResponsive(context),
                      width: 24 * Responsive.getResponsive(context),
                      unCheckedBackground: Colors.transparent,
                    ),
                    SizedBox(width: 10 * Responsive.getResponsive(context)),
                    CustomText(
                      'Please agree to automatically start the visit',
                      fontSize: 14 * Responsive.getResponsiveText(context),
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
                SizedBox(height: 16 * Responsive.getResponsive(context)),

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
            )

          ],
        ),
      ),

    );
  }
}
