// data/datasources/version_remote_data_source_impl.dart

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/language_selector/data/datasources/language_remote_data_source.dart';
import 'package:myco_flutter/features/splash/data/models/app_version_model.dart';

class LanguageRemoteDataSourceImpl implements LanguageRemoteDataSource {
  final Dio dio;

  LanguageRemoteDataSourceImpl(this.dio);

  @override
  Future<AppVersionModel> getAppVersion() async {
    final dataMap = {
      'getVersion': 'getVersion',
      'version_app': '1',
      'society_id': '',
      'mobile_app': '1',
    };
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.masterAPICall,
    ).postDynamic('versionControllerEnc.php', encryptedBody);
    return AppVersionModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }
}
