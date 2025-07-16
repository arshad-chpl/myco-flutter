import 'package:equatable/equatable.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/leave/domain/intities/leave_history_response_entity.dart';
import 'package:myco_flutter/features/leave/model/leave_history_response_model.dart';
import 'package:myco_flutter/features/leave/model/my_team_response_model.dart';

abstract class LeaveState extends Equatable {
  const LeaveState();
  @override
  List<Object> get props => [];
}

class LeaveInitial extends LeaveState {}

class LeaveLoading extends LeaveState {}

class LeaveListTypeFetched extends LeaveState {
  final LeaveHistoryResponseModel newLeaveListType; // Changed to hold GetNewListTypeResponse
  const LeaveListTypeFetched(this.newLeaveListType);
  @override
  List<Object> get props => [newLeaveListType];
}

class TeamLeaveListFetched extends LeaveState {
  final MyTeamResponseModel teamLeaveList; // Changed to hold GetNewListTypeResponse
  const TeamLeaveListFetched(this.teamLeaveList);
  @override
  List<Object> get props => [teamLeaveList];
}

class LeaveHistoryNewFetched extends LeaveState {
  final LeaveHistoryResponseEntity newLeaveList;
  const LeaveHistoryNewFetched(this.newLeaveList);
  @override
  List<Object> get props => [newLeaveList];
}

class ShortLeaveAdded extends LeaveState {
  final CommonResponse commonResponse;
  const ShortLeaveAdded(this.commonResponse);
  @override
  List<Object> get props => [commonResponse];
}

class LeaveError extends LeaveState {
  final String message;
  const LeaveError(this.message);
  @override
  List<Object> get props => [message];
}