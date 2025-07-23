// To parse this JSON data, do
//
//     final assetModel = assetModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/asset/domain/entities/asset_entity.dart';

part 'asset_model.g.dart';

AssetModel assetModelFromJson(String str) =>
    AssetModel.fromJson(json.decode(str));

String assetModelToJson(AssetModel data) => json.encode(data.toJson());

@JsonSerializable()
class AssetModel {
  @JsonKey(name: 'assets')
  List<Asset>? assets;
  @JsonKey(name: 'message')
  String? message;

  AssetModel({this.assets, this.message});

  factory AssetModel.fromJson(Map<String, dynamic> json) =>
      _$AssetModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssetModelToJson(this);

}

@JsonSerializable()
class Asset {
  @JsonKey(name: 'inventory_id')
  String? inventoryId;
  @JsonKey(name: 'assets_id')
  String? assetsId;
  @JsonKey(name: 'assets_id_view')
  String? assetsIdView;
  @JsonKey(name: 'assets_category')
  String? assetsCategory;
  @JsonKey(name: 'assets_brand_name')
  String? assetsBrandName;
  @JsonKey(name: 'assets_name')
  String? assetsName;
  @JsonKey(name: 'sr_no')
  String? srNo;
  @JsonKey(name: 'item_purchase_date')
  String? itemPurchaseDate;
  @JsonKey(name: 'item_price')
  String? itemPrice;
  @JsonKey(name: 'assets_file')
  String? assetsFile;
  @JsonKey(name: 'assets_files')
  List<AssetsFile>? assetsFiles;
  @JsonKey(name: 'assets_files_handover')
  List<dynamic>? assetsFilesHandover;
  @JsonKey(name: 'assets_files_takeover')
  List<dynamic>? assetsFilesTakeover;
  @JsonKey(name: 'handover_date')
  String? handoverDate;
  @JsonKey(name: 'takeover_date')
  String? takeoverDate;
  @JsonKey(name: 'iteam_created_date')
  String? iteamCreatedDate;

  Asset({
    this.inventoryId,
    this.assetsId,
    this.assetsIdView,
    this.assetsCategory,
    this.assetsBrandName,
    this.assetsName,
    this.srNo,
    this.itemPurchaseDate,
    this.itemPrice,
    this.assetsFile,
    this.assetsFiles,
    this.assetsFilesHandover,
    this.assetsFilesTakeover,
    this.handoverDate,
    this.takeoverDate,
    this.iteamCreatedDate,
  });

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  Map<String, dynamic> toJson() => _$AssetToJson(this);
}

@JsonSerializable()
class AssetsFile {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "document")
  String? document;

  AssetsFile({this.name, this.document});

  factory AssetsFile.fromJson(Map<String, dynamic> json) =>
      _$AssetsFileFromJson(json);

  Map<String, dynamic> toJson() => _$AssetsFileToJson(this);
}


extension AssetModelMapper on AssetModel {
  AssetsEntity toEntity() => AssetsEntity(
        message: message,
        assets: assets?.map((item) => item.toEntity()).toList(),
      );
}

extension AssetMapper on Asset {
  AssetEntity toEntity() => AssetEntity(
        inventoryId: inventoryId,
        assetsId: assetsId,
        assetsIdView: assetsIdView,
        assetsCategory: assetsCategory,
        assetsBrandName: assetsBrandName,
        assetsName: assetsName,
        srNo: srNo,
        itemPurchaseDate: itemPurchaseDate,
        itemPrice: itemPrice,
        assetsFile: assetsFile,
        assetsFiles: assetsFiles?.map((e) => e.toEntity()).toList(),
        assetsFilesHandover: assetsFilesHandover,
        assetsFilesTakeover: assetsFilesTakeover,
        handoverDate: handoverDate,
        takeoverDate: takeoverDate,
        iteamCreatedDate: iteamCreatedDate,
      );
}

extension AssetsFileMapper on AssetsFile {
  AssetsFileEntity toEntity() => AssetsFileEntity(
        name: name,
        document: document,
      );
}
