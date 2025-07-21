import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_radio_button.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/remark_bottom_sheet.dart';
import 'package:myco_flutter/widgets/big_textfield.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_labeled_dropdown.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_media_picker_container.dart';
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
    appBar: CustomAppbar(title: 'Add Expense'),
    body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.0 * Responsive.getResponsive(context),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16 * Responsive.getResponsive(context),
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
                  8 * Responsive.getResponsive(context),
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
          // const Padding(
          //    padding: const EdgeInsets.all(1.0),
          //    child: const SelectAttachmentWidget(
          //      label: 'Select Attachment',
          //      iconPath: AppAssets.assetBookmark_2,
          //    ),
          //  ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: CustomMediaPickerContainer(
                title: '',
                titleColor: AppTheme.getColor(context).onSurfaceVariant,
                titleFontSize: 16 * Responsive.getResponsiveText(context),
                imageTitle: 'select_attachment',
                containerHeight: 90,
                multipleImage: 5,
                imagePath: 'assets/media_picker/gallery-export.png',
                backgroundColor: AppTheme.getColor(context).surfaceContainer,
                isCameraShow: true,
                isGalleryShow: true,
                isDocumentShow: true,
                isCropImage: true,
                imageTitleSize: 14 * Responsive.getResponsiveText(context),
                imageTitleColor: AppTheme.getColor(context).onSurfaceVariant,
              ),
            ),
            //Radio buttons to select if the invoice includes GST
            CustomRadioButton(options: const ['Yes', 'No'], onChanged: (_) {},height:44,width:155, title: 'Is GST Invoice',),

            SizedBox(height: 0.09 * Responsive.getHeight(context)),

            //submit button
            // MyCoButton(
            //   onTap: () {},
            //   title: 'SUBMIT',
            //   boarderRadius: 30 * Responsive.getResponsive(context),
            //   isShadowBottomLeft: true,
            // ),
            MyCoButton(
              title: 'SUBMIT',
              boarderRadius: 30 * Responsive.getResponsive(context),
              isShadowBottomLeft: true,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const RemarkBottomSheet(),
                );
              },
            ),

            SizedBox(height: 0.03 * Responsive.getHeight(context)),
          ],
        ),
      ),
    ),
  );
}
