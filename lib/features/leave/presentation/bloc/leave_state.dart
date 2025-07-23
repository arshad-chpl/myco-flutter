import 'package:equatable/equatable.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/leave/domain/entities/leave_history_response_entity.dart';
import 'package:myco_flutter/features/leave/domain/entities/leave_type_response_entity.dart';
import 'package:myco_flutter/features/leave/model/check_leave_balance_response.dart';
import 'package:myco_flutter/features/leave/model/comp_off_leave_response_model.dart';
import 'package:myco_flutter/features/leave/model/my_team_response_model.dart';

abstract class LeaveState extends Equatable {
  const LeaveState();

  @override
  List<Object> get props => [];
}

class LeaveInitial extends LeaveState {}

class LeaveLoading extends LeaveState {}

class LeaveListTypeFetched extends LeaveState {
  final LeaveHistoryResponseEntity
  newLeaveListType; // Changed to hold GetNewListTypeResponse
  const LeaveListTypeFetched(this.newLeaveListType);

  @override
  List<Object> get props => [newLeaveListType];
}

class TeamLeaveListFetched extends LeaveState {
  final MyTeamResponseModel
  teamLeaveList; // Changed to hold GetNewListTypeResponse
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
  final CommonResponseModelEntity commonResponse;

  const ShortLeaveAdded(this.commonResponse);

  @override
  List<Object> get props => [commonResponse];
}

class ShortLeaveDeleted extends LeaveState {
  final CommonResponseModelEntity commonResponse;

  const ShortLeaveDeleted(this.commonResponse);

  @override
  List<Object> get props => [commonResponse];
}

class LeaveTypeWithDataFetched extends LeaveState {
  final LeaveTypeResponseEntity leaveType;

  const LeaveTypeWithDataFetched(this.leaveType);

  @override
  List<Object> get props => [leaveType];
}

class CheckAutoLeaveBalanceFetched extends LeaveState {
  final CheckLeaveBalanceResponse checkLeaveBalanceResponse;

  const CheckAutoLeaveBalanceFetched(this.checkLeaveBalanceResponse);

  @override
  List<Object> get props => [checkLeaveBalanceResponse];
}

class LeaveRequestDeleted extends LeaveState {
  final CommonResponseModelEntity commonResponse;

  const LeaveRequestDeleted(this.commonResponse);

  @override
  List<Object> get props => [commonResponse];
}

class AutoLeaveChanged extends LeaveState {
  final CommonResponseModelEntity commonResponse;

  const AutoLeaveChanged(this.commonResponse);

  @override
  List<Object> get props => [commonResponse];
}

class SandwichLeaveChanged extends LeaveState {
  final CommonResponseModelEntity commonResponse;

  const SandwichLeaveChanged(this.commonResponse);

  @override
  List<Object> get props => [commonResponse];
}

class CompOffLeavesFetched extends LeaveState{
  final CompOffLeaveResponseEntity compOffLeaveResponseEntity;
  const CompOffLeavesFetched(this.compOffLeaveResponseEntity);
  @override
  List<Object> get props => [compOffLeaveResponseEntity];
}

class LeaveError extends LeaveState {
  final String message;

  const LeaveError(this.message);

  @override
  List<Object> get props => [message];
}
