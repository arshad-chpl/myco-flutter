import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/sign_in/data/data_source/primary_register_data_source.dart';
import 'package:myco_flutter/features/sign_in/domain/entities/view_pending_profile_entity.dart';
import 'package:myco_flutter/features/sign_in/domain/repositories/primary_register_repository.dart';


class PrimaryRegisterRepositoryImpl implements PrimaryRegisterRepository {
  final PrimaryRegisterDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  PrimaryRegisterRepositoryImpl(this.remoteDataSource, this.safeApiCall);


  @override
  Future<Either<Failure, CommonResponseModelEntity>> addPrimaryUser(Map<String, dynamic> dataMap) async =>
      safeApiCall.execute(() async {
        final responseModel = await remoteDataSource.addPrimaryUser(dataMap);
        return responseModel.toEntity();
      });

  @override
  Future<Either<Failure, ViewPendingProfileEntity>> getViewPendingProfile() async =>
      safeApiCall.execute(() async {
        final responseModel = await remoteDataSource.getViewPendingProfile();
        return responseModel.toEntity();
      });

  @override
  Future<Either<Failure, CommonResponseModelEntity>> getCancelPendingProfile()  async =>
  safeApiCall.execute(() async {
  final responseModel = await remoteDataSource.getCancelPendingProfile();
  return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, CommonResponseModelEntity>> getReminderPendingProfile(Map<String, dynamic> dataMap)  async =>
  safeApiCall.execute(() async {
  final responseModel = await remoteDataSource.getReminderPendingProfile(dataMap);
  return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, CommonResponseModelEntity>> getSociety(String societyId) async =>
  safeApiCall.execute(() async {
  final responseModel = await remoteDataSource.getSociety(societyId);
  return responseModel.toEntity();
  });


}