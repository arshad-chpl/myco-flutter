import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/my_visit_custom_radio_button.dart';
import 'package:myco_flutter/widgets/big_textfield.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_checkbox.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_radio_button.dart';

class AddNewVisit extends StatefulWidget {
  const AddNewVisit({super.key});

  @override
  State<AddNewVisit> createState() => _AddNewVisitState();
}

class _AddNewVisitState extends State<AddNewVisit> {
  String selectedVisitType = 'Self Visit';
  bool autoStartVisit = false;
  final TextEditingController _purposeController = TextEditingController();
  String? selectedCustomer;
  String? selectedSlot;
  DateTime? selectedDate;
  String selectedVisitMode = 'Field Visit';

  final List<String> visitTypes = [
    'Self Visit',
    'Add visit for other employee',
    'Visit With',
  ];

  final List<String> visitSlots = ['Morning', 'Afternoon', 'Evening'];
  final List<String> customers = ['Customer 1', 'Customer 2', 'Customer 3'];
  final List<String> leavetype = ['Paid leave', 'Unpaid leave', 'Casual leave'];
  String? selectedleavetype;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.backgroundPrimary,
    appBar: CustomAppbar(
      appBarText: 'Add New Visit',
      appBarBackgoundColor: Colors.white,
      appbartxtcolor: Colors.black,
      fontWeight: FontWeight.bold,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 30 * Responsive.getResponsive(context),
        ),
        onPressed: () => Navigator.pop(context),
      ),
    ),

    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          spacing: 15 * Responsive.getResponsive(context),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomVisitTypeRadioButton(
              height: 30 * Responsive.getResponsive(context),
              borderColor: AppTheme.getColor(context).primary,
              options: visitTypes,
              selectedValue: selectedVisitType,
              onChanged: (value) => setState(() => selectedVisitType = value),
            ),
            CustomText(
              'Customer to visit',
              fontSize: 12 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w500,
              color: AppTheme.getColor(context).primary,
            ),
            CustomPopupDropdownStyled<String>(
              height: 60 * Responsive.getResponsive(context),
              spacing: 10 * Responsive.getResponsive(context),
              prefix: SvgPicture.asset('assets/visit/personalcard.svg'),
              prefixImageHeight: 20 * Responsive.getResponsive(context),
              prefixImageWidth: 20 * Responsive.getResponsive(context),
              items: leavetype,
              hintText: '  Select ',
              selectedItem: selectedleavetype,
              itemToString: (item) => item,
              onChanged: (value, index) {
                setState(() {
                  selectedleavetype = value;
                });
              },
            ),
            LabeledTextField(
              heightFactor: 60 * Responsive.getResponsive(context),
              textAlignment: TextAlign.start,
              label: 'Visit Date',
              labelTextStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12 * Responsive.getResponsiveText(context),
                color: AppColors.gray,
              ),
              hint: 'Select Date',
              widthFactor: Responsive.getWidth(context),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.getColor(context).outline,
                ),
                borderRadius: BorderRadius.circular(
                  10 * Responsive.getResponsive(context),
                ),
              ),
              prefix: SvgPicture.asset(
                'assets/visit/note-favorite.svg',
                fit: BoxFit.scaleDown,
              ),
            ),

            CustomText(
              'Visit Slot',
              fontSize: 12 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
            CustomPopupDropdownStyled<String>(
              height: 60 * Responsive.getResponsive(context),
              spacing: 15 * Responsive.getResponsive(context),
              prefix: SvgPicture.asset('assets/visit/clock.svg'),
              items: leavetype,
              hintText: 'Select Slot',
              // width: double.infinity,
              selectedItem: selectedleavetype,
              itemToString: (item) => item,
              onChanged: (value, index) {
                setState(() {
                  selectedleavetype = value;
                });
              },
            ),
            Column(
              spacing: 10 * Responsive.getResponsive(context),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  'Visit Type',
                  fontSize: 12 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                Row(
                  spacing: 25 * Responsive.getResponsive(context),
                  children: [
                    CustomTextRadioButton(
                      gender: 'Field Visit',
                      selectedGender: selectedVisitMode,
                      onSelect: (value) {
                        setState(() {
                          selectedVisitMode = value;
                        });
                      },
                      height: 50,
                      width: 190 * Responsive.getResponsive(context),
                    ),
                    CustomTextRadioButton(
                      gender: 'Virtual Visit',
                      selectedGender: selectedVisitMode,
                      onSelect: (value) {
                        setState(() {
                          selectedVisitMode = value;
                        });
                      },
                      height: 50,
                      width: 190 * Responsive.getResponsive(context),
                    ),
                  ],
                ),
              ],
            ),

            Column(
              spacing: 3 * Responsive.getResponsive(context),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  'Purpose Of Visit',
                  fontSize: 12 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                BigMyCoTextField(
                  prefixImage: SvgPicture.asset('assets/visit/sticky_note.svg'),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppTheme.getColor(context).primary,
                    ),
                    borderRadius: BorderRadius.circular(
                      10 * Responsive.getResponsive(context),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              spacing: 10 * Responsive.getResponsive(context),
              children: [
                CustomCheckbox(
                  value: autoStartVisit,
                  onChanged: (value) => setState(() => autoStartVisit = value),
                  borderColor: AppColors.black,
                  activeColor: AppTheme.getColor(context).primary,
                  checkColor: Colors.white,
                  height: 20,
                  width: 20,
                  unCheckedBackground: Colors.white,
                ),
                Expanded(
                  child: Text(
                    'Please agree to automatically start the visit',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            MyCoButton(
              onTap: () {
                // Handle form submission
              },
              title: 'SUBMIT',
              textStyle: TextStyle(
                color: AppTheme.getColor(context).onPrimary,
                fontSize: 18 * Responsive.getResponsive(context),
              ),
              isShadowBottomLeft: true,
              boarderRadius: 50 * Responsive.getResponsive(context),
            ),
          ],
        ),
      ),
    ),
  );
}
