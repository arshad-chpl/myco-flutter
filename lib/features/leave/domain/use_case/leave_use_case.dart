import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/leave/data/model/check_leave_balance_response.dart';
import 'package:myco_flutter/features/leave/data/model/comp_off_leave_response_model.dart';
import 'package:myco_flutter/features/leave/data/model/my_team_response_model.dart';
import 'package:myco_flutter/features/leave/domain/entities/leave_history_response_entity.dart';
import 'package:myco_flutter/features/leave/domain/entities/leave_type_response_entity.dart';
import 'package:myco_flutter/features/leave/domain/repositories/leave_repository.dart';

class LeaveUseCase {
  final LeaveRepository repository;

  LeaveUseCase({required this.repository});

  Future<Either<Failure, LeaveHistoryResponseEntity>> getNewListType(
    String query,
  ) => repository.getNewListType(query);

  Future<Either<Failure, MyTeamResponseModel>> getMyTeamLeaves() =>
      repository.getMyTeamLeaves();

  Future<Either<Failure, LeaveHistoryResponseEntity>> getLeaveHistoryNew(
    String monthName,
    String year,
  ) => repository.getLeaveHistoryNew(monthName, year);

  Future<Either<Failure, CommonResponseModelEntity>> addShortLeave(
    String date,
    String time,
    String reason,
  ) => repository.addShortLeave(date, time, reason);

  Future<Either<Failure, CommonResponseModelEntity>> deleteShortLeave(
    String shortLeaveId,
    String shortLeaveDate,
    String otherUserId,
    String otherUserName,
  ) => repository.deleteShortLeave(
    shortLeaveId,
    shortLeaveDate,
    otherUserId,
    otherUserName,
  );

  Future<Either<Failure, LeaveTypeResponseEntity>> getLeaveTypesWithData(
    String unitId,
    String useId,
    String userName,
    String currentYear,
    String appliedLeaveDate,
  ) => repository.getLeaveTypesWithData(
    unitId,
    useId,
    userName,
    currentYear,
    appliedLeaveDate,
  );

  Future<Either<Failure, CheckLeaveBalanceResponse>>
  getLeaveBalanceForAutoLeave(
    String userId,
    String leaveDate,
    String leaveId,
  ) => repository.getLeaveBalanceForAutoLeave(userId, leaveDate, leaveId);

  Future<Either<Failure, CommonResponseModelEntity>> deleteLeaveRequest(
    String leaveId,
  ) => repository.deleteLeaveRequest(leaveId);

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
  ) => repository.changeAutoLeave(
    userId,
    paid,
    leaveTypeId,
    leaveDate,
    leaveDay,
    extraDay,
    isSpecialDay,
    attendanceId,
    leaveId,
    leavePercentage,
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
  ) => repository.changeSandwichLeave(
    userId,
    paid,
    leaveId,
    leaveName,
    sandwichId,
    unitId,
    userFullName,
    leavePercentage,
  );

  Future<Either<Failure, CompOffLeaveResponseEntity>> getCompOffLeaves(
    String starDate,
    String endDate,
  ) => repository.getCompOffLeaves(starDate, endDate);
}
