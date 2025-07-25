import 'package:myco_flutter/core/models/data/common_response_model.dart';
import 'package:myco_flutter/features/sign_in/data/models/request/cancel_pending_profile_request.dart';
import 'package:myco_flutter/features/sign_in/data/models/request/reminder_pending_profile_Request.dart';
import 'package:myco_flutter/features/sign_in/data/models/request/society_list_request.dart';
import 'package:myco_flutter/features/sign_in/data/models/request/view_pending_profile_request.dart';
import 'package:myco_flutter/features/sign_in/data/models/response/view_pending_profile_response.dart';

abstract class PrimaryRegisterDataSource {
  Future<CommonResponseModel> addPrimaryUser(Map<String, dynamic> dataMap);
  Future<ViewPendingProfileResponse> getViewPendingProfile(ViewPendingProfileRequest request);
  Future<CommonResponseModel> getCancelPendingProfile(CancelPendingProfileRequest request);
  Future<CommonResponseModel> getReminderPendingProfile(ReminderPendingProfileRequest request);
  Future<CommonResponseModel> getSociety(SocietyListRequest request);
}
