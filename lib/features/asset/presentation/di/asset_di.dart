import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/asset/data/datasource/asset_data_source.dart';
import 'package:myco_flutter/features/asset/data/datasource/asset_data_source_impl.dart';
import 'package:myco_flutter/features/asset/data/repositories/asset_repository_impl.dart';
import 'package:myco_flutter/features/asset/domain/repositories/asset_repository.dart';
import 'package:myco_flutter/features/asset/domain/usecases/asset_usecases.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/assets_bloc.dart';

void registerAssetsModule(GetIt sl) {
  sl.registerLazySingleton<AssetsRemoteDataSource>(
    () => AssetsRemoteDataSourceImpl(
      apiClient: sl<ApiClient>(instanceName: VariableBag.masterAPICall),
    ),
  );

  sl.registerLazySingleton<AssetsRepository>(
    () => AssetsRepositoryImpl(sl(), remoteDataSource: sl()),
  );

  sl.registerLazySingleton<AssetsUseCases>(
    () => AssetsUseCases(repository: sl()),
  );

  sl.registerFactory(() => AssetsBloc(sl()));
}
