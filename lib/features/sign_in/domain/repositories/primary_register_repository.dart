import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/sign_in/models/view_pending_profile_response.dart';

abstract class PrimaryRegisterRepository {
  Future<Either<Failure, CommonResponse>> addPrimaryUser(Map<String, dynamic> dataMap);
  Future<Either<Failure, ViewPendingProfileResponse>> getViewPendingProfile();
  Future<Either<Failure, CommonResponse>> getCancelPendingProfile();
  Future<Either<Failure, CommonResponse>> getReminderPendingProfile(Map<String, dynamic> dataMap);
  Future<Either<Failure, CommonResponse>> getSociety(String societyId);
}