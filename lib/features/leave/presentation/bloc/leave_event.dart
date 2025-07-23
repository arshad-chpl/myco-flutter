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
class DeleteShortLeave extends LeaveEvent{
  final String shortLeaveId;
  final String shortLeaveDate;
  final String otherUserId;
  final String otherUserName;
  const DeleteShortLeave(this.shortLeaveId, this.shortLeaveDate, this.otherUserId, this.otherUserName);
}

class LeaveTypesWithData extends LeaveEvent{
  final String unitId;
  final String useId;
  final String userName;
  final String currentYear;
  final String appliedLeaveDate;
  const LeaveTypesWithData(this.unitId, this.useId, this.userName, this.currentYear, this.appliedLeaveDate);
}

class CheckAutoLeaveBalance extends LeaveEvent{
  final String userId;
  final String leaveDate;
  final String leaveId;
  const CheckAutoLeaveBalance(this.userId, this.leaveDate, this.leaveId);
}

class DeleteLeaveRequest extends LeaveEvent{
  final String leaveId;
  const DeleteLeaveRequest(this.leaveId);
}

class ChangeAutoLeave extends LeaveEvent{
  final String userId;
  final String paid;
  final String leaveTypeId;
  final String leaveDate;
  final String leaveDay;
  final String extraDay;
  final String isSpecialDay;
  final String attendanceId;
  final String leaveId;
  final String leavePercentage;
  const ChangeAutoLeave(this.userId, this.paid, this.leaveTypeId, this.leaveDate, this.leaveDay, this.extraDay, this.isSpecialDay, this.attendanceId, this.leaveId, this.leavePercentage);
}

class ChangeSandwichLeave extends LeaveEvent{
  final String userId;
  final String paid;
  final String leaveId;
  final String leaveName;
  final String sandwichId;
  final String unitId;
  final String userFullName;
  final String leavePercentage;
  const ChangeSandwichLeave(this.userId, this.paid, this.leaveId, this.leaveName, this.sandwichId, this.unitId, this.userFullName, this.leavePercentage);
}

class FetchCompOffLeaves extends LeaveEvent{
  final String starDate;
  final String endDate;
  const FetchCompOffLeaves(this.starDate, this.endDate);
}

class InitialView extends LeaveEvent {}