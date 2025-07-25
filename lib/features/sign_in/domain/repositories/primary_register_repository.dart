import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/sign_in/data/models/request/cancel_pending_profile_request.dart';
import 'package:myco_flutter/features/sign_in/data/models/request/reminder_pending_profile_Request.dart';
import 'package:myco_flutter/features/sign_in/data/models/request/society_list_request.dart';
import 'package:myco_flutter/features/sign_in/data/models/request/view_pending_profile_request.dart';
import 'package:myco_flutter/features/sign_in/domain/entities/view_pending_profile_entity.dart';

abstract class PrimaryRegisterRepository {
  Future<Either<Failure, CommonResponseModelEntity>> addPrimaryUser(Map<String, dynamic> dataMap);
  Future<Either<Failure, ViewPendingProfileEntity>> getViewPendingProfile(ViewPendingProfileRequest request);
  Future<Either<Failure, CommonResponseModelEntity>> getCancelPendingProfile(CancelPendingProfileRequest request);
  Future<Either<Failure, CommonResponseModelEntity>> getReminderPendingProfile(ReminderPendingProfileRequest request);
  Future<Either<Failure, CommonResponseModelEntity>> getSociety(SocietyListRequest request);
}