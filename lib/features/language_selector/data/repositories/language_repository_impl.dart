import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/language_selector/model/language_response.dart';
import 'package:myco_flutter/features/language_selector/repositories/language_repository.dart';

class LanguageRepositoryImpl extends LanguageRepository {
  final SafeApiCall safeApiCall;

  LanguageRepositoryImpl(this.safeApiCall);

  @override
  Future<Either<Failure,LanguageResponse>> getAppLanguage() async {
    // Prepare encrypted request body
    final dataMap = {
      'getLanguageNew': 'getLanguageNew',
      'country_id': '101'};
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
return safeApiCall.execute(() async =>LanguageResponse.fromJson(
        json.decode(
          GzipUtil.decryptAES(
            (await GetIt.I<ApiClient>(
              instanceName: VariableBag.masterAPICall,
            ).postDynamic('language_controller.php', encryptedBody)),
          ),
        ),
      ));
  }


  @override
  Future<Either<Failure,bool>> getAppLanguageValues(String languageId, String societyId) async {
    // Prepare encrypted request body
    final dataMap = {
      'getLanguageValues': 'getLanguageValues',
      'language_id': languageId,
      'society_id': societyId,
      'country_id': '101',
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    safeApiCall.execute((){ });
    try {
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
    } on AppErrorHandler catch (e) {
      AppErrorHandler.showError(e.toString());
      rethrow;
    }
  }
}
