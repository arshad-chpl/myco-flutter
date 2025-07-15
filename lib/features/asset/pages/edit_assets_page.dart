import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/text_controllers/add_assets_controllers.dart';
import 'package:myco_flutter/features/asset/widgets/assets_label_text_field.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_media_picker_container.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class EditAssetsPage extends StatefulWidget {
  const EditAssetsPage({super.key});

  @override
  State<EditAssetsPage> createState() => _EditAssetsPage();
}

class _EditAssetsPage extends State<EditAssetsPage> {
  final AddAssetsControllers addAssetsControllers = AddAssetsControllers();

  @override
  void dispose() {
    addAssetsControllers.categoryController.dispose();
    addAssetsControllers.itemNameController.dispose();
    addAssetsControllers.brandNameController.dispose();
    addAssetsControllers.locationController.dispose();
    addAssetsControllers.itemCodeController.dispose();
    addAssetsControllers.descriptionController.dispose();
    addAssetsControllers.purchaseDateController.dispose();
    addAssetsControllers.simController.dispose();
    addAssetsControllers.priceController.dispose();
    addAssetsControllers.credentialController.dispose();
    addAssetsControllers.branchController.dispose();
    addAssetsControllers.departmentController.dispose();
    addAssetsControllers.custodianController.dispose();
    addAssetsControllers.handoverDateController.dispose();
    super.dispose();
  }

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        title: CustomText(
          isKey: true,
          'edit_asset',
          fontSize: 22 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w700,
          color: AppTheme.getColor(context).onSurface,
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
              AssetsTextFieldWidget(
                label: 'assets_category',
                hintText: 'select',
                image: AppAssets.assetsElement,
                controller: addAssetsControllers.categoryController,
              ),
              AssetsTextFieldWidget(
                label: 'item_name',
                hintText: 'type_name',
                image: AppAssets.assetsShoppingBag,
                controller: addAssetsControllers.itemNameController,
              ),
              AssetsTextFieldWidget(
                label: 'brand_name',
                hintText: 'type_here',
                image: AppAssets.assetsGroup,
                controller: addAssetsControllers.brandNameController,
              ),
              AssetsTextFieldWidget(
                label: 'location',
                hintText: 'type_here',
                image: AppAssets.location,
                controller: addAssetsControllers.locationController,
              ),
              AssetsTextFieldWidget(
                label: 'item_code',
                hintText: 'select_section',
                image: AppAssets.assetsPasswordCheck,
                controller: addAssetsControllers.itemCodeController,
              ),
              AssetsTextFieldWidget(
                label: 'description',
                hintText: 'type_here',
                image: AppAssets.assetsStickyNote,
                controller: addAssetsControllers.descriptionController,
              ),
              AssetsTextFieldWidget(
                label: 'purchase_date',
                hintText: 'select',
                image: AppAssets.imageNoteFavorite,
                controller: addAssetsControllers.purchaseDateController,
              ),
              AssetsTextFieldWidget(
                label: 'sr_no',
                hintText: 'type_here',
                image: AppAssets.assetsSimCard,
                controller: addAssetsControllers.simController,
              ),
              AssetsTextFieldWidget(
                label: 'price',
                hintText: 'type_here',
                image: AppAssets.assetsDollar,
                controller: addAssetsControllers.priceController,
              ),
              AssetsTextFieldWidget(
                label: 'credential',
                hintText: 'type_here',
                image: AppAssets.lostFoundData,
                controller: addAssetsControllers.credentialController,
              ),
              AssetsTextFieldWidget(
                label: 'branch',
                hintText: 'select',
                image: AppAssets.lostFoundData,
                controller: addAssetsControllers.branchController,
              ),
              AssetsTextFieldWidget(
                label: 'departement',
                hintText: 'select',
                image: AppAssets.imageNoteFavorite,
                controller: addAssetsControllers.departmentController,
              ),
              AssetsTextFieldWidget(
                label: 'custodian',
                hintText: 'select',
                image: AppAssets.assetsUserTick,
                controller: addAssetsControllers.custodianController,
              ),
              AssetsTextFieldWidget(
                label: 'handover_date',
                hintText: 'select',
                image: AppAssets.imageNoteFavorite,
                controller: addAssetsControllers.handoverDateController,
              ),

              // -- Assets Image --
              CustomMediaPickerContainer(
                imagePath: AppAssets.imageGalleryExport,
                imageTitle: 'assets_image',
                multipleImage: 1,
                title: 'assets_image',
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
              SizedBox(height: 0.024 * Responsive.getHeight(context)),

              // -- Invoice --
              CustomMediaPickerContainer(
                imagePath: AppAssets.imageGalleryExport,
                imageTitle: 'assets_image',
                multipleImage: 1,
                title: 'invoice',
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
                title: 'submit',
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
