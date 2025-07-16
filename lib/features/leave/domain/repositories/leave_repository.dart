import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/leave/model/leave_history_response_model.dart';
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
}
