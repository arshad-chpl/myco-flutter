import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/network/network_info.dart';
import 'package:myco_flutter/core/services/cache_service.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/dashboard/data/datasources/dashboard_local_data_source.dart';
import 'package:myco_flutter/features/dashboard/data/datasources/dashboard_local_data_source_impl.dart';
import 'package:myco_flutter/features/home_screen/bloc/bottom_navigation_bar_bloc.dart';
import 'package:myco_flutter/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:myco_flutter/features/dashboard/data/datasources/dashboard_remote_data_source_impl.dart';
import 'package:myco_flutter/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:myco_flutter/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:myco_flutter/features/dashboard/domain/usecases/dashboard_usecases.dart';
import 'package:myco_flutter/features/dashboard/presentation/bloc/dashboard_bloc.dart';

Future<void> DashboardDi(GetIt sl) async {
  sl.registerLazySingleton<DashboardLocalDataSource>(
    () => DashboardLocalDataSourceImpl(
      cacheService: sl<CacheService>(),
    ),
  );
  sl.registerLazySingleton<DashboardRemoteDataSource>(
    () => DashboardRemoteDataSourceImpl(
      apiClient: sl<ApiClient>(instanceName: VariableBag.residentApiNew),
      masterApiClient: sl<ApiClient>(instanceName: VariableBag.masterAPICall),
      safeApiCall: sl<SafeApiCall>(),
    ),
  );
  sl.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(
      
      remoteDataSource: sl<DashboardRemoteDataSource>(),
      localDataSource: sl<DashboardLocalDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );
  sl.registerLazySingleton<DashboardUsecases>(
    () => DashboardUsecases(repository: sl<DashboardRepository>()),
  );
  sl.registerFactory<BottomNavigationBarBloc>(
    BottomNavigationBarBloc.new,
  );
  sl.registerFactory<DashboardBloc>(
    () => DashboardBloc(sl<DashboardUsecases>()),
  );
}
