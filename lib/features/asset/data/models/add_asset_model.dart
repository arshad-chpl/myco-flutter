// To parse this JSON data, do
//
//     final addAssetModel = addAssetModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:myco_flutter/features/asset/domain/entities/add_asset_entity.dart';

part 'add_asset_model.g.dart';

AddAssetModel addAssetModelFromJson(String str) =>
    AddAssetModel.fromJson(json.decode(str));

String addAssetModelToJson(AddAssetModel data) => json.encode(data.toJson());

@JsonSerializable()
class AddAssetModel {
  @JsonKey(name: 'category_list')
  List<CategoryList>? categoryList;
  @JsonKey(name: 'branch_list')
  List<BranchList>? branchList;
  @JsonKey(name: 'department_list')
  List<DepartmentList>? departmentList;
  @JsonKey(name: 'brand_list')
  List<dynamic>? brandList;
  @JsonKey(name: 'message')
  String? message;

  AddAssetModel({
    this.categoryList,
    this.branchList,
    this.departmentList,
    this.brandList,
    this.message,
  });

  factory AddAssetModel.fromJson(Map<String, dynamic> json) =>
      _$AddAssetModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddAssetModelToJson(this);
}

@JsonSerializable()
class BranchList {
  @JsonKey(name: 'block_id')
  String? blockId;
  @JsonKey(name: 'block_name')
  String? blockName;

  BranchList({this.blockId, this.blockName});

  factory BranchList.fromJson(Map<String, dynamic> json) =>
      _$BranchListFromJson(json);

  Map<String, dynamic> toJson() => _$BranchListToJson(this);
}

@JsonSerializable()
class CategoryList {
  @JsonKey(name: 'assets_category_id')
  String? assetsCategoryId;
  @JsonKey(name: 'assets_category')
  String? assetsCategory;
  @JsonKey(name: 'assets_image_required')
  String? assetsImageRequired;
  @JsonKey(name: 'sno_required')
  String? snoRequired;
  @JsonKey(name: 'assets_image_required_bool')
  bool? assetsImageRequiredBool;
  @JsonKey(name: 'sno_required_bool')
  bool? snoRequiredBool;
  @JsonKey(name: 'brand_name_required')
  bool? brandNameRequired;
  @JsonKey(name: 'location_required')
  bool? locationRequired;
  @JsonKey(name: 'item_code_required')
  bool? itemCodeRequired;
  @JsonKey(name: 'description_required')
  bool? descriptionRequired;
  @JsonKey(name: 'purchase_date_required')
  bool? purchaseDateRequired;
  @JsonKey(name: 'price_required')
  bool? priceRequired;
  @JsonKey(name: 'invoice_required')
  bool? invoiceRequired;
  @JsonKey(name: 'asset_credential_required')
  bool? assetCredentialRequired;
  @JsonKey(name: 'custodian_required')
  bool? custodianRequired;

  CategoryList({
    this.assetsCategoryId,
    this.assetsCategory,
    this.assetsImageRequired,
    this.snoRequired,
    this.assetsImageRequiredBool,
    this.snoRequiredBool,
    this.brandNameRequired,
    this.locationRequired,
    this.itemCodeRequired,
    this.descriptionRequired,
    this.purchaseDateRequired,
    this.priceRequired,
    this.invoiceRequired,
    this.assetCredentialRequired,
    this.custodianRequired,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) =>
      _$CategoryListFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryListToJson(this);
}

@JsonSerializable()
class DepartmentList {
  @JsonKey(name: 'block_id')
  String? blockId;
  @JsonKey(name: 'floor_id')
  String? floorId;
  @JsonKey(name: 'department_name')
  String? departmentName;

  DepartmentList({this.blockId, this.floorId, this.departmentName});

  factory DepartmentList.fromJson(Map<String, dynamic> json) =>
      _$DepartmentListFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentListToJson(this);
}

extension AddAssetModelMapper on AddAssetModel {
  AddAssetEntity toEntity() => AddAssetEntity(
    categoryList: categoryList?.map((e) => e.toEntity()).toList(),
    branchList: branchList?.map((e) => e.toEntity()).toList(),
    departmentList: departmentList?.map((e) => e.toEntity()).toList(),
    brandList: brandList,
    message: message,
  );
}

extension CategoryListMapper on CategoryList {
  CategoryEntity toEntity() => CategoryEntity(
    assetsCategoryId: assetsCategoryId,
    assetsCategory: assetsCategory,
    assetsImageRequired: assetsImageRequired,
    snoRequired: snoRequired,
    assetsImageRequiredBool: assetsImageRequiredBool,
    snoRequiredBool: snoRequiredBool,
    brandNameRequired: brandNameRequired,
    locationRequired: locationRequired,
    itemCodeRequired: itemCodeRequired,
    descriptionRequired: descriptionRequired,
    purchaseDateRequired: purchaseDateRequired,
    priceRequired: priceRequired,
    invoiceRequired: invoiceRequired,
    assetCredentialRequired: assetCredentialRequired,
    custodianRequired: custodianRequired,
  );
}

extension BranchListMapper on BranchList {
  BranchEntity toEntity() =>
      BranchEntity(blockId: blockId, blockName: blockName);
}

extension DepartmentListMapper on DepartmentList {
  DepartmentEntity toEntity() => DepartmentEntity(
    blockId: blockId,
    floorId: floorId,
    departmentName: departmentName,
  );
}
