import 'package:get_it/get_it.dart';
import 'package:myco_flutter/features/splash/data/datasources/version_remote_data_source.dart';
import 'package:myco_flutter/features/splash/data/datasources/version_remote_data_source_impl.dart';
import 'package:myco_flutter/features/splash/data/repositories/version_repository_impl.dart';
import 'package:myco_flutter/features/splash/domain/repositories/version_repository.dart';
import 'package:myco_flutter/features/splash/domain/usecases/get_app_version.dart';
import 'package:myco_flutter/features/splash/presentation/bloc/splash_bloc.dart';

void splashDi(GetIt sl) {
  // Data sources
  sl.registerLazySingleton<VersionRemoteDataSource>(
    () => VersionRemoteDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<VersionRepository>(
    () => VersionRepositoryImpl(sl(),sl()),
  );

  // Use Case
  sl.registerLazySingleton(() => GetAppVersion(sl()));
// Bloc
  sl.registerFactory(() => SplashBloc(sl<GetAppVersion>()));
}
