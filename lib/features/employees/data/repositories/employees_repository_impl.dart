// import 'package:dartz/dartz.dart';
// import 'package:myco_flutter/core/error/failure.dart';
// import 'package:myco_flutter/core/utils/safe_api_call.dart';
// import 'package:myco_flutter/features/employees/data/datasources/employees_remote_data_source.dart';
// import 'package:myco_flutter/features/employees/domain/entities/employee_response.dart';
// import 'package:myco_flutter/features/employees/domain/repositories/employees_repository.dart';
//
// class EmployeesRepositoryImpl extends EmployeesRepository {
//   final EmployeesRemoteDataSource remoteDataSource;
//   final SafeApiCall safeApiCall;
//
//   EmployeesRepositoryImpl(this.safeApiCall, this.remoteDataSource);
//
//   @override
//   Future<Either<Failure, EmployeeResponse>> fetchEmployees() async {
//     return safeApiCall.execute(() => remoteDataSource.fetchEmployees());
//   }
// }
