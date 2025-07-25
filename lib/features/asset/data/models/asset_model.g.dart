// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetModel _$AssetModelFromJson(Map<String, dynamic> json) => AssetModel(
  assets:
      (json['assets'] as List<dynamic>?)
          ?.map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$AssetModelToJson(AssetModel instance) =>
    <String, dynamic>{'assets': instance.assets, 'message': instance.message};

Asset _$AssetFromJson(Map<String, dynamic> json) => Asset(
  inventoryId: json['inventory_id'] as String?,
  assetsId: json['assets_id'] as String?,
  assetsIdView: json['assets_id_view'] as String?,
  assetsCategory: json['assets_category'] as String?,
  assetsBrandName: json['assets_brand_name'] as String?,
  assetsName: json['assets_name'] as String?,
  srNo: json['sr_no'] as String?,
  itemPurchaseDate: json['item_purchase_date'] as String?,
  itemPrice: json['item_price'] as String?,
  assetsFile: json['assets_file'] as String?,
  assetsFiles:
      (json['assets_files'] as List<dynamic>?)
          ?.map((e) => AssetsFile.fromJson(e as Map<String, dynamic>))
          .toList(),
  assetsFilesHandover: json['assets_files_handover'] as List<dynamic>?,
  assetsFilesTakeover: json['assets_files_takeover'] as List<dynamic>?,
  handoverDate: json['handover_date'] as String?,
  takeoverDate: json['takeover_date'] as String?,
  iteamCreatedDate: json['iteam_created_date'] as String?,
);

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
  'inventory_id': instance.inventoryId,
  'assets_id': instance.assetsId,
  'assets_id_view': instance.assetsIdView,
  'assets_category': instance.assetsCategory,
  'assets_brand_name': instance.assetsBrandName,
  'assets_name': instance.assetsName,
  'sr_no': instance.srNo,
  'item_purchase_date': instance.itemPurchaseDate,
  'item_price': instance.itemPrice,
  'assets_file': instance.assetsFile,
  'assets_files': instance.assetsFiles,
  'assets_files_handover': instance.assetsFilesHandover,
  'assets_files_takeover': instance.assetsFilesTakeover,
  'handover_date': instance.handoverDate,
  'takeover_date': instance.takeoverDate,
  'iteam_created_date': instance.iteamCreatedDate,
};

AssetsFile _$AssetsFileFromJson(Map<String, dynamic> json) => AssetsFile(
  name: json['name'] as String?,
  document: json['document'] as String?,
);

Map<String, dynamic> _$AssetsFileToJson(AssetsFile instance) =>
    <String, dynamic>{'name': instance.name, 'document': instance.document};
