import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/visit/presentation/pages/visit_template.dart';
import 'package:myco_flutter/features/visit/presentation/widgets/dashed_border_container.dart';
import 'package:myco_flutter/widgets/custom_calendar_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  final List<String> leavetype = ['Paid leave', 'Unpaid leave', 'Casual leave'];
  String? selectedleavetype;
  String selectedGender = '';
  bool selectedValue = true;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: CustomText(
        'Add Expense',
        fontWeight: FontWeight.w700,
        fontSize: 16 * getResponsiveText(context),
      ),
      leading: const BackButton(),
    ),
    body: Container(
      //      padding: EdgeInsets.symmetric(horizontal: 0.080 * getWidth(context)),
      padding: EdgeInsets.all(18),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16 * getResponsive(context),
          children: [
            LabeledTextField(
              label: 'Title',
              hint: 'Type here',
              widthFactor: getWidth(context),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.getColor(context).outline,
                ),
                borderRadius: BorderRadius.circular(
                  10 * getResponsive(context),
                ),
              ),

              prefix: SizedBox(
                height: 0.02 * getHeight(context),
                width: 0.05 * getWidth(context),
                child: SvgPicture.asset(
                  AppAssets.assetBookmark,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            LabeledTextField(
              label: 'Date Of Birth',
              hint: 'Select Date',
              widthFactor: getWidth(context),
              onClick: () async {
                await showModalBottomSheet<Map<String, int>>(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => CustomCalendarBottomSheet(
                    initialMonth: DateTime.now().month,
                    initialYear: DateTime.now().year,
                    previousYears: 5,
                    nextYears: 5,
                    showAllOption: true,
                  ),
                );
              },

              isReadOnly: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.getColor(context).outline,
                ),
                borderRadius: BorderRadius.circular(
                  10 * getResponsive(context),
                ),
              ),
              prefix: SizedBox(
                height: 0.02 * getHeight(context),
                width: 0.05 * getWidth(context),
                child: SvgPicture.asset(
                  AppAssets.assetNoteFavorite,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),

            CustomText(
              'Expense Type',
              fontWeight: FontWeight.w700,
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontSize: 16 * getResponsiveText(context),
            ),
            CustomPopupDropdownStyled<String>(
              items: leavetype,
              hintText: 'Select',
              prefix: SvgPicture.asset(
                AppAssets.assetCard_Edit,
                fit: BoxFit.scaleDown,
              ),
              hintTextStyle: TextStyle(
                fontSize: 18 * getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),

              // width: double.infinity,
              selectedItem: selectedleavetype,
              itemToString: (item) => item,
              onChanged: (value, index) {
                setState(() {
                  selectedleavetype = value;
                });
              },
              useRadioList: false,
              border: BoxBorder.all(color: AppTheme.getColor(context).outline),
            ),

            CustomText(
              'Site',
              fontWeight: FontWeight.w700,
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontSize: 16 * getResponsiveText(context),
            ),
            CustomPopupDropdownStyled<String>(
              items: leavetype,
              hintText: 'Select',
              prefix: SvgPicture.asset(
                AppAssets.assetGlobal,
                fit: BoxFit.scaleDown,
              ),
              hintTextStyle: TextStyle(
                fontSize: 18 * getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              border: BoxBorder.all(color: AppTheme.getColor(context).outline),

              // width: double.infinity,
              selectedItem: selectedleavetype,
              itemToString: (item) => item,
              onChanged: (value, index) {
                setState(() {
                  selectedleavetype = value;
                });
              },
              useRadioList: true,
            ),
            // LabeledTextField(
            //   label: 'Expense Type',
            //   hint: 'Select',
            //   widthFactor: getWidth(context),

            //   border: OutlineInputBorder(
            //     borderSide: BorderSide(
            //       color: AppTheme.getColor(context).outline,
            //     ),
            //     borderRadius: BorderRadius.circular(
            //       10 * getResponsive(context),
            //     ),
            //   ),
            //   prefix: SizedBox(
            //     height: 0.02 * getHeight(context),
            //     width: 0.05 * getWidth(context),
            //     child: SvgPicture.asset(
            //       AppAssets.assetCard_Edit,
            //       fit: BoxFit.scaleDown,
            //     ),
            //   ),
            // ),
            // LabeledTextField(
            //   label: 'Site',
            //   isSuffixIconOn: true,
            //   suffix: IconButton(
            //     color: Colors.black,
            //     onPressed: () {},
            //     icon: Icon(Icons.abc),
            //   ),
            //   hint: 'Select',
            //   widthFactor: getWidth(context),

            //   border: OutlineInputBorder(
            //     borderSide: BorderSide(
            //       color: AppTheme.getColor(context).outline,
            //     ),
            //     borderRadius: BorderRadius.circular(
            //       10 * getResponsive(context),
            //     ),
            //   ),
            //   isReadOnly: true,
            //   prefix: SizedBox(
            //     height: 0.02 * getHeight(context),
            //     width: 0.05 * getWidth(context),
            //     child: SvgPicture.asset(
            //       AppAssets.assetGlobal,
            //       fit: BoxFit.scaleDown,
            //     ),
            //   ),
            // ),
            LabeledTextField(
              label: 'Description',
              hint: 'Enter Description',
              widthFactor: getWidth(context),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.getColor(context).outline,
                ),
                borderRadius: BorderRadius.circular(
                  10 * getResponsive(context),
                ),
              ),
              textFieldHeight: 40,
              prefix: SvgPicture.asset(
                AppAssets.assetStickyNote,
                fit: BoxFit.scaleDown,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  'Attachment',
                  fontWeight: FontWeight.w700,
                  color: AppTheme.getColor(context).onSurfaceVariant,
                  fontSize: 16 * getResponsiveText(context),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.assetAddCircle,
                      fit: BoxFit.scaleDown,
                    ),

                    SizedBox(width: 0.01 * getWidth(context)),
                    CustomText(
                      'Add More',
                      fontSize: 16 * getResponsiveText(context),
                    ),
                  ],
                ),
              ],
            ),

            Container(
              width: double.infinity,
              color: AppTheme.getColor(context).surfaceContainer,
              height: 0.11 * getHeight(context),
              child: DashedBorderContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.assetBookmark_2,
                      fit: BoxFit.scaleDown,
                    ),

                    SizedBox(height: 0.010 * getHeight(context)),
                    CustomText(
                      'Select Attachment',
                      fontSize: 14 * getResponsive(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),

            CustomText(
              'Is GST Invoice?',
              fontWeight: FontWeight.w700,
              fontSize: 16 * getResponsiveText(context),
              color: AppTheme.getColor(context).onSurfaceVariant,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextRadioButton(
                  customDecoration: BoxDecoration(
                    color: selectedGender == 'Yes'
                        ? AppTheme.getColor(context).surfaceContainer
                        : AppTheme.getColor(context).onPrimary,
                    border: Border.all(
                      color: AppTheme.getColor(context).outline,
                    ),
                    borderRadius: BorderRadius.circular(
                      10 * getResponsive(context),
                    ),
                  ),
                  gender: 'Yes',
                  selectedGender: selectedGender,
                  onSelect: (val) {
                    setState(() {
                      selectedGender = val;
                    });
                  },
                  height: 44,
                  width: 155,
                ),

                CustomTextRadioButton(
                  customDecoration: BoxDecoration(
                    color: selectedGender == 'No'
                        ? AppTheme.getColor(context).surfaceContainer
                        : AppTheme.getColor(context).onPrimary,
                    border: Border.all(
                      color: AppTheme.getColor(context).outline,
                    ),
                    borderRadius: BorderRadius.circular(
                      10 * getResponsive(context),
                    ),
                  ),
                  gender: 'No',
                  selectedGender: selectedGender,
                  onSelect: (val) {
                    setState(() {
                      selectedGender = val;
                    });
                  },
                  height: 44,
                  width: 155,
                ),
              ],
            ),
            SizedBox(height: 0.02 * getHeight(context)),
            MyCoButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VisitTemplate(),
                  ),
                );
              },
              title: 'SUBMIT',
              boarderRadius: 30 * getResponsive(context),
              isShadowBottomLeft: true,
            ),
            SizedBox(height: 0.02 * getHeight(context)),
          ],
        ),
      ),
    ),
  );
}
