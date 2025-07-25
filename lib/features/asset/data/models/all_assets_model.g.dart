// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_assets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllAssetsModel _$AllAssetsModelFromJson(Map<String, dynamic> json) =>
    AllAssetsModel(
      categoryList:
          (json['category_list'] as List<dynamic>?)
              ?.map((e) => CategoryList.fromJson(e as Map<String, dynamic>))
              .toList(),
      brandList:
          (json['brand_list'] as List<dynamic>?)
              ?.map((e) => BrandList.fromJson(e as Map<String, dynamic>))
              .toList(),
      assets:
          (json['assets'] as List<dynamic>?)
              ?.map((e) => Asset.fromJson(e as Map<String, dynamic>))
              .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AllAssetsModelToJson(AllAssetsModel instance) =>
    <String, dynamic>{
      'category_list': instance.categoryList,
      'brand_list': instance.brandList,
      'assets': instance.assets,
      'message': instance.message,
    };

Asset _$AssetFromJson(Map<String, dynamic> json) => Asset(
  assetsId: json['assets_id'] as String?,
  assetsIdView: json['assets_id_view'] as String?,
  assetsCategoryId: json['assets_category_id'] as String?,
  assetsCategory: $enumDecodeNullable(
    _$AssetsCategoryEnumMap,
    json['assets_category'],
  ),
  assetsBrandName: json['assets_brand_name'] as String?,
  assetsName: json['assets_name'] as String?,
  assetsLocation: json['assets_location'] as String?,
  assetsItemCode: json['assets_item_code'] as String?,
  assetsDescription: json['assets_description'] as String?,
  srNo: json['sr_no'] as String?,
  createdByName: json['created_by_name'] as String?,
  assetCredential: json['asset_credential'] as String?,
  qrCode: json['qr_code'] as String?,
  custodian: json['custodian'] as String?,
  assetsInvoice: json['assets_invoice'] as String?,
  assetInvoiceName: json['asset_invoice_name'] as String?,
  userId: json['user_id'] as String?,
  itemPurchaseDate: json['item_purchase_date'] as String?,
  itemPrice: json['item_price'] as String?,
  status: json['status'] as String?,
  assetsFile: json['assets_file'] as String?,
  assetsFilePass: json['assets_file_pass'] as String?,
  assetsFiles:
      (json['assets_files'] as List<dynamic>?)
          ?.map((e) => AssetsFile.fromJson(e as Map<String, dynamic>))
          .toList(),
  iteamCreatedDate: json['iteam_created_date'] as String?,
);

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
  'assets_id': instance.assetsId,
  'assets_id_view': instance.assetsIdView,
  'assets_category_id': instance.assetsCategoryId,
  'assets_category': _$AssetsCategoryEnumMap[instance.assetsCategory],
  'assets_brand_name': instance.assetsBrandName,
  'assets_name': instance.assetsName,
  'assets_location': instance.assetsLocation,
  'assets_item_code': instance.assetsItemCode,
  'assets_description': instance.assetsDescription,
  'sr_no': instance.srNo,
  'created_by_name': instance.createdByName,
  'asset_credential': instance.assetCredential,
  'qr_code': instance.qrCode,
  'custodian': instance.custodian,
  'assets_invoice': instance.assetsInvoice,
  'asset_invoice_name': instance.assetInvoiceName,
  'user_id': instance.userId,
  'item_purchase_date': instance.itemPurchaseDate,
  'item_price': instance.itemPrice,
  'status': instance.status,
  'assets_file': instance.assetsFile,
  'assets_file_pass': instance.assetsFilePass,
  'assets_files': instance.assetsFiles,
  'iteam_created_date': instance.iteamCreatedDate,
};

const _$AssetsCategoryEnumMap = {
  AssetsCategory.DESKTOP: 'Desktop',
  AssetsCategory.LAPTOP: 'Laptop',
  AssetsCategory.MOBILE: 'Mobile',
  AssetsCategory.TAB: 'Tab',
  AssetsCategory.TEST_ASSEST: 'test assest',
};

AssetsFile _$AssetsFileFromJson(Map<String, dynamic> json) => AssetsFile(
  name: json['name'] as String?,
  document: json['document'] as String?,
);

Map<String, dynamic> _$AssetsFileToJson(AssetsFile instance) =>
    <String, dynamic>{'name': instance.name, 'document': instance.document};

BrandList _$BrandListFromJson(Map<String, dynamic> json) =>
    BrandList(brandName: json['brand_name'] as String?);

Map<String, dynamic> _$BrandListToJson(BrandList instance) => <String, dynamic>{
  'brand_name': instance.brandName,
};

CategoryList _$CategoryListFromJson(Map<String, dynamic> json) => CategoryList(
  assetsCategoryId: json['assets_category_id'] as String?,
  assetsCategory: $enumDecodeNullable(
    _$AssetsCategoryEnumMap,
    json['assets_category'],
  ),
);

Map<String, dynamic> _$CategoryListToJson(CategoryList instance) =>
    <String, dynamic>{
      'assets_category_id': instance.assetsCategoryId,
      'assets_category': _$AssetsCategoryEnumMap[instance.assetsCategory],
    };
