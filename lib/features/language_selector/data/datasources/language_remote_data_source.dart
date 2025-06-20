import 'package:myco_flutter/features/language_selector/model/language_response.dart';
import 'package:myco_flutter/features/splash/data/models/app_version_model.dart';

abstract class LanguageRemoteDataSource {
  Future<LanguageResponse> getAppLanguage();
  Future<bool> getAppLanguageValues(String languageId, String societyId);
}