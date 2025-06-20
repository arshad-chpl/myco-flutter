// import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/language_selector/data/datasources/language_remote_data_source.dart';
import 'package:myco_flutter/features/language_selector/domain/repositories/language_repository.dart';
import 'package:myco_flutter/features/language_selector/model/language_response.dart';


class LanguageRepositoryImpl extends LanguageRepository {
  LanguageRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  LanguageRepositoryImpl(this.safeApiCall, this.remoteDataSource);

  @override
  Future<Either<Failure, LanguageResponse>> getAppLanguage() async =>
      safeApiCall.execute(() async => remoteDataSource.getAppLanguage());

  @override
  Future<Either<Failure, bool>> getAppLanguageValues(
    String languageId,
    String societyId,
  ) async => safeApiCall.execute(
    () => remoteDataSource.getAppLanguageValues(languageId, societyId),
  );
}
