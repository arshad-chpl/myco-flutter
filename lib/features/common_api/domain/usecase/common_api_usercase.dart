
import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/common_api/domain/repositories/common_api_repository.dart';
import 'package:myco_flutter/features/common_api/models/branch_response.dart';
import 'package:myco_flutter/features/common_api/models/floor_and_unit_response.dart';
import 'package:myco_flutter/features/common_api/models/shift_response.dart';

class CommonApiUserCase {
  final CommonApiRepository repository;

  CommonApiUserCase({required this.repository});

  Future<Either<Failure, BranchResponse>> callBranch() async => await repository.getBranchList();
  Future<Either<Failure, FloorAndUnitResponse>> floorList(String branchId) async => await repository.getFloorAndUnit(branchId);
  Future<Either<Failure, ShiftResponse>> callShift(String floorId) async => await repository.getShiftList(floorId);

}