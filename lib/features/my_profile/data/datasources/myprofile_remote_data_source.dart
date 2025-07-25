import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/my_profile/data/models/profile_model.dart';

abstract class MyProfileRemoteDataSource{
  Future<Either<Failure, ProfileModel>> getProfileData(Map<String,dynamic> dataMap);
}