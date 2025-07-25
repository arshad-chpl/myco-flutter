import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/employees/domain/entites/employee.dart';
import 'package:myco_flutter/features/employees/domain/repositories/employee_repository.dart';

class GetEmployeesUseCase {
  final EmployeeRepository repository;

  GetEmployeesUseCase({required this.repository});

  Future<Either<Failure, List<Employee>>> call(
    GetEmployeesParams params,
  ) async => await repository.getEmployees(
    userId: params.userId,
    societyId: params.societyId,
    blockId: params.blockId,
    floorId: params.floorId,
  );
}

class GetEmployeesParams extends Equatable {
  final String userId;
  final String societyId;
  final String? blockId;
  final String? floorId;

  const GetEmployeesParams({
    required this.userId,
    required this.societyId,
    this.blockId,
    this.floorId,
  });

  @override
  List<Object?> get props => [userId, societyId, blockId, floorId];
}
