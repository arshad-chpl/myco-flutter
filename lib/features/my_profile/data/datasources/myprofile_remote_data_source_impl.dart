import 'dart:convert';

import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/my_profile/data/datasources/myprofile_remote_data_source.dart';
import 'package:myco_flutter/features/my_profile/data/models/profile_model.dart';

class MyprofileRemoteDataSourceImpl extends MyProfileRemoteDataSource{
  final ApiClient apiClient;

  MyprofileRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<ProfileModel> getProfileData() async{
    Map<String,dynamic> body = {
    'getProfileMenuDetails':'getProfileMenuDetails',
    'society_id':'1',
    'user_id':'21',
    'unit_id':'21',
    'block_id':'1',
    'floor_id':'1',
    'other_user_block_id': '',
    'other_user_floor_id': '',
    'my_user_id':'21',
    'my_profile':'1',
    };

    final result = await apiClient.postFormDynamic('profileMenuController.php', body);
    return ProfileModel.fromJson(jsonDecode(result));
  }
}