import 'dart:convert';
import 'dart:developer';

import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/asset/data/datasource/asset_data_source.dart';
import 'package:myco_flutter/features/asset/data/models/add_asset_model.dart';
import 'package:myco_flutter/features/asset/data/models/all_assets_model.dart';
import 'package:myco_flutter/features/asset/data/models/asset_model.dart';

class AssetsRemoteDataSourceImpl extends AssetsRemoteDataSource {
  final ApiClient apiClient;

  AssetsRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<AssetModel> getAssets(Map<String, dynamic> dataMap) async {
    final encryptedBody = GzipUtil.encryptAES(json.encode(dataMap));

    final response = await apiClient.postDynamic(
      'assets_controller.php',
      encryptedBody,
    );

    final decrypt = GzipUtil.decryptAES(response);
    log(name: 'response', response);
    return AssetModel.fromJson(json.decode(decrypt));
  }
}

class AllAssetsRemoteDataSourceImpl extends AllAssetsRemoteDataSource {
  final ApiClient apiClient;

  AllAssetsRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<AllAssetsModel> getAllAssets(Map<String, dynamic> dataMap) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final response = await apiClient.postDynamic(
      'assets_controller.php',
      encryptedBody,
    );

    log(GzipUtil.decryptAES(response));
    return AllAssetsModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }
}

class AddAssetDataSourceImpl extends AddAssetDataSource {
  final ApiClient apiClient;

  AddAssetDataSourceImpl({required this.apiClient});

  @override
  Future<AddAssetModel> getAddAsset(Map<String, dynamic> dataMap) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final response = await apiClient.postDynamic(
      'assets_controller.php',
      encryptedBody,
    );

    log(GzipUtil.decryptAES(response));
    return AddAssetModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }
}
