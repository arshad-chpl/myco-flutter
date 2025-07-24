import 'package:get_it/get_it.dart';
import 'package:myco_flutter/features/work_allocation/data/data_source/work_allocation_remote_data_source.dart';
import 'package:myco_flutter/features/work_allocation/data/data_source/work_allocation_remote_data_source_impl.dart';
import 'package:myco_flutter/features/work_allocation/data/repositories/work_allocation_repository_impl.dart';
import 'package:myco_flutter/features/work_allocation/domain/repositories/work_allocation_repository.dart';
import 'package:myco_flutter/features/work_allocation/domain/usecases/work_allocation_use_case.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/assign_work_bloc.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation/work_allocation_bloc.dart';

Future<void> setUpWorkAllocationDI(GetIt sl) async {
  sl.registerFactory(() => AssignWorkBloc(useCase: sl()));
  sl.registerFactory(() => WorkAllocationBloc(sl()));

  sl.registerLazySingleton(() => WorkAllocationUseCase(repository: sl()));

  sl.registerLazySingleton<WorkAllocationRepository>(
    () => WorkAllocationRepositoryImpl(sl(), sl()),
  );

  sl.registerLazySingleton<WorkAllocationRemoteDataSource>(
    WorkAllocationRemoteDataSourceImpl.new,
  );
}
