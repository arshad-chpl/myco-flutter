import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/controllers/add_assets_controllers.dart';
import 'package:myco_flutter/features/asset/widgets/label_text_field.dart';
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
          'Edit Assets',
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
              LabelTextFieldWidget(
                label: 'Assets Category',
                hintText: 'Select',
                image: 'assets/assets/element.png',
                controller: addAssetsControllers.categoryController,
              ),
              LabelTextFieldWidget(
                label: 'Item Name',
                hintText: 'Type Name',
                image: 'assets/assets/shopping-bag.png',
                controller: addAssetsControllers.itemNameController,
              ),
              LabelTextFieldWidget(
                label: 'Brand Name',
                hintText: 'Type Here',
                image: 'assets/assets/group.png',
                controller: addAssetsControllers.brandNameController,
              ),
              LabelTextFieldWidget(
                label: 'Location',
                hintText: 'Type Here',
                image: 'assets/take_order/location.png',
                controller: addAssetsControllers.locationController,
              ),
              LabelTextFieldWidget(
                label: 'Item Code',
                hintText: 'Select Section',
                image: 'assets/assets/password-check.png',
                controller: addAssetsControllers.itemCodeController,
              ),
              LabelTextFieldWidget(
                label: 'Description',
                hintText: 'Type Here',
                image: 'assets/assets/stickynote.png',
                controller: addAssetsControllers.descriptionController,
              ),
              LabelTextFieldWidget(
                label: 'Purchase Date',
                hintText: 'Select',
                image: 'assets/images/note-favorite.png',
                controller: addAssetsControllers.purchaseDateController,
              ),
              LabelTextFieldWidget(
                label: 'Sr.No./MAC/Sim',
                hintText: 'Type Here',
                image: 'assets/assets/simcard.png',
                controller: addAssetsControllers.simController,
              ),
              LabelTextFieldWidget(
                label: 'Price',
                hintText: 'Type Here',
                image: 'assets/assets/dollar-square.png',
                controller: addAssetsControllers.priceController,
              ),
              LabelTextFieldWidget(
                label: 'Credential',
                hintText: 'Type Here',
                image: 'assets/lost_and_found/data.png',
                controller: addAssetsControllers.credentialController,
              ),
              LabelTextFieldWidget(
                label: 'Branch',
                hintText: 'Select',
                image: 'assets/lost_and_found/data.png',
                controller: addAssetsControllers.branchController,
              ),
              LabelTextFieldWidget(
                label: 'Department',
                hintText: 'Select',
                image: 'assets/images/note-favorite.png',
                controller: addAssetsControllers.departmentController,
              ),
              LabelTextFieldWidget(
                label: 'Custodian',
                hintText: 'Select',
                image: 'assets/assets/user-tick.png',
                controller: addAssetsControllers.custodianController,
              ),
              LabelTextFieldWidget(
                label: 'Handover Date',
                hintText: 'Select',
                image: 'assets/images/note-favorite.png',
                controller: addAssetsControllers.handoverDateController,
              ),

              // -- Assets Image --
              CustomMediaPickerContainer(
                imagePath: 'assets/images/gallery-export.png',
                imageTitle: 'Assets Images',
                multipleImage: 1,
                title: 'Assets Image',
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
                imagePath: 'assets/images/gallery-export.png',
                imageTitle: 'Assets Images',
                multipleImage: 1,
                title: 'Invoice',
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
