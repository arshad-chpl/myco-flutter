import 'package:myco_flutter/features/splash/data/models/app_version_model.dart';

abstract class VersionRemoteDataSource {
  Future<AppVersionModel> getAppVersion();
}