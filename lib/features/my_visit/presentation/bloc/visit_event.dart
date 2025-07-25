part of 'visit_bloc.dart';

abstract class VisitEvent {}

/// Face Detection Events
class LaunchCamera extends VisitEvent {}
class StartDateTime extends VisitEvent {}
class UpdateDateTime extends VisitEvent {
  final String formattedDateAndTime;
  UpdateDateTime({required this.formattedDateAndTime});
}
class UpdateScanningState extends VisitEvent {
  final String scanningState;
  UpdateScanningState({required this.scanningState});
}
class StartScanningTimer extends VisitEvent {}
class UpdateProgress extends VisitEvent {
  final double progress;
  final String remainingTime;
  UpdateProgress({required this.progress, required this.remainingTime});
}

/// Tag Management Events
class InitVisitTags extends VisitEvent {}
class AddBranchTagFromSheet extends VisitEvent {
  final String branchTag;
  AddBranchTagFromSheet(this.branchTag);
}
class RemoveBranchTag extends VisitEvent {
  final String branchTag;
  RemoveBranchTag(this.branchTag);
}
class AddDepartmentTagFromSheet extends VisitEvent {
  final String departmentTag;
  AddDepartmentTagFromSheet(this.departmentTag);
}
class RemoveDepartmentTag extends VisitEvent {
  final String departmentTag;
  RemoveDepartmentTag(this.departmentTag);
}

/// Myvisit Page
class TabChanged extends VisitEvent {
  final int newIndex;
  TabChanged(this.newIndex);
}
class UpdateSelectedDate extends VisitEvent {
  final DateTime newDate;
  UpdateSelectedDate(this.newDate);
}

class NextDate extends VisitEvent {}

class PreviousDate extends VisitEvent {}
