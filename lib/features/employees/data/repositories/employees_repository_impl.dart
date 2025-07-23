import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/network/network_info.dart';
import 'package:myco_flutter/features/employees/data/datasources/employees_remote_data_source.dart';
import 'package:myco_flutter/features/employees/domain/entites/branch.dart';
import 'package:myco_flutter/features/employees/domain/entites/department.dart';
import 'package:myco_flutter/features/employees/domain/entites/employee.dart';
import 'package:myco_flutter/features/employees/domain/repositories/employee_repository.dart';

class EmployeeRepositoryImpl extends EmployeeRepository {
  final EmployeeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  EmployeeRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Branch>>> getBranches({
    required String userId,
    required String societyId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteBranches = await remoteDataSource.fetchBranches(
          userId,
          societyId,
        );
        final entities = remoteBranches
            .map((model) => model.toEntity())
            .toList();
        return Right(entities);
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<Department>>> getDepartments({
    required String userId,
    required String societyId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteDepartments = await remoteDataSource.fetchDepartments(
          userId,
          societyId,
        );
        final entities = remoteDepartments
            .map((model) => model.toEntity())
            .toList();
        return Right(entities);
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<Employee>>> getEmployees({
    required String userId,
    required String societyId,
    String? blockId,
    String? floorId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteEmployees = await remoteDataSource.fetchEmployees(
          userId: userId,
          societyId: societyId,
          blockId: blockId,
          floorId: floorId,
        );
        final entities = remoteEmployees
            .map((model) => model.toEntity())
            .toList();
        return Right(entities);
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }
}
