import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/leave/data/datasources/leave_remote_data_source.dart';
import 'package:myco_flutter/features/leave/domain/repositories/leave_repository.dart';
import 'package:myco_flutter/features/leave/model/check_leave_balance_response.dart';
import 'package:myco_flutter/features/leave/model/leave_history_response_model.dart';
import 'package:myco_flutter/features/leave/model/leave_type_response.dart';
import 'package:myco_flutter/features/leave/model/my_team_response_model.dart';

class LeaveRepositoryImpl implements LeaveRepository {
  final LeaveRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  LeaveRepositoryImpl(this.remoteDataSource, this.safeApiCall);

  @override
  Future<Either<Failure, LeaveHistoryResponseModel>> getNewListType(
    String query,
  ) async =>
      safeApiCall.execute(() => remoteDataSource.getNewLeaveListType(query));

  @override
  Future<Either<Failure, MyTeamResponseModel>> getMyTeamLeaves() async =>
      safeApiCall.execute(remoteDataSource.getMyTeamLeaves);

  @override
  Future<Either<Failure, LeaveHistoryResponseModel>> getLeaveHistoryNew(
    String monthName,
    String year,
  ) async => safeApiCall.execute(
    () => remoteDataSource.getLeaveHistoryNew(monthName, year),
  );

  @override
  Future<Either<Failure, CommonResponse>> addShortLeave(
    String date,
    String time,
    String reason,
  ) async => safeApiCall.execute(
    () => remoteDataSource.addShortLeave(date, time, reason),
  );

  @override
  Future<Either<Failure, CommonResponse>> deleteShortLeave(
    String shortLeaveId,
    String shortLeaveDate,
    String otherUserId,
    String otherUserName,
  ) async => safeApiCall.execute(
    () => remoteDataSource.deleteShortLeave(
      shortLeaveId,
      shortLeaveDate,
      otherUserId,
      otherUserName,
    ),
  );

  @override
  Future<Either<Failure, LeaveTypeResponse>> getLeaveTypesWithData(
    String unitId,
    String useId,
    String userName,
    String currentYear,
    String appliedLeaveDate,
  ) async => safeApiCall.execute(
    () => remoteDataSource.getLeaveTypesWithData(
      unitId,
      useId,
      userName,
      currentYear,
      appliedLeaveDate,
    ),
  );

  @override
  Future<Either<Failure, CheckLeaveBalanceResponse>>
  getLeaveBalanceForAutoLeave(
    String userId,
    String leaveDate,
    String leaveId,
  ) async => safeApiCall.execute(
    () => remoteDataSource.getLeaveBalanceForAutoLeave(
      userId,
      leaveDate,
      leaveId,
    ),
  );

  @override
  Future<Either<Failure, CommonResponse>> deleteLeaveRequest(
    String leaveId,
  ) async =>
      safeApiCall.execute(() => remoteDataSource.deleteLeaveRequest(leaveId));

  @override
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
  ) async => safeApiCall.execute(
    () => remoteDataSource.changeAutoLeave(
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
    ),
  );

  @override
  Future<Either<Failure, CommonResponse>> changeSandwichLeave(
    String userId,
    String paid,
    String leaveId,
    String leaveName,
    String sandwichId,
    String unitId,
    String userFullName,
    String leavePercentage,
  ) async => safeApiCall.execute(
    () => remoteDataSource.changeSandwichLeave(
      userId,
      paid,
      leaveId,
      leaveName,
      sandwichId,
      unitId,
      userFullName,
      leavePercentage,
    ),
  );
}
