import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/sign_in/data/data_source/primary_register_data_source.dart';
import 'package:myco_flutter/features/sign_in/domain/repositories/primary_register_repository.dart';
import 'package:myco_flutter/features/sign_in/models/branch_response.dart';
import 'package:myco_flutter/features/sign_in/models/floor_and_unit_response.dart';
import 'package:myco_flutter/features/sign_in/models/shift_response.dart';


class PrimaryRegisterRepositoryImpl implements PrimaryRegisterRepository {
  final PrimaryRegisterDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  PrimaryRegisterRepositoryImpl(this.remoteDataSource, this.safeApiCall);

  @override
  Future<Either<Failure, BranchResponse>> getBranchList() async => safeApiCall.execute(() => remoteDataSource.getBranchList());

  Future<Either<Failure, FloorAndUnitResponse>> getFloorAndUnit(String branchId) async => safeApiCall.execute(() => remoteDataSource.getFloorAndUnit(branchId));

  Future<Either<Failure, ShiftResponse>> getShiftList(String floorId) async => safeApiCall.execute(() => remoteDataSource.getShiftList(floorId));


}