// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAssetModel _$AddAssetModelFromJson(Map<String, dynamic> json) =>
    AddAssetModel(
      categoryList: (json['category_list'] as List<dynamic>?)
          ?.map((e) => CategoryList.fromJson(e as Map<String, dynamic>))
          .toList(),
      branchList: (json['branch_list'] as List<dynamic>?)
          ?.map((e) => BranchList.fromJson(e as Map<String, dynamic>))
          .toList(),
      departmentList: (json['department_list'] as List<dynamic>?)
          ?.map((e) => DepartmentList.fromJson(e as Map<String, dynamic>))
          .toList(),
      brandList: json['brand_list'] as List<dynamic>?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AddAssetModelToJson(AddAssetModel instance) =>
    <String, dynamic>{
      'category_list': instance.categoryList,
      'branch_list': instance.branchList,
      'department_list': instance.departmentList,
      'brand_list': instance.brandList,
      'message': instance.message,
    };

BranchList _$BranchListFromJson(Map<String, dynamic> json) => BranchList(
      blockId: json['block_id'] as String?,
      blockName: json['block_name'] as String?,
    );

Map<String, dynamic> _$BranchListToJson(BranchList instance) =>
    <String, dynamic>{
      'block_id': instance.blockId,
      'block_name': instance.blockName,
    };

CategoryList _$CategoryListFromJson(Map<String, dynamic> json) => CategoryList(
      assetsCategoryId: json['assets_category_id'] as String?,
      assetsCategory: json['assets_category'] as String?,
      assetsImageRequired: json['assets_image_required'] as String?,
      snoRequired: json['sno_required'] as String?,
      assetsImageRequiredBool: json['assets_image_required_bool'] as bool?,
      snoRequiredBool: json['sno_required_bool'] as bool?,
      brandNameRequired: json['brand_name_required'] as bool?,
      locationRequired: json['location_required'] as bool?,
      itemCodeRequired: json['item_code_required'] as bool?,
      descriptionRequired: json['description_required'] as bool?,
      purchaseDateRequired: json['purchase_date_required'] as bool?,
      priceRequired: json['price_required'] as bool?,
      invoiceRequired: json['invoice_required'] as bool?,
      assetCredentialRequired: json['asset_credential_required'] as bool?,
      custodianRequired: json['custodian_required'] as bool?,
    );

Map<String, dynamic> _$CategoryListToJson(CategoryList instance) =>
    <String, dynamic>{
      'assets_category_id': instance.assetsCategoryId,
      'assets_category': instance.assetsCategory,
      'assets_image_required': instance.assetsImageRequired,
      'sno_required': instance.snoRequired,
      'assets_image_required_bool': instance.assetsImageRequiredBool,
      'sno_required_bool': instance.snoRequiredBool,
      'brand_name_required': instance.brandNameRequired,
      'location_required': instance.locationRequired,
      'item_code_required': instance.itemCodeRequired,
      'description_required': instance.descriptionRequired,
      'purchase_date_required': instance.purchaseDateRequired,
      'price_required': instance.priceRequired,
      'invoice_required': instance.invoiceRequired,
      'asset_credential_required': instance.assetCredentialRequired,
      'custodian_required': instance.custodianRequired,
    };

DepartmentList _$DepartmentListFromJson(Map<String, dynamic> json) =>
    DepartmentList(
      blockId: json['block_id'] as String?,
      floorId: json['floor_id'] as String?,
      departmentName: json['department_name'] as String?,
    );

Map<String, dynamic> _$DepartmentListToJson(DepartmentList instance) =>
    <String, dynamic>{
      'block_id': instance.blockId,
      'floor_id': instance.floorId,
      'department_name': instance.departmentName,
    };
