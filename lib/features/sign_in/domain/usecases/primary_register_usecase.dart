
import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/sign_in/domain/entities/view_pending_profile_entity.dart';
import 'package:myco_flutter/features/sign_in/domain/repositories/primary_register_repository.dart';

class PrimaryRegisterUseCase {
  final PrimaryRegisterRepository repository;

  PrimaryRegisterUseCase({required this.repository});

  Future<Either<Failure, CommonResponseModelEntity>> callAddPrimaryUser(Map<String, dynamic> dataMap) async => await repository.addPrimaryUser(dataMap);
  Future<Either<Failure, ViewPendingProfileEntity>> getViewPendingProfile() async => await repository.getViewPendingProfile();
  Future<Either<Failure, CommonResponseModelEntity>> getCancelPendingProfile() async => await repository.getCancelPendingProfile();
  Future<Either<Failure, CommonResponseModelEntity>> getReminderPendingProfile(Map<String, dynamic> dataMap) async => await repository.getReminderPendingProfile(dataMap);
  Future<Either<Failure, CommonResponseModelEntity>> getSociety(String societyId) async => await repository.getSociety(societyId);

}