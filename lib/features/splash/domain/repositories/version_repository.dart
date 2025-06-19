// domain/repositories/version_repository.dart

import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/splash/data/models/app_version_model.dart';

import '../entities/app_version.dart';

abstract class VersionRepository {
  Future<Either<Failure,AppVersion>> getAppVersion();
}
