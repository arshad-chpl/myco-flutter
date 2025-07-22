import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/presentation/text_controllers/takeover_controllers.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/assets_bottom_sheet.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/assets_label_text_field.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_media_picker_container.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class HandoverAssetsPage extends StatefulWidget {
  const HandoverAssetsPage({super.key});

  @override
  State<HandoverAssetsPage> createState() => _HandoverAssetsPageState();
}

class _HandoverAssetsPageState extends State<HandoverAssetsPage> {
  String? selectedConditionType;
  final _formKey = GlobalKey<FormState>();

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
      heading: 'Condition Type',
    );

    if (selected != null) {
      setState(() {
        selectedConditionType = selected;
      });
    }
  }

  final TakeoverAssetsControllers handoverController =
      TakeoverAssetsControllers();

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF6F7FB),
      appBar: const CustomAppbar(title: 'handover_assets', titleSpacing: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.04 * Responsive.getWidth(context),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AssetsTextFieldWidget(
                  label: 'handover_date',
                  hintText: 'select',
                  image: AppAssets.imageNoteFavorite,
                  controller: handoverController.takeoverDateController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Handover date is required';
                    }
                    return null;
                  },
                ),
                AssetsTextFieldWidget(
                  label: 'branch',
                  hintText: 'select',
                  image: AppAssets.lostFoundData,
                  controller: handoverController.branchController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Branch is required';
                    }
                    return null;
                  },
                ),
                AssetsTextFieldWidget(
                  label: 'departement',
                  hintText: 'select',
                  image: AppAssets.imageNoteFavorite,
                  controller: handoverController.departmentController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Department is required';
                    }
                    return null;
                  },
                ),
                AssetsTextFieldWidget(
                  label: 'custodian',
                  hintText: 'select',
                  image: AppAssets.assetsUserTick,
                  controller: handoverController.custodianController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Custodian is required';
                    }
                    return null;
                  },
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
                        SizedBox(width: 12 * Responsive.getResponsive(context)),
                        Expanded(
                          child: CustomText(
                            selectedConditionType ?? 'types',
                            color: selectedConditionType == null
                                ? AppColors.gray
                                : AppTheme.getColor(context).onSurface,
                            fontWeight: FontWeight.w600,
                            fontSize:
                                18 * Responsive.getResponsiveText(context),
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

                AssetsTextFieldWidget(
                  label: 'handover_remark',
                  hintText: 'type_here',
                  image: AppAssets.lostFoundMessageEdit,
                  controller: handoverController.handoverRemarkController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Handover remark is required';
                    }
                    return null;
                  },
                ),

                CustomMediaPickerContainer(
                  title: 'assets_image',
                  imagePath: AppAssets.imageGalleryExport,
                  imageTitle: 'attach_Image',
                  multipleImage: 1,
                  isCameraShow: true,
                  isGalleryShow: true,
                  titleColor: AppTheme.getColor(context).onSurfaceVariant,
                  titleFontSize: 14 * Responsive.getResponsiveText(context),
                  imageTitleSize: 16 * Responsive.getResponsiveText(context),
                  imageTitleColor: AppTheme.getColor(context).onSurfaceVariant,
                  backgroundColor: const Color(0xFFEEF7FD),
                  containerHeight: 0.1 * Responsive.getHeight(context),
                  pickerBoxBorderRadius: 10,
                  titleFontWeight: FontWeight.w700,
                  titleWidgetBetweenSpace:
                      0.006 * Responsive.getHeight(context),
                ),
                SizedBox(height: 0.035 * Responsive.getHeight(context)),

                //Submit button
                MyCoButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // All fields are valid
                      log("Form is valid. Proceed with submission.");
                    } else {
                      log("Form is invalid. Show errors.");
                    }
                  },
                  title: 'Submit',
                  isShadowBottomLeft: true,
                  boarderRadius: 50,
                  fontFamily: 'Gilroy-Bold',
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 0.024 * Responsive.getHeight(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
