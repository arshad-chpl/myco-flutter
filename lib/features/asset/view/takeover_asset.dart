import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/controllers/takeover_controllers.dart';
import 'package:myco_flutter/features/asset/widgets/assets_bottom_sheet.dart';
import 'package:myco_flutter/features/asset/widgets/label_text_field.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_media_picker_container.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_radio_button.dart';

class TakeoverAssets extends StatefulWidget {
  const TakeoverAssets({super.key});

  @override
  State<TakeoverAssets> createState() => _TakeoverAssetsState();
}

class _TakeoverAssetsState extends State<TakeoverAssets> {
  String? selectedConditionType;
  String handoverSelected = 'YES';

  final List<String> conditionTypes = [
    'Good',
    'Fair',
    'Damaged',
    'Needs Repair',
  ];

  void _openConditionTypeBottomSheet() async {
    final selected = await showAssetsBottomSheet(
      context: context,
      dataList: conditionTypes,
      selectedBackgroundColor: const Color(0xFFEEF7FD),
      borderColor: AppTheme.getColor(context).primary,
      heading: 'Conditional Type',
    );

    if (selected != null) {
      setState(() {
        selectedConditionType = selected;
      });
    }
  }

  final TakeoverAssetsControllers takeoverController =
      TakeoverAssetsControllers();

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        title: CustomText(
          isKey: true,
          'takeover_assets',
          fontSize: 22 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w700,
        ),
        titleSpacing: 0,
        leading: const BackButton(),
        // backgroundColor: const Color(0xFFF6F7FB),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.04 * Responsive.getWidth(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelTextFieldWidget(
                      label: 'takeover_date',
                      hintText: 'select',
                      image: AppAssets.imageNoteFavorite,
                      controller: takeoverController.takeoverDateController,
                    ),
                    LabelTextFieldWidget(
                      label: 'takeover_remark',
                      hintText: 'type_here',
                      image: AppAssets.lostFoundMessageEdit,
                      controller: takeoverController.takeoverRemarkController,
                    ),

                    CustomMediaPickerContainer(
                      title: 'takeover_assets_image',
                      imagePath: AppAssets.imageGalleryExport,
                      imageTitle: 'attach_Image',
                      multipleImage: 5,
                      isCameraShow: true,
                      isGalleryShow: true,
                      titleColor: AppTheme.getColor(context).onSurfaceVariant,
                      titleFontSize: 16 * Responsive.getResponsiveText(context),
                      imageTitleSize:
                          18 * Responsive.getResponsiveText(context),
                      imageTitleColor: AppTheme.getColor(
                        context,
                      ).onSurfaceVariant,
                      backgroundColor: const Color(0xFFEEF7FD),
                      containerHeight: 0.1 * Responsive.getHeight(context),
                    ),
                    SizedBox(height: 0.024 * Responsive.getHeight(context)),

                    CustomText(
                      isKey: true,
                      'handover_asset_to_other_employee',
                      fontSize: 16 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getColor(context).onSurfaceVariant,
                    ),

                    SizedBox(height: 0.004 * Responsive.getHeight(context)),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextRadioButton(
                            gender: 'YES',
                            selectedGender: handoverSelected,
                            onSelect: (value) {
                              setState(() {
                                handoverSelected = value;
                              });
                            },
                            height: 0.055 * Responsive.getHeight(context),
                            width: 0.45 * Responsive.getWidth(context),
                            textStyle: TextStyle(
                              fontFamily: 'Gilroy-semiBold',
                              fontSize:
                                  16 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w600,
                              color: AppTheme.getColor(
                                context,
                              ).onSurfaceVariant,
                            ),
                            customDecoration: BoxDecoration(
                              border: Border.all(
                                color: AppTheme.getColor(context).outline,
                              ),
                              borderRadius: BorderRadius.circular(
                                10 * Responsive.getResponsive(context),
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 0.05 * Responsive.getWidth(context)),
                        Expanded(
                          child: CustomTextRadioButton(
                            gender: 'NO',
                            selectedGender: handoverSelected,
                            onSelect: (value) {
                              setState(() {
                                handoverSelected = value;
                              });
                            },
                            height: 0.055 * Responsive.getHeight(context),
                            width: 0.45 * Responsive.getWidth(context),
                            textStyle: TextStyle(
                              fontFamily: 'Gilroy-semiBold',
                              fontSize:
                                  16 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w600,
                              color: AppTheme.getColor(
                                context,
                              ).onSurfaceVariant,
                            ),
                            customDecoration: BoxDecoration(
                              border: Border.all(
                                color: AppTheme.getColor(context).outline,
                              ),
                              borderRadius: BorderRadius.circular(
                                10 * Responsive.getResponsive(context),
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (handoverSelected == 'YES') ...[
                      SizedBox(height: 0.02 * Responsive.getHeight(context)),

                      LabelTextFieldWidget(
                        label: 'handover_date',
                        hintText: 'select',
                        image: AppAssets.imageNoteFavorite,
                        controller: takeoverController.handoverDateController,
                      ),
                      LabelTextFieldWidget(
                        label: 'branch',
                        hintText: 'select',
                        image: AppAssets.lostFoundData,
                        controller: takeoverController.branchController,
                      ),
                      LabelTextFieldWidget(
                        label: 'departement',
                        hintText: 'select',
                        image: AppAssets.imageNoteFavorite,
                        controller: takeoverController.departmentController,
                      ),
                      LabelTextFieldWidget(
                        label: 'custodian',
                        hintText: 'select',
                        image: AppAssets.assetsUserTick,
                        controller: takeoverController.custodianController,
                      ),

                      CustomText(
                        'condition_type',
                        fontSize: 16 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.w600,
                        color: AppTheme.getColor(context).onSurfaceVariant,
                      ),
                      SizedBox(height: 0.002 * Responsive.getHeight(context)),
                      GestureDetector(
                        onTap: _openConditionTypeBottomSheet,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 14 * Responsive.getResponsive(context),
                            horizontal: 12 * Responsive.getResponsive(context),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(
                              12 * Responsive.getResponsive(context),
                            ),
                            border: Border.all(
                              color: selectedConditionType != null
                                  ? AppTheme.getColor(context).primary
                                  : AppTheme.getColor(context).outline,
                              width: 0.002 * Responsive.getWidth(context),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                AppAssets.assetsElementEqual,
                                height: 0.06 * Responsive.getWidth(context),
                                fit: BoxFit.contain,
                              ),

                              SizedBox(
                                width: 12 * Responsive.getResponsive(context),
                              ),
                              Expanded(
                                child: CustomText(
                                  isKey: true,
                                  selectedConditionType ?? 'type',
                                  color: selectedConditionType == null
                                      ? AppColors.gray
                                      : AppTheme.getColor(context).onSurface,
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      18 *
                                      Responsive.getResponsiveText(context),
                                ),
                              ),
                              Icon(
                                CupertinoIcons.chevron_down,
                                color: AppTheme.getColor(context).primary,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 0.024 * Responsive.getHeight(context)),

                      LabelTextFieldWidget(
                        label: 'handover_remark',
                        hintText: 'type_here',
                        image: AppAssets.lostFoundMessageEdit,
                        controller: takeoverController.handoverRemarkController,
                      ),

                      CustomMediaPickerContainer(
                        title: 'assets_image',
                        imagePath: AppAssets.imageGalleryExport,
                        imageTitle: 'attach_Image',
                        multipleImage: 1,
                        isCameraShow: true,
                        isGalleryShow: true,
                        titleColor: AppTheme.getColor(context).onSurfaceVariant,
                        titleFontSize:
                            16 * Responsive.getResponsiveText(context),
                        imageTitleSize:
                            18 * Responsive.getResponsiveText(context),
                        imageTitleColor: AppTheme.getColor(
                          context,
                        ).onSurfaceVariant,
                        backgroundColor: const Color(0xFFEEF7FD),
                        containerHeight: 0.1 * Responsive.getHeight(context),
                      ),
                      SizedBox(height: 0.035 * Responsive.getHeight(context)),
                    ],
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 0.015 * Responsive.getHeight(context)),

          //Submit button
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.04 * Responsive.getWidth(context),
            ),
            child: MyCoButton(
              onTap: () {},
              title: 'Submit',
              isShadowBottomLeft: true,
              boarderRadius: 50,
              fontFamily: 'Gilroy-Bold',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 0.024 * Responsive.getHeight(context)),
        ],
      ),
    );
  }
}
