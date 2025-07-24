import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/common_api/data/data_source/common_api_data_source.dart';
import 'package:myco_flutter/features/common_api/domain/entities/Branch_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/entities/floor_and_unit_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/entities/shift_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/entities/uploaded_file_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/repositories/common_api_repository.dart';


class CommonApiRepositoryImpl implements CommonApiRepository {
  final CommonApiDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  CommonApiRepositoryImpl(this.remoteDataSource, this.safeApiCall);

  @override
  Future<Either<Failure, UploadFileResponseEntity>> uploadedTemp(bool loginType, List<String> filePath) async =>
      safeApiCall.execute(() async {
        final responseModel = await remoteDataSource.uploadedTemp(loginType, filePath);
        return responseModel.toEntity();
      });


  @override
  Future<Either<Failure, BranchResponseEntity>> getBranchList(String societyId, String userId) async =>
      safeApiCall.execute(() async {
        final responseModel = await remoteDataSource.getBranchList(societyId,userId);
        return responseModel.toEntity();
      });


  @override
  Future<Either<Failure, FloorAndUnitResponseEntity>> getFloorAndUnit(String societyId, String blockId) async =>
      safeApiCall.execute(() async {
        final responseModel = await remoteDataSource.getFloorAndUnit(societyId,blockId);
        return responseModel.toEntity();
      });


  @override
  Future<Either<Failure, ShiftResponseEntity>> getShiftList(String societyId, String floorId) async =>
      safeApiCall.execute(() async {
        final responseModel = await remoteDataSource.getShiftList(societyId,floorId);
        return responseModel.toEntity();
      });

}