import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/my_profile/data/datasources/myprofile_remote_data_source.dart';
import 'package:myco_flutter/features/my_profile/domain/entites/profile_entity.dart';
import 'package:myco_flutter/features/my_profile/domain/repositories/my_profile_repository.dart';

class MyProfileRepositoryImpl implements MyProfileRepository{
  final MyProfileRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  MyProfileRepositoryImpl(this.remoteDataSource, this.safeApiCall);
  @override
  Future<Either<Failure, ProfileEntity>> getProfileData() async{
    final result = await safeApiCall.execute(remoteDataSource.getProfileData);

    return result.map((responseModel) => responseModel.toEntity());
  }
}