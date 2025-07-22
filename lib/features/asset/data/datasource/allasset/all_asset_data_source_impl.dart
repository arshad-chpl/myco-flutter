import 'dart:convert';
import 'dart:developer';

import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/asset/data/datasource/allasset/all_asset_data_source.dart';
import 'package:myco_flutter/features/asset/data/models/all_assets_model.dart';

class AllAssetsRemoteDataSourceImpl extends AllAssetsRemoteDataSource {
  final ApiClient apiClient;

  AllAssetsRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<AllAssetsModel> getAllAssets(Map<String, dynamic> dataMap) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final response = await apiClient.postDynamic(
      'https://dev.my-company.app/india/employeeMobileApi/assets_controller.php',
      encryptedBody,
    );

    log(GzipUtil.decryptAES(response));
    return AllAssetsModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }
}
