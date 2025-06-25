import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/features/language_selector/model/language_response.dart';

abstract class LanguageRepository {
  Future<Either<Failure,LanguageResponse>> getAppLanguage();

  Future<Either<Failure,bool>> getAppLanguageValues(String languageId, String societyId);
}
