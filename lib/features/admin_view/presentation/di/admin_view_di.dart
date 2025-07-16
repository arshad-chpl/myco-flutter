import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/network/network_info.dart';
import 'package:myco_flutter/core/services/cache_service.dart';
import 'package:myco_flutter/features/admin_view/data/data_source/admin_view_local_data_source.dart';
import 'package:myco_flutter/features/admin_view/data/data_source/admin_view_local_data_source_impl.dart';
import 'package:myco_flutter/features/admin_view/data/data_source/admin_view_remote_data_source.dart';
import 'package:myco_flutter/features/admin_view/data/data_source/admin_view_remote_data_source_impl.dart';
import 'package:myco_flutter/features/admin_view/data/repositories/admin_view_repository_impl.dart';
import 'package:myco_flutter/features/admin_view/domain/repositories/admin_view_repository.dart';
import 'package:myco_flutter/features/admin_view/domain/usecases/get_admin_view.dart';
import 'package:myco_flutter/features/admin_view/domain/usecases/get_cached_admin_view.dart';
import 'package:myco_flutter/features/admin_view/presentation/bloc/admin_view_bloc.dart';

Future<void> adminViewDi(GetIt sl) async {
  // BLoC
  sl.registerFactory(
    () => AdminViewBloc(
      getAdminViewUseCase: sl(),
      getCachedAdminViewUseCase: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetAdminViewUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetCachedAdminViewUseCase(repository: sl()));

  // Repository
  sl.registerLazySingleton<AdminViewRepository>(
    () => AdminViewRepositoryImpl(
      remoteDataSource: sl<AdminViewRemoteDataSource>(),
      localDataSource: sl<AdminViewLocalDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<AdminViewRemoteDataSource>(
    AdminViewRemoteDataSourceImpl(sl<ApiClient>(instanceName: VariableBag.employeeMobileApi)),
  );
  sl.registerLazySingleton<AdminViewLocalDataSource>(
    () => AdminViewLocalDataSourceImpl(cacheService: sl<CacheService>()),
  );
}
