import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/leave/data/datasources/leave_remote_data_source.dart';
import 'package:myco_flutter/features/leave/domain/repositories/leave_repository.dart';
import 'package:myco_flutter/features/leave/model/leave_history_response_model.dart';
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

  Future<Either<Failure, CommonResponse>> addShortLeave(
    String date,
    String time,
    String reason,
  ) async => safeApiCall.execute(
    () => remoteDataSource.addShortLeave(date, time, reason),
  );
}
