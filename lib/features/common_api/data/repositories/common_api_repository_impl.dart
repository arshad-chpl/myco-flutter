import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/common_api/data/data_source/common_api_data_source.dart';
import 'package:myco_flutter/features/common_api/domain/repositories/common_api_repository.dart';
import 'package:myco_flutter/features/common_api/models/branch_response.dart';
import 'package:myco_flutter/features/common_api/models/floor_and_unit_response.dart';
import 'package:myco_flutter/features/common_api/models/shift_response.dart';


class CommonApiRepositoryImpl implements CommonApiRepository {
  final CommonApiDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  CommonApiRepositoryImpl(this.remoteDataSource, this.safeApiCall);

  @override
  Future<Either<Failure, BranchResponse>> getBranchList() async => safeApiCall.execute(remoteDataSource.getBranchList);

  @override
  Future<Either<Failure, FloorAndUnitResponse>> getFloorAndUnit(String branchId) async => safeApiCall.execute(() => remoteDataSource.getFloorAndUnit(branchId));

  @override
  Future<Either<Failure, ShiftResponse>> getShiftList(String floorId) async => safeApiCall.execute(() => remoteDataSource.getShiftList(floorId));
}