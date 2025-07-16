
import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/sign_in/domain/repositories/primary_register_repository.dart';
import 'package:myco_flutter/features/sign_in/models/branch_response.dart';
import 'package:myco_flutter/features/sign_in/models/floor_and_unit_response.dart';
import 'package:myco_flutter/features/sign_in/models/shift_response.dart';

class PrimaryRegisterUseCase {
  final PrimaryRegisterRepository repository;

  PrimaryRegisterUseCase({required this.repository});

  Future<Either<Failure, BranchResponse>> callBranch() async => await repository.getBranchList();
  Future<Either<Failure, FloorAndUnitResponse>> floorList(String branchId) async => await repository.getFloorAndUnit(branchId);
  Future<Either<Failure, ShiftResponse>> callShift(String floorId) async => await repository.getShiftList(floorId);

}