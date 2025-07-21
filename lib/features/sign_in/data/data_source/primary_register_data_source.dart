import 'package:myco_flutter/core/models/data/common_response_model.dart';
import 'package:myco_flutter/features/sign_in/models/view_pending_profile_response.dart';

abstract class PrimaryRegisterDataSource {
  Future<CommonResponseModel> addPrimaryUser(Map<String, dynamic> dataMap);
  Future<ViewPendingProfileResponse> getViewPendingProfile();
  Future<CommonResponseModel> getCancelPendingProfile();
  Future<CommonResponseModel> getReminderPendingProfile(Map<String, dynamic> dataMap);
  Future<CommonResponseModel> getSociety(String societyId);
}
