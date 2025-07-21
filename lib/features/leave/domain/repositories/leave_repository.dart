import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/leave/domain/entities/leave_history_response_entity.dart';
import 'package:myco_flutter/features/leave/domain/entities/leave_type_response_entity.dart';
import 'package:myco_flutter/features/leave/model/check_leave_balance_response.dart';
import 'package:myco_flutter/features/leave/model/my_team_response_model.dart';

abstract class LeaveRepository {
  Future<Either<Failure, LeaveHistoryResponseEntity>> getNewListType(
    String query,
  );

  Future<Either<Failure, MyTeamResponseModel>> getMyTeamLeaves();

  Future<Either<Failure, LeaveHistoryResponseEntity>> getLeaveHistoryNew(
    String monthName,
    String year,
  );

  Future<Either<Failure, CommonResponseModelEntity>> addShortLeave(
    String date,
    String time,
    String reason,
  );

  Future<Either<Failure, CommonResponseModelEntity>> deleteShortLeave(
    String shortLeaveId,
    String shortLeaveDate,
    String otherUserId,
    String otherUserName,
  );

  Future<Either<Failure, LeaveTypeResponseEntity>> getLeaveTypesWithData(
    String unitId,
    String useId,
    String userName,
    String currentYear,
    String appliedLeaveDate,
  );

  Future<Either<Failure, CheckLeaveBalanceResponse>>
  getLeaveBalanceForAutoLeave(String userId, String leaveDate, String leaveId);

  Future<Either<Failure, CommonResponseModelEntity>> deleteLeaveRequest(
    String leaveId,
  );

  Future<Either<Failure, CommonResponseModelEntity>> changeAutoLeave(
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

  Future<Either<Failure, CommonResponseModelEntity>> changeSandwichLeave(
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
