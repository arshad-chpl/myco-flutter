import 'package:equatable/equatable.dart';

abstract class LeaveEvent extends Equatable{
  const LeaveEvent();
  @override
  List<Object> get props => [];
}

class FetchNewLeaveListType extends LeaveEvent{
  final String query;
  const FetchNewLeaveListType(this.query);

}

class FetchMyTeamLeaveList extends LeaveEvent{
  const FetchMyTeamLeaveList();
}

class InitialView extends LeaveEvent {}