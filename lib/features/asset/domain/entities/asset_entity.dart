class AssetsEntity {
  final List<AssetEntity>? assets;
  final String? message;

  AssetsEntity({this.assets, this.message});
}

class AssetEntity {
  final String? inventoryId;
  final String? assetsId;
  final String? assetsIdView;
  final String? assetsCategory;
  final String? assetsBrandName;
  final String? assetsName;
  final String? srNo;
  final String? itemPurchaseDate;
  final String? itemPrice;
  final String? assetsFile;
  final List<AssetsFileEntity>? assetsFiles;
  final List<dynamic>? assetsFilesHandover;
  final List<dynamic>? assetsFilesTakeover;
  final String? handoverDate;
  final String? takeoverDate;
  final String? iteamCreatedDate;

  AssetEntity({
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
}

class AssetsFileEntity {
  final String? name;
  final String? document;

  AssetsFileEntity({this.name, this.document});
}
