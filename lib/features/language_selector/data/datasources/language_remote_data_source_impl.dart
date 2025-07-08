// data/data_source/version_remote_data_source_impl.dart

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/features/language_selector/data/datasources/language_remote_data_source.dart';
import 'package:myco_flutter/features/language_selector/model/language_response.dart';

class LanguageRemoteDataSourceImpl implements LanguageRemoteDataSource {
  final Dio dio;

  LanguageRemoteDataSourceImpl(this.dio);

  @override
  Future<LanguageResponse> getAppLanguage() async {

    final dataMap = {
      'getLanguageNew': 'getLanguageNew',
      'country_id': '101'};
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.masterAPICall,
    ).postDynamic('versionControllerEnc.php', encryptedBody);
    return LanguageResponse.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }
  
  @override
  Future<bool> getAppLanguageValues(String languageId, String societyId) async{
       final dataMap = {
      'getLanguageValues': 'getLanguageValues',
      'language_id': languageId,
      'society_id': societyId,
      'country_id': '101',
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
          final response = await GetIt.I<ApiClient>(
        instanceName: VariableBag.masterAPICall,
      ).postDynamic('language_controller.php', encryptedBody);

            if (response.isNotEmpty) {
        final jsonMap = jsonDecode(response);

        final preference = GetIt.I<PreferenceManager>();
        preference.writeString(VariableBag.appLanguage, jsonEncode(jsonMap));
        preference.setLanguageId(languageId);
        LanguageManager().loadTranslations(jsonMap);
        return true;
      } else {
        return false;
      }
  }
}
