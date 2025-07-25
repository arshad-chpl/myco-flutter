import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_media_picker_container.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

class TestNewVisit1 extends StatefulWidget {
  const TestNewVisit1({super.key});

  @override
  State<TestNewVisit1> createState() => _TestNewVisitState();
}

class _TestNewVisitState extends State<TestNewVisit1> {
  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left:
              VariableBag.bottomSheetLeftPadding *
              Responsive.getResponsive(context),
          right:
              VariableBag.bottomSheetRightPadding *
              Responsive.getResponsive(context),
          top:
              VariableBag.bottomSheetTopPadding *
              Responsive.getResponsive(context),
          bottom: bottomInset > 0
              ? bottomInset + 30
              : VariableBag.bottomSheetBottomPadding *
                    Responsive.getResponsive(context),
        ),
        child: SingleChildScrollView(
          child: Container(
            height: 0.60 * Responsive.getHeight(context),
            width: Responsive.getWidth(context),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Close Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      'Test New Visit',
                      fontWeight: FontWeight.w600,
                      fontSize: 16 * Responsive.getResponsiveText(context),
                    ),
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: SvgPicture.asset(
                        AppAssets.assetVector,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 0.017 * Responsive.getHeight(context)),

                // Dropdown for branch selection
                NewTextField(
                  isKey: true,
                  label: 'branch',
                  hintText: LanguageManager().get('select'),
                  prefixIconPath: AppAssets.assetData,
                  suffixIconPath: AppAssets.downArrow,
                ),

                SizedBox(height: 0.017 * Responsive.getHeight(context)),

                // Media Picker container
                CustomMediaPickerContainer(
                  title: 'Media',
                  titleColor: AppTheme.getColor(context).onSurfaceVariant,
                  titleFontSize: 15 * Responsive.getResponsiveText(context),
                  imageTitle: 'select_media',
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

                SizedBox(height: 0.017 * Responsive.getHeight(context)),

                // Text field for "Today's Work"
                NewTextField(
                  isKey: true,
                  label: 'Today Work',
                  hintText: LanguageManager().get('type_here'),
                  prefixIconPath: AppAssets.assetDocumentText,
                ),

                SizedBox(height: 0.05 * Responsive.getHeight(context)),

                // Submit button
                MyCoButton(
                  boarderRadius:
                      VariableBag.buttonBorderRadius *
                      Responsive.getResponsive(context),
                  isShadowBottomLeft: true,
                  onTap: () {
                    context.pop();
                  },
                  title: 'submit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
