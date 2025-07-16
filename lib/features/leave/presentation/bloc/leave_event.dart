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

class FetchLeaveHistoryNew extends LeaveEvent{
  final String monthName;
  final String year;
  const FetchLeaveHistoryNew(this.monthName, this.year);
}

class AddShortLeave extends LeaveEvent{
  final String date;
  final String time;
  final String reason;
  const AddShortLeave(this.date, this.time, this.reason);
}

class InitialView extends LeaveEvent {}