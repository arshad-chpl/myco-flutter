import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/device_change_remote_data_source.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/device_change_remote_data_source_impl.dart';
import 'package:myco_flutter/features/company_selector/data/repositories/device_change_repository_impl.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/request_device_change_repository.dart';
import 'package:myco_flutter/features/company_selector/domain/usecases/request_device_change.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/device_change/device_change_bloc.dart';

Future<void> setupDeviceChangeDi(GetIt sl) async {
  sl.registerLazySingleton<DeviceChangeRemoteDataSource>(
    () => DeviceChangeRemoteDataSourceImpl(
      dio: sl<Dio>(instanceName: VariableBag.dioWithAuth),
    ),
  );

  sl.registerLazySingleton<RequestDeviceChangeRepository>(
    () => DeviceChangeRepositoryImpl(sl(), sl()),
  );

  sl.registerLazySingleton<RequestDeviceChange>(
    () => RequestDeviceChange(repository: sl()),
  );

  // Bloc
  sl.registerFactory<DeviceChangeBloc>(
    () => DeviceChangeBloc(requestDeviceChange: sl()),
  );
}