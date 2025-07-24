import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/employees/domain/entites/branch.dart';
import 'package:myco_flutter/features/employees/domain/entites/department.dart';
import 'package:myco_flutter/features/employees/domain/entites/employee.dart';

/// Abstract contract for employee-related data sources.
abstract class EmployeeRepository {
  /// Fetches all branches (blocks) available to the user.
  Future<Either<Failure, List<Branch>>> getBranches({
    required String userId,
    required String societyId,
  });

  /// Fetches all departments (floors) for the user.
  Future<Either<Failure, List<Department>>> getDepartments({
    required String userId,
    required String societyId,
  });

  /// Fetches employees filtered by user and optionally by block/floor.
  Future<Either<Failure, List<Employee>>> getEmployees({
    required String userId,
    required String societyId,
    String? blockId,
    String? floorId,
  });
}
