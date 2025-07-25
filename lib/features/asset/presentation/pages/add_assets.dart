import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/domain/entities/add_asset_entity.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/add_asset/add_asset_bloc.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/add_asset/add_asset_event.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/add_asset/add_asset_state.dart';
import 'package:myco_flutter/features/asset/presentation/text_controllers/add_assets_controllers.dart';
import 'package:myco_flutter/features/asset/presentation/utils/asset_enum.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/assets_label_text_field.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_simple_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';
import 'package:myco_flutter/widgets/media_picker/widgets/custom_media_picker_container.dart';

class AddAssets extends StatefulWidget {
  const AddAssets({super.key});

  @override
  State<AddAssets> createState() => _AddAssets();
}

class _AddAssets extends State<AddAssets> {
  final AddAssetsControllers addAssetsControllers = AddAssetsControllers();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<AddAssetBloc>().add(const FetchAddAssetEvent());
  }

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

  List<Map<String, String>> categoryDataList = [];
  List<Map<String, String>> branchDataList = [];

  String selectedCategoryId = '';
  String selectedBranchId = '';
  String selectedDepartmentId = '';

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF6F7FB),
      appBar: const CustomAppbar(title: 'add_assets', titleSpacing: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                VariableBag.screenHorizontalPadding *
                Responsive.getResponsive(context),
          ),
          child: BlocBuilder<AddAssetBloc, AddAssetState>(
            builder: (context, state) {
              final currentError = state.currentFieldErrorKey;
              final selectedCategory = state is AddAssetCategorySelected
                  ? state.selectedCategory
                  : null;

              log(name: 'category select', selectedCategory.toString());

              if ((state is AddAssetLoaded) &&
                  state.addAssetEntity.categoryList != null) {
                categoryDataList = state.addAssetEntity.categoryList != null
                    ? state.addAssetEntity.categoryList!
                          .map(
                            (e) => {
                              'id': e.assetsCategoryId ?? '',
                              'name': e.assetsCategory ?? '',
                            },
                          )
                          .toList()
                    : [];

                branchDataList = state.addAssetEntity.branchList != null
                    ? state.addAssetEntity.branchList!
                          .map(
                            (e) => {
                              'id': e.blockId ?? '',
                              'name': e.blockName ?? '',
                            },
                          )
                          .toList()
                    : [];
              }

              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AssetsTextFieldWidget(
                      label: 'assets_category',
                      hintText: 'select',
                      isRequired: true,
                      image: AppAssets.assetsElement,
                      controller: addAssetsControllers.categoryController,
                      validator: (value) {
                        if (currentError == AddAssetFieldKey.category &&
                            (value == null || value.trim().isEmpty)) {
                          return 'Assets category is required';
                        }
                        return null;
                      },
                      onTap: () async {
                        // If still loading, prevent selection
                        if (state is AddAssetLoading) {
                          Fluttertoast.showToast(msg: 'Categories Loading....');
                          return;
                        }

                        // Ensure we have categories to display
                        if (categoryDataList.isEmpty) {
                          Fluttertoast.showToast(
                            msg: 'No categories available',
                          );
                          return;
                        }

                        // Show bottom sheet and await selection
                        final selected = await showCustomSimpleBottomSheet(
                          context: context,
                          dataList: categoryDataList,
                          heading: 'Category',
                          selectedId: selectedCategoryId,
                        );
                        if (selected == null) return;

                        // Compute matchedCategory from whichever AddAssetState is current
                        CategoryEntity? matchedCategory;
                        if (state is AddAssetLoaded) {
                          matchedCategory = state.addAssetEntity.categoryList
                              ?.firstWhere(
                                (e) => e.assetsCategoryId == selected['id'],
                              );
                        } else if (state is AddAssetCategorySelected) {
                          matchedCategory = state.addAssetEntity.categoryList
                              ?.firstWhere(
                                (e) => e.assetsCategoryId == selected['id'],
                              );
                        }

                        // If we found a valid category, notify BLoC and update UI
                        setState(() {
                          if (matchedCategory != null) {
                            context.read<AddAssetBloc>().add(
                              SelectAssetCategoryEvent(matchedCategory),
                            );
                            selectedCategoryId = selected['id'];
                            addAssetsControllers.categoryController.text =
                                selected['name'];
                          }
                        });
                      },
                    ),
                    AssetsTextFieldWidget(
                      label: 'item_name',
                      hintText: 'type_name',
                      isRequired: true,
                      image: AppAssets.assetsShoppingBag,
                      controller: addAssetsControllers.itemNameController,
                      validator: (value) {
                        if (currentError == AddAssetFieldKey.itemName &&
                            (value == null || value.trim().isEmpty)) {
                          return 'Item name is required';
                        }
                        return null;
                      },
                    ),
                    AssetsTextFieldWidget(
                      label: 'brand_name',
                      hintText: 'type_here',
                      isRequired: selectedCategory?.brandNameRequired ?? false,
                      image: AppAssets.assetsGroup,
                      controller: addAssetsControllers.brandNameController,
                      validator: (value) {
                        if (currentError == AddAssetFieldKey.brandName &&
                            (value == null || value.trim().isEmpty)) {
                          return 'Branch name is required';
                        }
                        return null;
                      },
                    ),
                    AssetsTextFieldWidget(
                      label: 'location',
                      hintText: 'type_here',
                      isRequired: selectedCategory?.locationRequired ?? false,
                      image: AppAssets.location,
                      controller: addAssetsControllers.locationController,
                      validator: (value) {
                        if (currentError == AddAssetFieldKey.location &&
                            (value == null || value.trim().isEmpty)) {
                          return 'Location is required';
                        }
                        return null;
                      },
                    ),
                    AssetsTextFieldWidget(
                      label: 'item_code',
                      hintText: 'select_section',
                      isRequired: selectedCategory?.itemCodeRequired ?? false,
                      image: AppAssets.assetsPasswordCheck,
                      controller: addAssetsControllers.itemCodeController,
                      validator: (value) {
                        if (currentError == AddAssetFieldKey.itemCode &&
                            (value == null || value.trim().isEmpty)) {
                          return 'Item code is required';
                        }
                        return null;
                      },
                    ),
                    AssetsTextFieldWidget(
                      label: 'description',
                      hintText: 'type_here',
                      isRequired:
                          selectedCategory?.descriptionRequired ?? false,
                      image: AppAssets.assetsStickyNote,
                      controller: addAssetsControllers.descriptionController,
                      validator: (value) {
                        if (currentError == AddAssetFieldKey.description &&
                            (value == null || value.trim().isEmpty)) {
                          return ' is required';
                        }
                        return null;
                      },
                    ),
                    AssetsTextFieldWidget(
                      label: 'purchase_date',
                      hintText: 'select',
                      isRequired:
                          selectedCategory?.purchaseDateRequired ?? false,
                      image: AppAssets.imageNoteFavorite,
                      controller: addAssetsControllers.purchaseDateController,
                      validator: (value) {
                        if (currentError == AddAssetFieldKey.purchaseDate &&
                            (value == null || value.trim().isEmpty)) {
                          return 'Purchase date is required';
                        }
                        return null;
                      },
                    ),
                    AssetsTextFieldWidget(
                      label: 'sr_no',
                      hintText: 'type_here',
                      isRequired: selectedCategory?.snoRequiredBool ?? false,

                      image: AppAssets.assetsSimCard,
                      controller: addAssetsControllers.simController,
                      validator: (value) {
                        if (currentError == AddAssetFieldKey.sno &&
                            (value == null || value.trim().isEmpty)) {
                          return 'Sr.No. is required';
                        }
                        return null;
                      },
                    ),
                    AssetsTextFieldWidget(
                      label: 'price',
                      hintText: 'type_here',
                      isRequired: selectedCategory?.priceRequired ?? false,
                      image: AppAssets.assetsDollar,
                      controller: addAssetsControllers.priceController,
                      validator: (value) {
                        if (currentError == AddAssetFieldKey.price &&
                            (value == null || value.trim().isEmpty)) {
                          return 'Price is required';
                        }
                        return null;
                      },
                    ),
                    AssetsTextFieldWidget(
                      label: 'credential',
                      hintText: 'type_here',
                      image: AppAssets.lostFoundData,
                      isRequired:
                          selectedCategory?.assetCredentialRequired ?? false,

                      controller: addAssetsControllers.credentialController,
                      validator: (value) {
                        if (currentError == AddAssetFieldKey.assetCredential &&
                            (value == null || value.trim().isEmpty)) {
                          return 'Credential is required';
                        }
                        return null;
                      },
                    ),
                    AssetsTextFieldWidget(
                      label: 'branch',
                      hintText: 'select',
                      isRequired: selectedCategory?.brandNameRequired ?? false,

                      image: AppAssets.lostFoundData,
                      controller: addAssetsControllers.branchController,
                      validator: (value) {
                        if (currentError == AddAssetFieldKey.branch &&
                            (value == null || value.trim().isEmpty)) {
                          return 'Branch is required';
                        }
                        return null;
                      },
                      onTap: () async {
                        if (state is AddAssetLoading) {
                          Fluttertoast.showToast(msg: 'Branch Loading....');
                          return;
                        }

                        if (branchDataList.isEmpty) {
                          Fluttertoast.showToast(msg: 'No branches available');
                          return;
                        }
                        log(branchDataList.toString());
                        // Show bottom sheet and await selection
                        final selected = await showCustomSimpleBottomSheet(
                          context: context,
                          dataList: branchDataList,
                          heading: 'Branches',
                          selectedId: selectedBranchId,
                        );
                        if (selected == null) return;
                        log(name: 'branch', selected.toString());
                        setState(() {
                          if (selected != null) {
                            selectedBranchId = selected['id'];
                            addAssetsControllers.branchController.text =
                                selected['name'];
                            addAssetsControllers.departmentController.clear();
                          }
                        });
                      },
                    ),
                    AssetsTextFieldWidget(
                      label: 'departement',
                      hintText: 'select',
                      isRequired: true,

                      image: AppAssets.imageNoteFavorite,
                      controller: addAssetsControllers.departmentController,
                      validator: (value) {
                        if (currentError == AddAssetFieldKey.department &&
                            (value == null || value.trim().isEmpty)) {
                          return 'Department is required';
                        }
                        return null;
                      },
                      onTap: () async {
                        if (selectedBranchId.isEmpty) {
                          Fluttertoast.showToast(msg: 'Select Branch First');
                          return;
                        }

                        if (state is AddAssetLoading) {
                          Fluttertoast.showToast(msg: 'Department Loading....');
                          return;
                        }

                        if (branchDataList.isEmpty) {
                          Fluttertoast.showToast(
                            msg: 'No departmentes available',
                          );
                          return;
                        }

                        var filteredDepartments;

                        if (state is AddAssetLoaded) {
                          filteredDepartments =
                              state.addAssetEntity.departmentList != null
                              ? state.addAssetEntity.departmentList!
                                    .where(
                                      (dept) =>
                                          dept.blockId == selectedBranchId,
                                    )
                                    .map(
                                      (e) => {
                                        'id': e.blockId ?? '',
                                        'name': e.departmentName ?? '',
                                      },
                                    )
                                    .toList()
                              : [];
                        } else if (state is AddAssetCategorySelected) {
                          filteredDepartments =
                              state.addAssetEntity.departmentList != null
                              ? state.addAssetEntity.departmentList!
                                    .where(
                                      (dept) =>
                                          dept.blockId == selectedBranchId,
                                    )
                                    .map(
                                      (e) => {
                                        'id': e.blockId ?? '',
                                        'name': e.departmentName ?? '',
                                      },
                                    )
                                    .toList()
                              : [];
                        }
                        if (filteredDepartments.isEmpty) {
                          Fluttertoast.showToast(
                            msg: 'No departments found for selected branch',
                          );
                          return;
                        }

                        log(
                          name: 'department filter list',
                          filteredDepartments.toString(),
                        );
                        // Show bottom sheet and await selection
                        final selected = await showCustomSimpleBottomSheet(
                          context: context,
                          dataList: filteredDepartments,
                          heading: 'Departments',
                          // selectedId: selectedDepartmentId,
                        );

                        if (selected == null) return;
                        log(name: 'department', selected.toString());
                        setState(() {
                          if (selected != null) {
                            selectedDepartmentId = selected['id'];
                            addAssetsControllers.departmentController.text =
                                selected['name'];
                          }
                        });
                      },
                    ),
                    AssetsTextFieldWidget(
                      label: 'custodian',
                      hintText: 'select',
                      isRequired: selectedCategory?.custodianRequired ?? false,

                      image: AppAssets.assetsUserTick,
                      controller: addAssetsControllers.custodianController,
                      validator: (value) {
                        if (currentError == AddAssetFieldKey.custodian &&
                            (value == null || value.trim().isEmpty)) {
                          return 'Custodian is required';
                        }
                        return null;
                      },
                    ),
                    AssetsTextFieldWidget(
                      label: 'handover_date',
                      hintText: 'select',
                      image: AppAssets.imageNoteFavorite,
                      controller: addAssetsControllers.handoverDateController,
                    ),

                    // -- Assets Image --
                    CustomMediaPickerContainer(
                      imagePath: '',
                      imageTitle: 'assets_image',
                      multipleImage: 1,
                      title: 'assets_image',
                      titleIsKey: true,
                      isCameraShow: true,
                      isGalleryShow: true,
                      titleColor: AppTheme.getColor(context).onSurfaceVariant,
                      titleFontSize: 14 * Responsive.getResponsiveText(context),
                      imageTitleSize:
                          16 * Responsive.getResponsiveText(context),
                      imageTitleColor: AppTheme.getColor(
                        context,
                      ).onSurfaceVariant,
                      backgroundColor: const Color(0xFFEEF7FD),
                      imageTitleIsKey: true,
                      containerHeight: 0.1 * Responsive.getHeight(context),
                    ),
                    SizedBox(
                      height:
                          VariableBag.formContentSpacingVertical *
                          Responsive.getResponsive(context),
                    ),

                    // -- Invoice --
                    CustomMediaPickerContainer(
                      imagePath: '',
                      imageTitle: 'assets_image',
                      multipleImage: 1,
                      title: 'invoice',
                      isCameraShow: true,
                      titleIsKey: true,
                      imageTitleIsKey: true,
                      isGalleryShow: true,
                      titleColor: AppTheme.getColor(context).onSurfaceVariant,
                      titleFontSize: 14 * Responsive.getResponsiveText(context),
                      imageTitleSize:
                          16 * Responsive.getResponsiveText(context),
                      imageTitleColor: AppTheme.getColor(
                        context,
                      ).onSurfaceVariant,
                      backgroundColor: const Color(0xFFEEF7FD),
                      containerHeight: 0.1 * Responsive.getHeight(context),
                    ),
                    SizedBox(
                      height:
                          VariableBag.formContentSpacingVertical *
                          Responsive.getResponsive(context),
                    ),

                    //Submit button
                    MyCoButton(
                      onTap: () => _validateFieldByField(selectedCategory),
                      title: 'Submit',
                      isShadowBottomLeft: true,
                      boarderRadius: 50,
                      fontFamily: 'Gilroy-Bold',
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height:
                          VariableBag.formContentSpacingVertical *
                          Responsive.getResponsive(context),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _validateFieldByField(CategoryEntity? selectedCategory) {
    final fieldMap = <AddAssetFieldKey, TextEditingController>{
      AddAssetFieldKey.category: addAssetsControllers.categoryController,
      AddAssetFieldKey.itemName: addAssetsControllers.itemNameController,
      if (selectedCategory?.brandNameRequired == true)
        AddAssetFieldKey.brandName: addAssetsControllers.brandNameController,
      if (selectedCategory?.locationRequired == true)
        AddAssetFieldKey.location: addAssetsControllers.locationController,
      if (selectedCategory?.itemCodeRequired == true)
        AddAssetFieldKey.itemCode: addAssetsControllers.itemCodeController,
      if (selectedCategory?.descriptionRequired == true)
        AddAssetFieldKey.description:
            addAssetsControllers.descriptionController,
      if (selectedCategory?.purchaseDateRequired == true)
        AddAssetFieldKey.purchaseDate:
            addAssetsControllers.purchaseDateController,
      if (selectedCategory?.snoRequiredBool == true)
        AddAssetFieldKey.sno: addAssetsControllers.simController,
      if (selectedCategory?.priceRequired == true)
        AddAssetFieldKey.price: addAssetsControllers.priceController,
      if (selectedCategory?.assetCredentialRequired == true)
        AddAssetFieldKey.assetCredential:
            addAssetsControllers.credentialController,
      if (selectedCategory?.brandNameRequired == true)
        AddAssetFieldKey.branch: addAssetsControllers.branchController,
      AddAssetFieldKey.department: addAssetsControllers.departmentController,
      if (selectedCategory?.custodianRequired == true)
        AddAssetFieldKey.custodian: addAssetsControllers.custodianController,
    };

    for (final entry in fieldMap.entries) {
      if (entry.value.text.trim().isEmpty) {
        context.read<AddAssetBloc>().add(SetFieldErrorIndexEvent(entry.key));
        // Delay validation to allow BlocBuilder to rebuild with new state
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _formKey.currentState!.validate();
        });
        return;
      }
    }

    context.read<AddAssetBloc>().add(const SetFieldErrorIndexEvent(null));
    log('All fields are valid. Proceed to submit.');
  }
}
