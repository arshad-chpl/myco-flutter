class AllAssetsEntity {
  final List<CategoryListEntity>? categoryList;
  final List<BrandListEntity>? brandList;
  final List<AssetDetailEntity>? assets;
  final String? message;

  AllAssetsEntity({
    this.categoryList,
    this.brandList,
    this.assets,
    this.message,
  });

  AllAssetsEntity copyWith({
    List<CategoryListEntity>? categoryList,
    List<BrandListEntity>? brandList,
    List<AssetDetailEntity>? assets,
    String? message,
  }) =>
      AllAssetsEntity(
        categoryList: categoryList ?? this.categoryList,
        brandList: brandList ?? this.brandList,
        assets: assets ?? this.assets,
        message: message ?? this.message,
      );
}

class AssetDetailEntity {
  final String? assetsId;
  final String? assetsIdView;
  final String? assetsCategoryId;
  final String? assetsCategory;
  final String? assetsBrandName;
  final String? assetsName;
  final String? assetsLocation;
  final String? assetsItemCode;
  final String? assetsDescription;
  final String? srNo;
  final String? createdByName;
  final String? assetCredential;
  final String? qrCode;
  final String? custodian;
  final String? assetsInvoice;
  final String? assetInvoiceName;
  final String? userId;
  final String? itemPurchaseDate;
  final String? itemPrice;
  final String? status;
  final String? assetsFile;
  final String? assetsFilePass;
  final List<AssetsFileDetailEntity>? assetsFiles;
  final String? iteamCreatedDate;

  AssetDetailEntity({
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
}

class AssetsFileDetailEntity {
  final String? name;
  final String? document;

  AssetsFileDetailEntity({this.name, this.document});
}

class BrandListEntity {
  final String? brandName;

  BrandListEntity({this.brandName});
}

class CategoryListEntity {
  final String? assetsCategoryId;
  final String? assetsCategory;

  CategoryListEntity({this.assetsCategoryId, this.assetsCategory});
}
