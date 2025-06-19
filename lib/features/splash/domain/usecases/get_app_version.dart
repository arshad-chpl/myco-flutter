import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';

import '../entities/app_version.dart';
import '../repositories/version_repository.dart';

class GetAppVersion {
  final VersionRepository repository;

  GetAppVersion(this.repository);

  Future<Either<Failure, AppVersion>> call() => repository.getAppVersion();
}
