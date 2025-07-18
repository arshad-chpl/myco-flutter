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

class HandoverAssetsPage extends StatefulWidget {
  const HandoverAssetsPage({super.key});

  @override
  State<HandoverAssetsPage> createState() => _HandoverAssetsPageState();
}

class _HandoverAssetsPageState extends State<HandoverAssetsPage> {
  String? selectedConditionType;

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
      appBar: AppBar(
        title: CustomText(
          isKey: true,
          'handover_assets',
          fontSize: 22 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w700,
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
              LabelTextFieldWidget(
                label: 'handover_date',
                hintText: 'select',
                image: AppAssets.imageNoteFavorite,
                controller: handoverController.takeoverDateController,
              ),
              LabelTextFieldWidget(
                label: 'branch',
                hintText: 'select',
                image: AppAssets.lostFoundData,
                controller: handoverController.branchController,
              ),
              LabelTextFieldWidget(
                label: 'departement',
                hintText: 'select',
                image: AppAssets.imageNoteFavorite,
                controller: handoverController.departmentController,
              ),
              LabelTextFieldWidget(
                label: 'custodian',
                hintText: 'select',
                image: AppAssets.assetsUserTick,
                controller: handoverController.custodianController,
              ),

              CustomText(
                isKey: true,
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
                          fontSize: 18 * Responsive.getResponsiveText(context),
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
                controller: handoverController.handoverRemarkController,
              ),

              CustomMediaPickerContainer(
                title: 'assets_image',
                imagePath: AppAssets.imageGalleryExport,
                imageTitle: 'attach_Image',
                multipleImage: 1,
                isCameraShow: true,
                isGalleryShow: true,
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
    );
  }
}
