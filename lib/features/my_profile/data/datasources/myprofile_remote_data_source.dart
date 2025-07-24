import 'package:myco_flutter/features/my_profile/data/models/profile_model.dart';

abstract class MyProfileRemoteDataSource{
  Future<ProfileModel> getProfileData();
}