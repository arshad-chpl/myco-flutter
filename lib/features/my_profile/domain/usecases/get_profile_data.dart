import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/my_profile/domain/entites/profile_entity.dart';
import 'package:myco_flutter/features/my_profile/domain/repositories/my_profile_repository.dart';

class GetProfileData{
  final MyProfileRepository repository;
  GetProfileData(this.repository);

  Future<Either<Failure,ProfileEntity>> getProileData(Map<String,dynamic> dataMap) async{
    return await repository.getProfileData(dataMap);
  }
}