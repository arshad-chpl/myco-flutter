import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/my_profile/domain/entites/profile_entity.dart';

abstract class MyProfileRepository{
  Future<Either<Failure, ProfileEntity>> getProfileData();
}