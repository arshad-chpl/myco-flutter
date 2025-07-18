
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/sign_in/models/view_pending_profile_response.dart';

abstract class PrimaryRegisterDataSource {
  Future<CommonResponse> addPrimaryUser(Map<String, dynamic> dataMap);
  Future<ViewPendingProfileResponse> getViewPendingProfile();
  Future<CommonResponse> getCancelPendingProfile();
  Future<CommonResponse> getReminderPendingProfile(Map<String, dynamic> dataMap);
  Future<CommonResponse> getSociety(String societyId);
}
