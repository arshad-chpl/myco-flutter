import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/sign_in/data/data_source/primary_register_data_source.dart';
import 'package:myco_flutter/features/sign_in/domain/repositories/primary_register_repository.dart';
import 'package:myco_flutter/features/sign_in/models/view_pending_profile_response.dart';


class PrimaryRegisterRepositoryImpl implements PrimaryRegisterRepository {
  final PrimaryRegisterDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  PrimaryRegisterRepositoryImpl(this.remoteDataSource, this.safeApiCall);


  @override
  Future<Either<Failure, CommonResponse>> addPrimaryUser(Map<String, dynamic> dataMap) async => safeApiCall.execute(() => remoteDataSource.addPrimaryUser(dataMap));

  @override
  Future<Either<Failure, ViewPendingProfileResponse>> getViewPendingProfile() async => safeApiCall.execute(remoteDataSource.getViewPendingProfile);

  @override
  Future<Either<Failure, CommonResponse>> getCancelPendingProfile() async => safeApiCall.execute(remoteDataSource.getCancelPendingProfile);

  @override
  Future<Either<Failure, CommonResponse>> getReminderPendingProfile(Map<String, dynamic> dataMap) async => safeApiCall.execute(() => remoteDataSource.getReminderPendingProfile(dataMap));

  @override
  Future<Either<Failure, CommonResponse>> getSociety(String societyId) async => safeApiCall.execute(() => remoteDataSource.getSociety(societyId));


}