import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/leave/domain/repositories/leave_repository.dart';
import 'package:myco_flutter/features/leave/model/leave_history_response_model.dart';
import 'package:myco_flutter/features/leave/model/my_team_response_model.dart';

class LeaveUseCase{
  final LeaveRepository repository;

  LeaveUseCase({required this.repository});

  Future<Either<Failure, LeaveHistoryResponseModel>> getNewListType(String query)=> repository.getNewListType(query);

  Future<Either<Failure, MyTeamResponseModel>>  getMyTeamLeaves()=> repository.getMyTeamLeaves();

  Future<Either<Failure, LeaveHistoryResponseModel>>  getLeaveHistoryNew(String monthName, String year)=> repository.getLeaveHistoryNew(monthName, year);

  Future<Either<Failure, CommonResponseModelEntity>> addShortLeave(String date, String time, String reason)=> repository.addShortLeave(date, time, reason);

  Future<Either<Failure, CommonResponseModelEntity>> deleteShortLeave(String shortLeaveId, String shortLeaveDate, String otherUserId, String otherUserName)=> repository.deleteShortLeave(shortLeaveId, shortLeaveDate, otherUserId, otherUserName);




}