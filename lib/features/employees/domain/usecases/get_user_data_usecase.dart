import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/employees/domain/entites/branch.dart';
import 'package:myco_flutter/features/employees/domain/entites/department.dart';
import 'package:myco_flutter/features/employees/domain/entites/employee.dart';
import 'package:myco_flutter/features/employees/domain/repositories/employee_repository.dart';

class GetUserDataUseCase {
  final EmployeeRepository repo;

  GetUserDataUseCase(this.repo);

  Future<
    Either<Failure, Tuple3<List<Branch>, List<Department>, List<Employee>>>
  >
  call({required String userId, required String societyId}) async {
    final branchesResult = await repo.getBranches(
      userId: userId,
      societyId: societyId,
    );

    final departmentsResult = await repo.getDepartments(
      userId: userId,
      societyId: societyId,
    );

    final employeesResult = await repo.getEmployees(
      userId: userId,
      societyId: societyId,
    );

    if (branchesResult.isLeft()) {
      return Left(
        branchesResult.fold((l) => l, (r) => throw UnimplementedError()),
      );
    }
    if (departmentsResult.isLeft()) {
      return Left(
        departmentsResult.fold((l) => l, (r) => throw UnimplementedError()),
      );
    }
    if (employeesResult.isLeft()) {
      return Left(
        employeesResult.fold((l) => l, (r) => throw UnimplementedError()),
      );
    }

    // If all succeed, extract the Right values
    final branches = branchesResult.getOrElse(() => []);
    final departments = departmentsResult.getOrElse(() => []);
    final employees = employeesResult.getOrElse(() => []);

    return Right(Tuple3(branches, departments, employees));
  }
}
