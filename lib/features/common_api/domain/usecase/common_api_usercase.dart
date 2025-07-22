
import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/common_api/domain/entities/Branch_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/entities/floor_and_unit_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/entities/shift_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/entities/uploaded_file_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/repositories/common_api_repository.dart';

class CommonApiUserCase {
  final CommonApiRepository repository;

  CommonApiUserCase({required this.repository});

  //uploaded image pdf
  Future<Either<Failure, UploadFileResponseEntity>> uploadedTemp(bool loginType, List<String> filePath)
  async => await repository.uploadedTemp(loginType, filePath);

  Future<Either<Failure, BranchResponseEntity>> callBranch(String societyId, String userId) async => await repository.getBranchList(societyId,userId);
  Future<Either<Failure, FloorAndUnitResponseEntity>> floorList(String societyId, String blockId) async => await repository.getFloorAndUnit(societyId,blockId);
  Future<Either<Failure, ShiftResponseEntity>> callShift(String societyId, String floorId) async => await repository.getShiftList(societyId,floorId);

}