// To parse this JSON data, do
//
//     final allAssetsModel = allAssetsModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/asset/domain/entities/all_assets_entity.dart';

part 'all_assets_model.g.dart';

AllAssetsModel allAssetsModelFromJson(String str) =>
    AllAssetsModel.fromJson(json.decode(str));

String allAssetsModelToJson(AllAssetsModel data) => json.encode(data.toJson());

@JsonSerializable()
class AllAssetsModel {
  @JsonKey(name: 'category_list')
  List<CategoryList>? categoryList;
  @JsonKey(name: 'brand_list')
  List<BrandList>? brandList;
  @JsonKey(name: 'assets')
  List<Asset>? assets;
  @JsonKey(name: 'message')
  String? message;

  AllAssetsModel({
    this.categoryList,
    this.brandList,
    this.assets,
    this.message,
  });

  factory AllAssetsModel.fromJson(Map<String, dynamic> json) =>
      _$AllAssetsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllAssetsModelToJson(this);
}

@JsonSerializable()
class Asset {
  @JsonKey(name: 'assets_id')
  String? assetsId;
  @JsonKey(name: 'assets_id_view')
  String? assetsIdView;
  @JsonKey(name: 'assets_category_id')
  String? assetsCategoryId;
  @JsonKey(name: 'assets_category')
  AssetsCategory? assetsCategory;
  @JsonKey(name: 'assets_brand_name')
  String? assetsBrandName;
  @JsonKey(name: 'assets_name')
  String? assetsName;
  @JsonKey(name: 'assets_location')
  String? assetsLocation;
  @JsonKey(name: 'assets_item_code')
  String? assetsItemCode;
  @JsonKey(name: 'assets_description')
  String? assetsDescription;
  @JsonKey(name: 'sr_no')
  String? srNo;
  @JsonKey(name: 'created_by_name')
  String? createdByName;
  @JsonKey(name: 'asset_credential')
  String? assetCredential;
  @JsonKey(name: 'qr_code')
  String? qrCode;
  @JsonKey(name: 'custodian')
  String? custodian;
  @JsonKey(name: 'assets_invoice')
  String? assetsInvoice;
  @JsonKey(name: 'asset_invoice_name')
  String? assetInvoiceName;
  @JsonKey(name: 'user_id')
  String? userId;
  @JsonKey(name: 'item_purchase_date')
  String? itemPurchaseDate;
  @JsonKey(name: 'item_price')
  String? itemPrice;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'assets_file')
  String? assetsFile;
  @JsonKey(name: 'assets_file_pass')
  String? assetsFilePass;
  @JsonKey(name: 'assets_files')
  List<AssetsFile>? assetsFiles;
  @JsonKey(name: 'iteam_created_date')
  String? iteamCreatedDate;

  Asset({
    this.assetsId,
    this.assetsIdView,
    this.assetsCategoryId,
    this.assetsCategory,
    this.assetsBrandName,
    this.assetsName,
    this.assetsLocation,
    this.assetsItemCode,
    this.assetsDescription,
    this.srNo,
    this.createdByName,
    this.assetCredential,
    this.qrCode,
    this.custodian,
    this.assetsInvoice,
    this.assetInvoiceName,
    this.userId,
    this.itemPurchaseDate,
    this.itemPrice,
    this.status,
    this.assetsFile,
    this.assetsFilePass,
    this.assetsFiles,
    this.iteamCreatedDate,
  });

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  Map<String, dynamic> toJson() => _$AssetToJson(this);
}

enum AssetsCategory {
  @JsonValue('Desktop')
  DESKTOP,
  @JsonValue('Laptop')
  LAPTOP,
  @JsonValue('Mobile')
  MOBILE,
  @JsonValue('Tab')
  TAB,
  @JsonValue('test assest')
  TEST_ASSEST,
}

final assetsCategoryValues = EnumValues({
  'Desktop': AssetsCategory.DESKTOP,
  'Laptop': AssetsCategory.LAPTOP,
  'Mobile': AssetsCategory.MOBILE,
  'Tab': AssetsCategory.TAB,
  'test assest': AssetsCategory.TEST_ASSEST,
});

@JsonSerializable()
class AssetsFile {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'document')
  String? document;

  AssetsFile({this.name, this.document});

  factory AssetsFile.fromJson(Map<String, dynamic> json) =>
      _$AssetsFileFromJson(json);

  Map<String, dynamic> toJson() => _$AssetsFileToJson(this);
}

@JsonSerializable()
class BrandList {
  @JsonKey(name: 'brand_name')
  String? brandName;

  BrandList({this.brandName});

  factory BrandList.fromJson(Map<String, dynamic> json) =>
      _$BrandListFromJson(json);

  Map<String, dynamic> toJson() => _$BrandListToJson(this);
}

@JsonSerializable()
class CategoryList {
  @JsonKey(name: 'assets_category_id')
  String? assetsCategoryId;
  @JsonKey(name: 'assets_category')
  AssetsCategory? assetsCategory;

  CategoryList({this.assetsCategoryId, this.assetsCategory});

  factory CategoryList.fromJson(Map<String, dynamic> json) =>
      _$CategoryListFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryListToJson(this);
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}


// Extension methods (add at the end of all_assets_model.dart)
extension AllAssetsModelExtension on AllAssetsModel {
  AllAssetsEntity toEntity() => AllAssetsEntity(
      categoryList: categoryList?.map((category) => category.toEntity()).toList(),
      brandList: brandList?.map((brand) => brand.toEntity()).toList(),
      assets: assets?.map((asset) => asset.toEntity()).toList(),
      message: message,
    );
}

extension CategoryListExtension on CategoryList {
  CategoryListEntity toEntity() => CategoryListEntity(
      assetsCategoryId: assetsCategoryId,
      assetsCategory: assetsCategory?.name,
    );
}

extension BrandListExtension on BrandList {
  BrandListEntity toEntity() => BrandListEntity(
      brandName: brandName,
    );
}

extension AssetExtension on Asset {
  AssetDetailEntity toEntity() => AssetDetailEntity(
      assetsId: assetsId,
      assetsIdView: assetsIdView,
      assetsCategoryId: assetsCategoryId,
      assetsCategory: assetsCategory?.name,
      assetsBrandName: assetsBrandName,
      assetsName: assetsName,
      assetsLocation: assetsLocation,
      assetsItemCode: assetsItemCode,
      assetsDescription: assetsDescription,
      srNo: srNo,
      createdByName: createdByName,
      assetCredential: assetCredential,
      qrCode: qrCode,
      custodian: custodian,
      assetsInvoice: assetsInvoice,
      assetInvoiceName: assetInvoiceName,
      userId: userId,
      itemPurchaseDate: itemPurchaseDate,
      itemPrice: itemPrice,
      status: status,
      assetsFile: assetsFile,
      assetsFilePass: assetsFilePass,
      assetsFiles: assetsFiles?.map((file) => file.toEntity()).toList(),
      iteamCreatedDate: iteamCreatedDate,
    );
}

extension AssetsFileExtension on AssetsFile {
  AssetsFileDetailEntity toEntity() {
    return AssetsFileDetailEntity(
      name: name,
      document: document,
    );
  }
}
