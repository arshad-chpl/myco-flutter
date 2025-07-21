import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/leave/model/check_leave_balance_response.dart';
import 'package:myco_flutter/features/leave/model/leave_history_response_model.dart';
import 'package:myco_flutter/features/leave/model/leave_type_response.dart';
import 'package:myco_flutter/features/leave/model/my_team_response_model.dart';

abstract class LeaveRepository {
  Future<Either<Failure, LeaveHistoryResponseModel>> getNewListType(
    String query,
  );

  Future<Either<Failure, MyTeamResponseModel>> getMyTeamLeaves();

  Future<Either<Failure, LeaveHistoryResponseModel>> getLeaveHistoryNew(
    String monthName,
    String year,
  );

  Future<Either<Failure, CommonResponse>> addShortLeave(
    String date,
    String time,
    String reason,
  );

  Future<Either<Failure, CommonResponse>> deleteShortLeave(
    String shortLeaveId,
    String shortLeaveDate,
    String otherUserId,
    String otherUserName,
  );

  Future<Either<Failure, LeaveTypeResponse>> getLeaveTypesWithData(
    String unitId,
    String useId,
    String userName,
    String currentYear,
    String appliedLeaveDate,
  );

  Future<Either<Failure, CheckLeaveBalanceResponse>> getLeaveBalanceForAutoLeave(
      String userId,
      String leaveDate,
      String leaveId,
      );
  Future<Either<Failure, CommonResponse>> deleteLeaveRequest(
    String leaveId,
  );

  Future<Either<Failure, CommonResponse>> changeAutoLeave(
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

  Future<Either<Failure, CommonResponse>> changeSandwichLeave(
    String userId,
    String paid,
    String leaveId,
    String leaveName,
    String sandwichId,
    String unitId,
    String userFullName,
    String leavePercentage,
  );
}
