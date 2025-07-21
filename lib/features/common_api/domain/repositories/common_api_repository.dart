import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/common_api/domain/entities/Branch_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/entities/floor_and_unit_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/entities/shift_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/entities/uploaded_file_response_entity.dart';

abstract class CommonApiRepository {
  Future<Either<Failure, UploadFileResponseEntity>> uploadedTemp(bool loginType, List<String> filePath);

  Future<Either<Failure, BranchResponseEntity>> getBranchList();
  Future<Either<Failure, FloorAndUnitResponseEntity>> getFloorAndUnit(String branchId);
  Future<Either<Failure, ShiftResponseEntity>> getShiftList(String floorId);
}