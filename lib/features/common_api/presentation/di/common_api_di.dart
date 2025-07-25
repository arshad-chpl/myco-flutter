import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/features/common_api/data/data_source/common_api_data_source.dart';
import 'package:myco_flutter/features/common_api/data/data_source/common_api_data_source_impl.dart';
import 'package:myco_flutter/features/common_api/data/repositories/common_api_repository_impl.dart';
import 'package:myco_flutter/features/common_api/domain/repositories/common_api_repository.dart';
import 'package:myco_flutter/features/common_api/domain/usecase/common_api_usercase.dart';
import 'package:myco_flutter/features/common_api/presentation/bloc/common_api_bloc.dart';

Future<void> CommonApiDi(GetIt sl) async {
  // Bloc
  sl.registerFactory(() => CommonApiBloc(commonApiUserCase: sl()));

  // Use case
  sl.registerLazySingleton(() => CommonApiUserCase(repository: sl()));

  // Repository
  sl.registerLazySingleton<CommonApiRepository>(() => CommonApiRepositoryImpl(sl(), sl()));

  // Data sources
  sl.registerLazySingleton<CommonApiDataSource>(() => CommonApiDataSourceImpl(dio: sl<Dio>(instanceName: VariableBag.dioWithAuth)));
}