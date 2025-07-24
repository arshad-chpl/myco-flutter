import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/leave/data/datasources/leave_remote_data_source.dart';
import 'package:myco_flutter/features/leave/data/model/check_leave_balance_response.dart';
import 'package:myco_flutter/features/leave/data/model/comp_off_leave_response_model.dart';
import 'package:myco_flutter/features/leave/data/model/my_team_response_model.dart';
import 'package:myco_flutter/features/leave/domain/entities'
    '/leave_history_response_entity.dart';
import 'package:myco_flutter/features/leave/domain/entities/leave_type_response_entity.dart';
import 'package:myco_flutter/features/leave/domain/repositories/leave_repository.dart';

class LeaveRepositoryImpl implements LeaveRepository {
  final LeaveRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  LeaveRepositoryImpl(this.remoteDataSource, this.safeApiCall);

  @override
  Future<Either<Failure, LeaveHistoryResponseEntity>> getNewListType(
    String query,
  ) async => safeApiCall.execute(() async {
    // Await the response from the data source
    final responseModel = await remoteDataSource.getNewLeaveListType(query);
    // Convert the Model to an Entity before returning
    return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, MyTeamResponseModel>> getMyTeamLeaves() async =>
      safeApiCall.execute(remoteDataSource.getMyTeamLeaves);

  @override
  Future<Either<Failure, LeaveHistoryResponseEntity>> getLeaveHistoryNew(
    String monthName,
    String year,
  ) async => safeApiCall.execute(() async {
    // Await the response from the data source
    final responseModel = await remoteDataSource.getLeaveHistoryNew(
      monthName,
      year,
    );
    // Convert the Model to an Entity before returning
    return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, CommonResponseModelEntity>> addShortLeave(
    String date,
    String time,
    String reason,
  ) async => safeApiCall.execute(() async {
    // Await the response from the data source
    final responseModel = await remoteDataSource.addShortLeave(
      date,
      time,
      reason,
    );
    // Convert the Model to an Entity before returning
    return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, CommonResponseModelEntity>> deleteShortLeave(
    String shortLeaveId,
    String shortLeaveDate,
    String otherUserId,
    String otherUserName,
  ) async => safeApiCall.execute(() async {
    // Await the response from the data source
    final responseModel = await remoteDataSource.deleteShortLeave(
      shortLeaveId,
      shortLeaveDate,
      otherUserId,
      otherUserName,
    );
    // Convert the Model to an Entity before returning
    return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, LeaveTypeResponseEntity>> getLeaveTypesWithData(
    String unitId,
    String useId,
    String userName,
    String currentYear,
    String appliedLeaveDate,
  ) async => safeApiCall.execute(() async {
    // Await the response from the data source
    final responseModel = await remoteDataSource.getLeaveTypesWithData(
      unitId,
      useId,
      userName,
      currentYear,
      appliedLeaveDate,
    );
    // Convert the Model to an Entity before returning
    return responseModel.toEntity();
  });

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
  Future<Either<Failure, CommonResponseModelEntity>> deleteLeaveRequest(
    String leaveId,
  ) async => safeApiCall.execute(() async {
    // Await the response from the data source
    final responseModel = await remoteDataSource.deleteLeaveRequest(leaveId);
    // Convert the Model to an Entity before returning
    return responseModel.toEntity();
  });

  @override
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
  ) async => safeApiCall.execute(() async {
    // Await the response from the data source
    final responseModel = await remoteDataSource.changeAutoLeave(
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
    // Convert the Model to an Entity before returning
    return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, CommonResponseModelEntity>> changeSandwichLeave(
    String userId,
    String paid,
    String leaveId,
    String leaveName,
    String sandwichId,
    String unitId,
    String userFullName,
    String leavePercentage,
  ) async => safeApiCall.execute(() async {
    // Await the response from the data source
    final responseModel = await remoteDataSource.changeSandwichLeave(
      userId,
      paid,
      leaveId,
      leaveName,
      sandwichId,
      unitId,
      userFullName,
      leavePercentage,
    );
    // Convert the Model to an Entity before returning
    return responseModel.toEntity();
  });

  Future<Either<Failure, CompOffLeaveResponseEntity>> getCompOffLeaves(
    String startDate,
    String endDate,
  ) async => safeApiCall.execute(() async {
    final responseModel = await remoteDataSource.getCompOffLeaves(
      startDate,
      endDate,
    );
    return responseModel.toEntity();
  });
}
