import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
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
}
