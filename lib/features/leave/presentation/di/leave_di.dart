import 'package:get_it/get_it.dart';
import 'package:myco_flutter/features/leave/data/datasources/leave_remote_data_source.dart';
import 'package:myco_flutter/features/leave/data/datasources/leave_remote_data_source_impl.dart';
import 'package:myco_flutter/features/leave/data/repositories/leave_repository_impl.dart';
import 'package:myco_flutter/features/leave/domain/repositories/leave_repository.dart';
import 'package:myco_flutter/features/leave/domain/use_case/leave_use_case.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_bloc.dart';

Future<void>setUpLeaveDI(GetIt sl) async{

  sl.registerFactory(() => LeaveBloc(sl<LeaveUseCase>()));

  sl.registerLazySingleton(() => LeaveUseCase(repository: sl()));

  sl.registerLazySingleton<LeaveRepository>(() => LeaveRepositoryImpl(sl(), sl()),);

  sl.registerLazySingleton<LeaveRemoteDataSource>(LeaveRemoteDataSourceImpl.new,);

}