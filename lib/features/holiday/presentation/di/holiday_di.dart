import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/features/holiday/data/data_sources/holiday_remote_data_source.dart';
import 'package:myco_flutter/features/holiday/data/data_sources/holiday_remote_data_source_impl.dart';
import 'package:myco_flutter/features/holiday/data/repositories/holiday_repository_impl.dart';
import 'package:myco_flutter/features/holiday/domain/repositories/holiday_repository.dart';
import 'package:myco_flutter/features/holiday/domain/use_cases/apply_holiday.dart';
import 'package:myco_flutter/features/holiday/domain/use_cases/delete_holiday.dart';
import 'package:myco_flutter/features/holiday/domain/use_cases/get_holiday_list.dart';
import 'package:myco_flutter/features/holiday/presentation/bloc/holiday_bloc.dart';

Future<void> setupHolidayDI(GetIt sl) async {
  // Bloc
  sl.registerFactory(
    () => HolidayBloc(
      getHolidayList: sl(),
      applyHoliday: sl(),
      deleteHoliday: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetHolidayList(repository: sl()));
  sl.registerLazySingleton(() => ApplyHoliday(repository: sl()));
  sl.registerLazySingleton(() => DeleteHoliday(repository: sl()));

  // Repository
  sl.registerLazySingleton<HolidayRepository>(
    () => HolidayRepositoryImpl(sl(), sl()),
  );

  // Data Source
  sl.registerLazySingleton<HolidayRemoteDataSource>(
    () => HolidayRemoteDataSourceImpl(
      dio: sl<Dio>(instanceName: VariableBag.dioWithAuth),
    ),
  );
}
