import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/select_attachment_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/yes_or_no_button_widget.dart';
import 'package:myco_flutter/widgets/big_textfield.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_labeled_dropdown.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

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
    appBar: CustomAppbar(title: 'Add Expense',),
    body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.0 * Responsive.getResponsive(context),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 14 * Responsive.getResponsive(context),
          children: [
            // Text field for entering expense title
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

            // Date picker for selecting Date of Birth
            LabeledTextField(
              textAlignment: TextAlign.start,
              label: 'Date Of Birth',
              hint: 'Select Date',
              widthFactor: Responsive.getWidth(context),
              isSuffixIconOn: true,
              onClick: () {},
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

            // Dropdown for selecting expense type
            LabeledDropdown(
              label: 'Expense Type',
              items: expenseTypes,
              width: Responsive.getWidth(context),
              hintText: 'Select',
              border: BoxBorder.all(color: AppTheme.getColor(context).outline),
              prefix: SvgPicture.asset(
                AppAssets.assetCard_Edit,
                fit: BoxFit.scaleDown,
              ),
              itemToString: (item) => item,
              selectedItem: selectedExpenseType,
              onChanged: (value, index) {},
            ),

            // Dropdown for selecting site
            LabeledDropdown(
              label: 'Site',
              items: siteList,
              width: Responsive.getWidth(context),
              hintText: 'Select',
              border: BoxBorder.all(color: AppTheme.getColor(context).outline),
              prefix: SvgPicture.asset(
                AppAssets.assetGlobal,
                fit: BoxFit.scaleDown,
              ),
              itemToString: (item) => item,
              useRadioList: true,
              selectedItem: selectedSiteType,
              onChanged: (value, index) {},
            ),

            //label bigtextfield for enter description
            CustomText(
              'Description',
              fontSize: 14 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontWeight: FontWeight.w700,
            ),

            // Text area for entering a detailed description
            BigMyCoTextField(
              hintText: 'Enter Description',
              hintStyle: TextStyle(
                color: AppTheme.getColor(context).outline,
                fontWeight: FontWeight.w600,
              ),
              prefixImage: SvgPicture.asset(
                AppAssets.assetStickyNote,
                fit: BoxFit.scaleDown,
              ),
            ),

            // label for Attachment and Add More
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

            //widget for upload or attach files (images, documents)
            const SelectAttachmentWidget(
              label: 'Select Attachment',
              iconPath: AppAssets.assetBookmark_2,
            ),

            // label for select if the invoice includes GST
            CustomText(
              'Is GST Invoice?',
              fontWeight: FontWeight.w700,
              fontSize: 16 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).onSurfaceVariant,
            ),

            //Radio buttons to select if the invoice includes GST
            YesOrNoButtonWidget(initialGender: 'Yes', onChanged: (val) {}),

            SizedBox(height: 0.09 * Responsive.getHeight(context)),

            //submit button
            MyCoButton(
              onTap: () {
                //use below code to open bottom sheet
                // showModalBottomSheet(
                //   context: context,
                //   isScrollControlled: true,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.vertical(
                //       top: Radius.circular(
                //         16 * Responsive.getResponsive(context),
                //       ),
                //     ),
                //   ),
                //   //builder: (context) => const VisitTemplate(),
                //   builder: (context) => const RemarkBottomSheet(),
                // );
              },
              title: 'SUBMIT',
              boarderRadius: 30 * Responsive.getResponsive(context),
              isShadowBottomLeft: true,
            ),
            SizedBox(height: 0.03 * Responsive.getHeight(context)),
          ],
        ),
      ),
    ),
  );
}
