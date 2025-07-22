
import 'package:myco_flutter/features/asset/data/models/asset_model.dart';

abstract class AssetsRemoteDataSource {
  /// Fetches the asset list from the remote server.
  ///
  /// Returns an [AssetModel] containing asset data.
  Future<AssetModel> getAssets(Map<String, dynamic> dataMap);
}
