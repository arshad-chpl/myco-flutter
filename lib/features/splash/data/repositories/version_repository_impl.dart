// data/repositories/version_repository_impl.dart

import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/splash/data/models/app_version_model.dart';

import '../../domain/entities/app_version.dart';
import '../../domain/repositories/version_repository.dart';
import '../datasources/version_remote_data_source.dart';

class VersionRepositoryImpl implements VersionRepository {
  final VersionRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  VersionRepositoryImpl(this.remoteDataSource, this.safeApiCall);

  @override
  Future<Either<Failure, AppVersion>> getAppVersion() async {
    return safeApiCall.execute(() => remoteDataSource.getAppVersion());
    // final model = await remoteDataSource.getAppVersion();
    // return model.toEntity();
  }
}
