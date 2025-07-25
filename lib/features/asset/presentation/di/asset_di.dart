import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/asset/data/datasource/asset_data_source.dart';
import 'package:myco_flutter/features/asset/data/datasource/asset_data_source_impl.dart';
import 'package:myco_flutter/features/asset/data/repositories/asset_repository_impl.dart';
import 'package:myco_flutter/features/asset/domain/repositories/asset_repository.dart';
import 'package:myco_flutter/features/asset/domain/usecases/asset_usecases.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/add_asset/add_asset_bloc.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/assets_bloc.dart';

void setUpAssetModule(GetIt sl) {
  sl.registerLazySingleton<AssetsRemoteDataSource>(
    () => AssetsRemoteDataSourceImpl(
      apiClient: sl<ApiClient>(instanceName: VariableBag.employeeMobileApi),
    ),
  );

  sl.registerLazySingleton<AssetsRepository>(
    () => AssetsRepositoryImpl(sl(), remoteDataSource: sl()),
  );

  sl.registerLazySingleton<AssetsUseCases>(
    () => AssetsUseCases(repository: sl()),
  );

  sl.registerFactory(() => AssetsBloc(sl(), sl()));

  sl.registerLazySingleton<AllAssetsRemoteDataSource>(
    () => AllAssetsRemoteDataSourceImpl(
      apiClient: sl<ApiClient>(instanceName: VariableBag.employeeMobileApi),
    ),
  );

  sl.registerLazySingleton<AllAssetsRepository>(
    () => AllAssetsRepositoryImpl(sl(), remoteDataSource: sl()),
  );

  sl.registerLazySingleton<AllAssetsUseCases>(
    () => AllAssetsUseCases(repository: sl()),
  );

  // Get Add Asset
  sl.registerLazySingleton<AddAssetDataSource>(
    () => AddAssetDataSourceImpl(
      apiClient: sl<ApiClient>(instanceName: VariableBag.employeeMobileApi),
    ),
  );

  sl.registerLazySingleton<AddAssetRepository>(
    () => AddAssetRepositoryImpl(sl(), remoteDataSource: sl()),
  );

  sl.registerLazySingleton<AddAssetUseCases>(
    () => AddAssetUseCases(repository: sl()),
  );

  sl.registerFactory(() => AddAssetBloc(sl()));
}
