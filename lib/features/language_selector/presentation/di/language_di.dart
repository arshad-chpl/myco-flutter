import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/language_selector/data/datasources/language_remote_data_source.dart';
import 'package:myco_flutter/features/language_selector/data/datasources/language_remote_data_source_impl.dart';
import 'package:myco_flutter/features/language_selector/data/repositories/language_repository_impl.dart';
import 'package:myco_flutter/features/language_selector/domain/repositories/language_repository.dart';
import 'package:myco_flutter/features/language_selector/presentation/bloc/language_bloc.dart';

Future<void> setupLanguageDI(GetIt sl) async {
  // Register the LanguageRemoteDataSource
  sl.registerLazySingleton<LanguageRemoteDataSource>(
    () => LanguageRemoteDataSourceImpl(sl<Dio>(instanceName: VariableBag.dioWithAuth)),
  );

  // Register the LanguageRepository with its implementation
  sl.registerLazySingleton<LanguageRepository>(
    () => LanguageRepositoryImpl(sl<SafeApiCall>(), sl<LanguageRemoteDataSource>()),
  );

  sl.registerFactory(()=>LanguageBloc(sl<LanguageRepository>()));


}