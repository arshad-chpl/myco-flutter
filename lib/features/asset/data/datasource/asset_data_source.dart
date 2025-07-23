import 'package:myco_flutter/features/asset/data/models/all_assets_model.dart';
import 'package:myco_flutter/features/asset/data/models/asset_model.dart';

abstract class AssetsRemoteDataSource {
  /// Fetches the asset list from the remote server.
  ///
  /// Returns an [AssetModel] containing asset data.
  Future<AssetModel> getAssets(Map<String, dynamic> dataMap);
}

abstract class AllAssetsRemoteDataSource {
  /// Fetches the all assets list from the remote server.
  ///
  /// Returns an [AllAssetsModel] containing all assets data including categories, brands, and assets.
  Future<AllAssetsModel> getAllAssets(Map<String, dynamic> dataMap);
}
