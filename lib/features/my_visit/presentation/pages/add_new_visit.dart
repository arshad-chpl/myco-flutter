import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/my_visit_custom_radio_button.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';
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
    appBar: AppBar(
      title: const Text(
        'Add New Visit',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black, size: 35),
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          spacing: 15 * getResponsive(context),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomVisitTypeRadioButton(
              height: 30 * getResponsive(context),
              borderColor: AppTheme.getColor(context).primary,
              options: visitTypes,
              selectedValue: selectedVisitType,
              onChanged: (value) => setState(() => selectedVisitType = value),
            ),
            CustomText(
              'Customer to visit',
              fontSize: 14 * getResponsiveText(context),
              fontWeight: FontWeight.w500,
              color: AppColors.gray,
            ),
            CustomPopupDropdownStyled<String>(
              height: 60 * getResponsive(context),
              spacing: 15 * getResponsive(context),
              prefix: SvgPicture.asset('assets/visit/personalcard.svg'),
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
              label: 'Visit Date',
              hint: 'Select Date',
              widthFactor: getWidth(context),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.getColor(context).outline,
                ),
                borderRadius: BorderRadius.circular(
                  10 * getResponsive(context),
                ),
              ),
              prefix: SvgPicture.asset(
                'assets/visit/note-favorite.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
            CustomText(
              'Visit Slot',
              fontSize: 14 * getResponsiveText(context),
              fontWeight: FontWeight.w500,
              color: AppColors.gray,
            ),
            CustomPopupDropdownStyled<String>(
              height: 60 * getResponsive(context),
              spacing: 15 * getResponsive(context),
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
              spacing: 10 * getResponsive(context),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  'Visit Type',
                  fontSize: 12 * getResponsiveText(context),
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                Row(
                  spacing: 25 * getResponsive(context),
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
                      width: 190 * getResponsive(context),
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
                      width: 190 * getResponsive(context),
                    ),
                  ],
                ),
              ],
            ),
            CustomText(
              'Purpose Of Visit',
              fontSize: 14 * getResponsiveText(context),
              fontWeight: FontWeight.w500,
              color: AppColors.gray,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppTheme.getColor(context).outline),
                borderRadius: BorderRadius.circular(
                  12 * getResponsive(context),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 0.018 * getWidth(context),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 0.01 * getHeight(context),
                      left: 0.01 * getWidth(context),
                    ),
                    child: SvgPicture.asset('assets/visit/note.svg'),
                  ),
                  Expanded(
                    child: TextFormField(
                      maxLines: 5,
                      minLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Enter Description',
                        hintStyle: TextStyle(
                          color: AppTheme.getColor(context).outline,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Theme(
              data: Theme.of(
                context,
              ).copyWith(unselectedWidgetColor: Colors.grey.shade400),
              child: CheckboxListTile(
                value: autoStartVisit,
                onChanged: (value) =>
                    setState(() => autoStartVisit = value ?? false),
                title: Text(
                  'Please agree to automatically start the visit',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20 * getResponsiveText(context),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                activeColor: AppTheme.getColor(context).primary,
                checkColor: Colors.white,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
            ),

            MyCoButton(
              onTap: () {
                // Handle form submission
              },
              title: 'SUBMIT',
              textStyle: TextStyle(
                color: AppTheme.getColor(context).onPrimary,
                fontSize: 18 * getResponsive(context),
              ),
              isShadowBottomLeft: true,
              boarderRadius: 50 * getResponsive(context),
            ),
          ],
        ),
      ),
    ),
  );
}
