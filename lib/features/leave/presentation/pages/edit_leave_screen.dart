import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_media_picker_container.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class EditLeave extends StatefulWidget{
  const EditLeave({super.key});

  @override
  State<EditLeave> createState()=>_EditLeave ();
}

class _EditLeave extends State<EditLeave> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: CustomText(
          isKey: true,
          'apply_leave',
          fontSize: 22 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w700,
          color: AppTheme
              .getColor(context)
              .onSurface,
        ),
        titleSpacing: 0,
        leading: const BackButton(),
        // backgroundColor: const Color(0xFFF6F7FB),
      ),
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.04 * Responsive.getWidth(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomMediaPickerContainer(
              imagePath: AppAssets.imageGalleryExport,
              imageTitle: 'assets_image',
              multipleImage: 1,
              title: 'invoice',
              isCameraShow: true,
              isGalleryShow: true,
              isDocumentShow: true,
              titleColor: AppTheme.getColor(context).onSurfaceVariant,
              titleFontSize: 16 * Responsive.getResponsiveText(context),
              imageTitleSize: 18 * Responsive.getResponsiveText(context),
              imageTitleColor: AppTheme.getColor(context).onSurfaceVariant,
              backgroundColor: const Color(0xFFEEF7FD),
              containerHeight: 0.1 * Responsive.getHeight(context),
              pickerBoxBorderRadius: 10,
              titleFontWeight: FontWeight.w600,
              titleWidgetBetweenSpace: 0.006 * Responsive.getHeight(context),
            ),
            SizedBox(height: 0.035 * Responsive.getHeight(context)),

            //Submit button
            MyCoButton(
              onTap: () {},
              title: 'Update',
              isShadowBottomLeft: true,
              boarderRadius: 50,
              fontFamily: 'Gilroy-Bold',
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 0.024 * Responsive.getHeight(context)),
            ]
        )
      )
    ),
    );
}