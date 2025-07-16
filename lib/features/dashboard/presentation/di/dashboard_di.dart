import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:myco_flutter/features/dashboard/data/datasources/dashboard_remote_data_source_impl.dart';
import 'package:myco_flutter/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:myco_flutter/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:myco_flutter/features/dashboard/domain/usecases/dashboard_usecases.dart';
import 'package:myco_flutter/features/dashboard/presentation/bloc/dashboard_bloc.dart';

Future<void> DashboardDi(GetIt sl) async {
  sl.registerLazySingleton<DashboardRemoteDataSource>(
    () => DashboardRemoteDataSourceImpl(
      apiClient: sl<ApiClient>(instanceName: VariableBag.residentApiNew),
    ),
  );
  sl.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(
      sl<SafeApiCall>(),
      remoteDataSource: sl<DashboardRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<DashboardUsecases>(
    () => DashboardUsecases(repository: sl<DashboardRepository>()),
  );
  sl.registerFactory<DashboardBloc>(
    () => DashboardBloc(sl<DashboardUsecases>()),
  );
}
