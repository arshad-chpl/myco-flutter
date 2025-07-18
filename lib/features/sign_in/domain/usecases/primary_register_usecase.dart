
import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/sign_in/domain/repositories/primary_register_repository.dart';
import 'package:myco_flutter/features/sign_in/models/view_pending_profile_response.dart';

class PrimaryRegisterUseCase {
  final PrimaryRegisterRepository repository;

  PrimaryRegisterUseCase({required this.repository});

  Future<Either<Failure, CommonResponse>> callAddPrimaryUser(Map<String, dynamic> dataMap) async => await repository.addPrimaryUser(dataMap);
  Future<Either<Failure, ViewPendingProfileResponse>> getViewPendingProfile() async => await repository.getViewPendingProfile();
  Future<Either<Failure, CommonResponse>> getCancelPendingProfile() async => await repository.getCancelPendingProfile();
  Future<Either<Failure, CommonResponse>> getReminderPendingProfile(Map<String, dynamic> dataMap) async => await repository.getReminderPendingProfile(dataMap);
  Future<Either<Failure, CommonResponse>> getSociety(String societyId) async => await repository.getSociety(societyId);

}