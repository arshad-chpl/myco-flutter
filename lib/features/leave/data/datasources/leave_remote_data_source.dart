import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/leave/model/check_leave_balance_response.dart';
import 'package:myco_flutter/features/leave/model/leave_history_response_model.dart';
import 'package:myco_flutter/features/leave/model/leave_type_response.dart';
import 'package:myco_flutter/features/leave/model/my_team_response_model.dart';

abstract class LeaveRemoteDataSource {
  Future<LeaveHistoryResponseModel> getNewLeaveListType(String query);

  Future<MyTeamResponseModel> getMyTeamLeaves();

  Future<LeaveHistoryResponseModel> getLeaveHistoryNew(String monthName,String year);

  Future<CommonResponse> addShortLeave(String date,String time,String reason);

  Future<CommonResponse> deleteShortLeave(String shortLeaveId,String shortLeaveDate,String otherUserId,String otherUserName);

  Future<LeaveTypeResponse>getLeaveTypesWithData(String unitId,String useId,String userName,String currentYear,String appliedLeaveDate);

  Future<CheckLeaveBalanceResponse>getLeaveBalanceForAutoLeave(String userId,String leaveDate,String leaveId);
}
