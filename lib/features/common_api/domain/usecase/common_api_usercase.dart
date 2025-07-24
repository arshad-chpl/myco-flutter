
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
  Future<Either<Failure, UploadFileResponseEntity>> uploadAttachments(bool loginType, List<String> filePath)
  async => await repository.uploadAttachments(loginType, filePath);

  Future<Either<Failure, BranchResponseEntity>> callBranch(String companyId, String userId) async => await repository.getBranchList(companyId,userId);
  Future<Either<Failure, FloorAndUnitResponseEntity>> getDepartmentAndDesignation(String companyId, String blockId) async => await repository.getDepartmentAndDesignation(companyId,blockId);
  Future<Either<Failure, ShiftResponseEntity>> callShift(String companyId, String floorId) async => await repository.getShiftList(companyId,floorId);

}