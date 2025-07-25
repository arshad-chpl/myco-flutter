import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/my_profile/data/datasources/myprofile_remote_data_source.dart';
import 'package:myco_flutter/features/my_profile/domain/entites/profile_entity.dart';
import 'package:myco_flutter/features/my_profile/domain/repositories/my_profile_repository.dart';

class MyProfileRepositoryImpl implements MyProfileRepository {
  final MyProfileRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  MyProfileRepositoryImpl(this.remoteDataSource, this.safeApiCall);
  @override
  Future<Either<Failure, ProfileModelEntity>> getProfileData(
    Map<String, dynamic> dataMap,
  ) async {
    final result = await remoteDataSource.getProfileData(dataMap);

    return result.fold(
        (failure)=> Left(failure),
        (profileModel) => Right(profileModel.toEntity()),
    );
  }
}
