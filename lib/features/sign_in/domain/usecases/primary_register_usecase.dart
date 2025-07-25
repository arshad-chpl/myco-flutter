
import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/sign_in/data/models/request/cancel_pending_profile_request.dart';
import 'package:myco_flutter/features/sign_in/data/models/request/reminder_pending_profile_Request.dart';
import 'package:myco_flutter/features/sign_in/data/models/request/society_list_request.dart';
import 'package:myco_flutter/features/sign_in/data/models/request/view_pending_profile_request.dart';
import 'package:myco_flutter/features/sign_in/domain/entities/view_pending_profile_entity.dart';
import 'package:myco_flutter/features/sign_in/domain/repositories/primary_register_repository.dart';

class PrimaryRegisterUseCase {
  final PrimaryRegisterRepository repository;

  PrimaryRegisterUseCase({required this.repository});

  Future<Either<Failure, CommonResponseModelEntity>> callAddPrimaryUser(Map<String, dynamic> dataMap) async => await repository.addPrimaryUser(dataMap);
  Future<Either<Failure, ViewPendingProfileEntity>> getViewPendingProfile(
      ViewPendingProfileRequest request) async => await repository.getViewPendingProfile(request);
  Future<Either<Failure, CommonResponseModelEntity>> getCancelPendingProfile(
      CancelPendingProfileRequest request) async => await repository.getCancelPendingProfile(request);
  Future<Either<Failure, CommonResponseModelEntity>> getReminderPendingProfile(
      ReminderPendingProfileRequest request) async => await repository.getReminderPendingProfile(request);
  Future<Either<Failure, CommonResponseModelEntity>> getSociety(SocietyListRequest request
      ) async => await repository.getSociety(request);

}