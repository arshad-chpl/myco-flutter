import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_radio_button.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/remark_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_media_picker_container.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  String? selectedExpenseType;
  String? selectedSiteType;

  String selectedGender = '';
  bool selectedValue = true;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(title: 'add_expense', isKey: true),
    body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
        VariableBag.screenHorizontalPadding *
            Responsive.getResponsive(context),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing:
          VariableBag.formContentSpacingVertical *
              Responsive.getResponsive(context),
          children: [
            // Text field for entering expense title
            NewTextField(
              isKey: true,
              label: 'title',
              hintText: LanguageManager().get('type_here'),
              prefixIconPath: AppAssets.assetBookmark,
            ),

            // Date picker for selecting Date of Birth
            NewTextField(
              isKey: true,
              label: 'date_of_birth',
              hintText: LanguageManager().get('select_date'),
              prefixIconPath: AppAssets.assetNoteFavorite,
              onTap: () {},
              enabled: false,
            ),

            // Dropdown for selecting expense type
            NewTextField(
              isKey: true,
              label: 'select_expense',
              prefixIconPath: AppAssets.assetCard_Edit,
              suffixIconPath: AppAssets.downArrow,
              hintText: LanguageManager().get('select'),
            ),

            // Dropdown for selecting site
            NewTextField(
              isKey: true,
              label: 'site',
              hintText: LanguageManager().get('select'),
              prefixIconPath: AppAssets.assetGlobal,
              suffixIconPath: AppAssets.downArrow,
            ),

            // Text area for entering a detailed description
            NewTextField(
              isKey: true,
              label: 'description',
              hintText: LanguageManager().get('enter_description'),
              prefixIconPath: AppAssets.assetStickyNote,
              maxLines: 5,
            ),

            // label for Attachment and Add More
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  'attachment',
                  fontWeight: FontWeight.w700,
                  color: AppTheme.getColor(context).onSurfaceVariant,
                  fontSize: 14 * Responsive.getResponsiveText(context),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.assetAddCircle,
                      fit: BoxFit.scaleDown,
                    ),

                    SizedBox(width: 0.01 * Responsive.getWidth(context)),

                    CustomText(
                      'add_more',
                      fontSize: 14 * Responsive.getResponsiveText(context),
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
                containerHeight: 0.115 * Responsive.getHeight(context),
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
            CustomRadioButton(
              options: const ['Yes', 'No'],
              onChanged: (_) {},
              height: 0.055 * Responsive.getHeight(context),
              title: 'Is GST Invoice',
            ),

            SizedBox(height: 0.05 * Responsive.getHeight(context)),

            //submit button
            MyCoButton(
              title: 'submit',
              boarderRadius:
              VariableBag.buttonBorderRadius *
                  Responsive.getResponsive(context),
              isShadowBottomLeft: true,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: false,
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