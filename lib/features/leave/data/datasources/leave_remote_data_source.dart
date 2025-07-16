import 'package:myco_flutter/features/leave/model/leave_history_response_model.dart';
import 'package:myco_flutter/features/leave/model/my_team_response_model.dart';

abstract class LeaveRemoteDataSource {
  Future<LeaveHistoryResponseModel> getNewLeaveListType(String query);

  Future<MyTeamResponseModel> getMyTeamLeaves();

  Future<LeaveHistoryResponseModel> getLeaveHistoryNew(String monthName,String year);
}
