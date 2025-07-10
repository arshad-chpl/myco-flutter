import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/leave/model/get_new_list_type_response.dart';

abstract class LeaveState extends Equatable {
  const LeaveState();
  @override
  List<Object> get props => [];
}

class LeaveInitial extends LeaveState {}

class LeaveLoading extends LeaveState {}

class LeaveListTypeFetched extends LeaveState {
  final GetNewListTypeResponse newLeaveListType; // Changed to hold GetNewListTypeResponse
  const LeaveListTypeFetched(this.newLeaveListType);
  @override
  List<Object> get props => [newLeaveListType];
}

class LeaveError extends LeaveState {
  final String message;
  const LeaveError(this.message);
  @override
  List<Object> get props => [message];
}