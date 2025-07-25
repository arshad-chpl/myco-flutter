import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/my_profile/data/datasources/myprofile_remote_data_source.dart';
import 'package:myco_flutter/features/my_profile/data/models/profile_model.dart';

class MyprofileRemoteDataSourceImpl extends MyProfileRemoteDataSource {
  final ApiClient apiClient;
  final SafeApiCall safeApiCall;
  MyprofileRemoteDataSourceImpl({required this.apiClient,required this.safeApiCall,});

  @override
  Future<Either<Failure, ProfileModel>> getProfileData(
    Map<String, dynamic> dataMap,
  ) async {
    return await safeApiCall.execute<ProfileModel>(() async {
      final response = await apiClient.postFormDynamic(
        "profileMenuController.php",
        dataMap,
      );
      return ProfileModel.fromJson(jsonDecode(response));
    });
  }
}
