import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/sign_in/domain/entities/view_pending_profile_entity.dart';

abstract class PrimaryRegisterRepository {
  Future<Either<Failure, CommonResponseModelEntity>> addPrimaryUser(Map<String, dynamic> dataMap);
  Future<Either<Failure, ViewPendingProfileEntity>> getViewPendingProfile();
  Future<Either<Failure, CommonResponseModelEntity>> getCancelPendingProfile();
  Future<Either<Failure, CommonResponseModelEntity>> getReminderPendingProfile(Map<String, dynamic> dataMap);
  Future<Either<Failure, CommonResponseModelEntity>> getSociety(String societyId);
}