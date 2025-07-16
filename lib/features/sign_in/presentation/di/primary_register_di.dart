import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/features/sign_in/data/data_source/primary_register_data_source.dart';
import 'package:myco_flutter/features/sign_in/data/data_source/primary_register_data_source_impl.dart';
import 'package:myco_flutter/features/sign_in/data/repositories/primary_register_repository_impl.dart';
import 'package:myco_flutter/features/sign_in/domain/repositories/primary_register_repository.dart';
import 'package:myco_flutter/features/sign_in/domain/usecases/primary_register_usecase.dart';
import 'package:myco_flutter/features/sign_in/presentation/bloc/primary_register_bloc.dart';

Future<void> setupPrimaryRegisterDi(GetIt sl) async {
  // Bloc
  sl.registerFactory(() => PrimaryRegisterBloc(registerUseCase: sl()));

  // Use case
  sl.registerLazySingleton(() => PrimaryRegisterUseCase(repository: sl()));

  // Repository
  sl.registerLazySingleton<PrimaryRegisterRepository>(() => PrimaryRegisterRepositoryImpl(sl(), sl()),);

  // Data sources
  sl.registerLazySingleton<PrimaryRegisterDataSource>(() => PrimaryRegisterDataSourceImpl(dio: sl<Dio>(instanceName: VariableBag.dioWithAuth),));
}