
import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/common_api/data/models/request/branch_list_request.dart';
import 'package:myco_flutter/features/common_api/data/models/request/department_and_designation_list_request.dart';
import 'package:myco_flutter/features/common_api/data/models/request/shift_list_request.dart';
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

  Future<Either<Failure, BranchResponseEntity>> callBranch(BranchListRequest request) async => await repository.getBranchList(request);
  Future<Either<Failure, FloorAndUnitResponseEntity>> getDepartmentAndDesignation(DepartmentAndDesignationListRequest request) async =>
      await repository.getDepartmentAndDesignation(request);
  Future<Either<Failure, ShiftResponseEntity>> callShift(ShiftListRequest request) async => await repository.getShiftList(request);

}