import 'package:get_it/get_it.dart';
import 'package:myco_flutter/features/appointments/data/data_source/appointment_remote_data_source.dart';
import 'package:myco_flutter/features/appointments/data/data_source/appointment_remote_data_source_impl.dart';
import 'package:myco_flutter/features/appointments/data/repositories/appointment_repository_impl.dart';
import 'package:myco_flutter/features/appointments/domain/repositories/appointment_repository.dart';
import 'package:myco_flutter/features/appointments/domain/usecases/appointment_usecase.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_bloc.dart';

Future<void> appointmentDi(GetIt sl) async {
  //bloc
  sl.registerFactory(() => AppointmentBloc(sl<AppointmentUseCase>()));

  //use case
  sl.registerLazySingleton(() => AppointmentUseCase(repository: sl()));

  //repository
  sl.registerLazySingleton<AppointmentRepository>(
        () => AppointmentRepositoryImpl(sl(), sl())
  );

  //data source
  sl.registerLazySingleton<AppointmentRemoteDataSource>(
    AppointmentRemoteDataSourceImpl.new,
  );
}

