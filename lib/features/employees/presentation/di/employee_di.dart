import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/network/network_info.dart';
import 'package:myco_flutter/features/employees/data/datasources/employee_remote_data_source_impl.dart';
import 'package:myco_flutter/features/employees/data/datasources/employees_remote_data_source.dart';
import 'package:myco_flutter/features/employees/data/repositories/employees_repository_impl.dart';
import 'package:myco_flutter/features/employees/domain/repositories/employee_repository.dart';
import 'package:myco_flutter/features/employees/domain/usecases/get_employees_usecase.dart';
import 'package:myco_flutter/features/employees/domain/usecases/get_user_data_usecase.dart';
import 'package:myco_flutter/features/employees/presentation/bloc/employee_bloc.dart';

Future<void> employeeDi(GetIt sl) async {
  // Remote Data Source
  // sl.registerLazySingleton<EmployeeRemoteDataSource>(
  //   () => EmployeeRemoteDataSourceImpl.new,
  // );

  sl.registerLazySingleton<EmployeeRemoteDataSource>(
    () => EmployeeRemoteDataSourceImpl(
      sl<ApiClient>(instanceName: VariableBag.residentApiNew),
    ),
  );

  // sl.registerLazySingleton<EmployeeRemoteDataSource>(() => ,)

  // Repository
  sl.registerLazySingleton<EmployeeRepository>(
    () => EmployeeRepositoryImpl(
      remoteDataSource: sl<EmployeeRemoteDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetUserDataUseCase(sl<EmployeeRepository>()));
  sl.registerLazySingleton(
    () => GetEmployeesUseCase(repository: sl<EmployeeRepository>()),
  );

  // BLoC
  sl.registerFactory(
    () => EmployeeBloc(
      getUserData: sl<GetUserDataUseCase>(),
      getEmployees: sl<GetEmployeesUseCase>(),
    ),
  );
}
