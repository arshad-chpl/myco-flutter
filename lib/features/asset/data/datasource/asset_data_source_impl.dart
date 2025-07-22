import 'dart:convert';

import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/asset/data/datasource/asset_data_source.dart';
import 'package:myco_flutter/features/asset/data/models/asset_model.dart';

class AssetsRemoteDataSourceImpl extends AssetsRemoteDataSource {
  final ApiClient apiClient;

  AssetsRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<AssetModel> getAssets(Map<String, dynamic> dataMap) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final response = await apiClient.postDynamic(
      'https://dev.my-company.app/india/employeeMobileApi/assets_controller.php',
      encryptedBody,
    );
    return AssetModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }
}
