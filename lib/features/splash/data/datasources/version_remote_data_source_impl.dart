// data/datasources/version_remote_data_source_impl.dart

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import '../models/app_version_model.dart';
import 'version_remote_data_source.dart';

class VersionRemoteDataSourceImpl implements VersionRemoteDataSource {
ApiClient apiClient;
  VersionRemoteDataSourceImpl(this.apiClient);

  @override
  Future<AppVersionModel> getAppVersion() async {
    final dataMap = {
      'getVersion': 'getVersion',
      'version_app': '1',
      'society_id': '',
      'mobile_app': '1',
    };
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));

    final response = await apiClient.postDynamic('versionControllerEnc.php', encryptedBody);
    return AppVersionModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }
}
