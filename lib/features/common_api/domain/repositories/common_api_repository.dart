import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/common_api/models/branch_response.dart';
import 'package:myco_flutter/features/common_api/models/floor_and_unit_response.dart';
import 'package:myco_flutter/features/common_api/models/shift_response.dart';

abstract class CommonApiRepository {
  Future<Either<Failure, BranchResponse>> getBranchList();
  Future<Either<Failure, FloorAndUnitResponse>> getFloorAndUnit(String branchId);
  Future<Either<Failure, ShiftResponse>> getShiftList(String floorId);
}