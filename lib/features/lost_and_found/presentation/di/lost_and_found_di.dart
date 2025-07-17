import 'package:get_it/get_it.dart';
import 'package:myco_flutter/features/lost_and_found/data/datasources/lost_and_found_data_source.dart';
import 'package:myco_flutter/features/lost_and_found/data/datasources/lost_and_found_data_source_impl.dart';
import 'package:myco_flutter/features/lost_and_found/data/repositories/lost_and_found_repository_impl.dart';
import 'package:myco_flutter/features/lost_and_found/domain/repositories/lost_and_found_repository.dart';
import 'package:myco_flutter/features/lost_and_found/domain/usecases/lost_and_found_usecases.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/bloc/lost_and_found_bloc.dart';

void registerLostAndFoundDI(GetIt getIt) {
  // DataSource
  getIt.registerLazySingleton<LostAndFoundDataSource>(
    () => LostAndFoundDataSourceImpl(),
  );

  // Repository
  getIt.registerLazySingleton<LostAndFoundRepository>(
    () => LostAndFoundRepositoryImpl(getIt()),
  );

  // UseCase
  getIt.registerLazySingleton<GetLostAndFoundItemsUseCase>(
    () => GetLostAndFoundItemsUseCase(getIt()),
  );

  // Bloc
  getIt.registerFactory<LostAndFoundBloc>(() => LostAndFoundBloc(getIt()));
}
