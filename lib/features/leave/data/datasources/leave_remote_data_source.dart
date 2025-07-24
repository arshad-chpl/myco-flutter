import 'package:myco_flutter/core/models/data/common_response_model.dart';
import 'package:myco_flutter/features/leave/data/model/check_leave_balance_response.dart';
import 'package:myco_flutter/features/leave/data/model/comp_off_leave_response_model.dart';
import 'package:myco_flutter/features/leave/data/model/leave_history_response_model.dart';
import 'package:myco_flutter/features/leave/data/model/leave_type_response.dart';
import 'package:myco_flutter/features/leave/data/model/my_team_response_model.dart';

abstract class LeaveRemoteDataSource {
  Future<LeaveHistoryResponseModel> getNewLeaveListType(String query);

  Future<MyTeamResponseModel> getMyTeamLeaves();

  Future<LeaveHistoryResponseModel> getLeaveHistoryNew(
    String monthName,
    String year,
  );

  Future<CommonResponseModel> addShortLeave(
    String date,
    String time,
    String reason,
  );

  Future<CommonResponseModel> deleteShortLeave(
    String shortLeaveId,
    String shortLeaveDate,
    String otherUserId,
    String otherUserName,
  );

  Future<LeaveTypeResponse> getLeaveTypesWithData(
    String unitId,
    String useId,
    String userName,
    String currentYear,
    String appliedLeaveDate,
  );

  Future<CheckLeaveBalanceResponse> getLeaveBalanceForAutoLeave(
    String userId,
    String leaveDate,
    String leaveId,
  );

  Future<CommonResponseModel> deleteLeaveRequest(String leaveId);

  Future<CommonResponseModel> changeAutoLeave(
    String userId,
    String paid,
    String leaveTypeId,
    String leaveDate,
    String leaveDay,
    String extraDay,
    String isSpecialDay,
    String attendanceId,
    String leaveId,
    String leavePercentage,
  );

  Future<CommonResponseModel> changeSandwichLeave(
    String userId,
    String paid,
    String leaveId,
    String leaveName,
    String sandwichId,
    String unitId,
    String userFullName,
    String leavePercentage,
  );

  Future<CompOffLeaveResponseModel> getCompOffLeaves(
    String startDate,
    String endDate,
  );
}
