import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/visit_template.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/dashed_border_container.dart';
import 'package:myco_flutter/features/employees/presentation/widgets/custom_appbar.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_image_picker_container/dashed_border_container.dart';
import 'package:myco_flutter/widgets/big_textfield.dart';
import 'package:myco_flutter/widgets/custom_calendar_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/media_picker.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_radio_button.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  final List<String> expenseTypes = [
    'Travel',
    'Food',
    'Accommodation',
    'Office Supplies',
    'Entertainment',
    'Miscellaneous',
    'Fuel',
    'Internet',
    'Medical',
    'Training',
  ];

  final List<String> siteList = [
    'Head Office',
    'Site A - Mumbai',
    'Site B - Delhi',
    'Warehouse - Bangalore',
    'Client Location - Pune',
    'Remote Site',
  ];

  String? selectedExpenseType;
  String? selectedSiteType;

  String selectedGender = '';
  bool selectedValue = true;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: CustomText(
        'Add Expense',
        fontWeight: FontWeight.w700,
        fontSize: 16 * Responsive.getResponsiveText(context),
      ),
      leading: const BackButton(),
    ),
    body: Container(
      //      padding: EdgeInsets.symmetric(horizontal: 0.080 * Responsive.getWidth(context)),
      padding: EdgeInsets.all(22),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10 * Responsive.getResponsive(context),
          children: [
            LabeledTextField(
              textAlignment: TextAlign.start,
              label: 'Title',
              hint: 'Type here',
              isSuffixIconOn: false,
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
                AppAssets.assetBookmark,
                fit: BoxFit.scaleDown,
              ),
            ),
            LabeledTextField(
              textAlignment: TextAlign.start,
              label: 'Date Of Birth',
              hint: 'Select Date',
              widthFactor: Responsive.getWidth(context),
              isSuffixIconOn: true,
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
                  10 * Responsive.getResponsive(context),
                ),
              ),
              prefix: SvgPicture.asset(
                AppAssets.assetNoteFavorite,
                fit: BoxFit.scaleDown,
              ),
            ),

            CustomText(
              'Expense Type',
              fontWeight: FontWeight.w700,
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontSize: 16 * Responsive.getResponsiveText(context),
            ),
            CustomPopupDropdownStyled<String>(
              items: expenseTypes,
              hintText: 'Select',
              height: 0.07 * Responsive.getHeight(context),
              prefix: SvgPicture.asset(
                AppAssets.assetCard_Edit,
                fit: BoxFit.scaleDown,
              ),
              hintTextStyle: TextStyle(
                fontSize: 18 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
                fontWeight: FontWeight.w600,
              ),
              spacing: 0.02 * Responsive.getWidth(context),
              // width: double.infinity,
              selectedItem: selectedExpenseType,
              itemToString: (item) => item,
              onChanged: (value, index) {
                setState(() {
                  selectedExpenseType = value;
                });
              },
              useRadioList: false,
              border: BoxBorder.all(color: AppTheme.getColor(context).outline),
            ),

            CustomText(
              'Site',
              fontWeight: FontWeight.w700,
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontSize: 16 * Responsive.getResponsiveText(context),
            ),
            CustomPopupDropdownStyled<String>(
              items: siteList,
              hintText: 'Select',
              spacing: 0.02 * Responsive.getWidth(context),
              height: 0.07 * Responsive.getHeight(context),
              prefix: SvgPicture.asset(
                AppAssets.assetGlobal,
                fit: BoxFit.scaleDown,
              ),
              hintTextStyle: TextStyle(
                fontSize: 18 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
                fontWeight: FontWeight.w600,
              ),
              border: BoxBorder.all(color: AppTheme.getColor(context).outline),

                selectedItem: selectedSiteType,
                itemToString: (item) => item,
                onChanged: (value, index) {
                  setState(() {
                    selectedSiteType = value;
                  });
                },
                useRadioList: true,
              ),

            CustomText(
              'Description',
              fontSize: 16 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontWeight: FontWeight.w700,
            ),
            BigMyCoTextField(
              hintText: 'Enter Description',

              hintStyle: TextStyle(
                fontSize: 18 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
                fontWeight: FontWeight.w600,
              ),

              prefixImage: SvgPicture.asset(
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
                  fontSize: 16 * Responsive.getResponsiveText(context),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.assetAddCircle,
                      fit: BoxFit.scaleDown,
                    ),

                    SizedBox(width: 0.01 * Responsive.getWidth(context)),
                    CustomText(
                      'Add More',
                      fontSize: 16 * Responsive.getResponsiveText(context),
                    ),
                  ],
                ),
              ],
            ),

            Container(
              width: double.infinity,
              color: AppTheme.getColor(context).surfaceContainer,
              height: 0.11 * Responsive.getHeight(context),
              child: DashedBorderContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        showMediaFilePicker(
                          isDialog: false,
                          isCameraShow: true,
                          isGalleryShow: true,
                          isDocumentShow: true,
                          context: context,
                        );
                      },
                      child: SvgPicture.asset(
                        AppAssets.assetBookmark_2,
                        fit: BoxFit.scaleDown,
                      ),
                    ),

                    SizedBox(height: 0.010 * Responsive.getHeight(context)),

                    CustomText(
                      'Select Attachment',
                      fontSize: 14 * Responsive.getResponsive(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),

            CustomText(
              'Is GST Invoice?',
              fontWeight: FontWeight.w700,
              fontSize: 16 * Responsive.getResponsiveText(context),
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
                      10 * Responsive.getResponsive(context),
                    ),
                  ),
                  gender: 'Yes',
                  selectedGender: selectedGender,
                  onSelect: (val) {
                    setState(() {
                      selectedGender = val;
                    });
                  },
                  height: 0.07 * Responsive.getHeight(context),
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
                      10 * Responsive.getResponsive(context),
                    ),
                  ),
                  gender: 'No',
                  selectedGender: selectedGender,
                  onSelect: (val) {
                    setState(() {
                      selectedGender = val;
                    });
                  },
                  height: 0.07 * Responsive.getHeight(context),
                  width: 155,
                ),
              ],
            ),
            SizedBox(height: 0.09 * Responsive.getHeight(context)),
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
              boarderRadius: 30 * Responsive.getResponsive(context),
              isShadowBottomLeft: true,
            ),
            SizedBox(height: 0.02 * Responsive.getHeight(context)),
          ],
        ),
      ),
    ),
  );
}
