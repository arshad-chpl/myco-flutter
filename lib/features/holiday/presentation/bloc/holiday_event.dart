import 'package:equatable/equatable.dart';

abstract class HolidayEvent extends Equatable {
  const HolidayEvent();

  @override
  List<Object?> get props => [];
}

class FetchHolidayList extends HolidayEvent {
  final String year; // or year if API expects it

  const FetchHolidayList(this.year);

  @override
  List<Object?> get props => [year];
}

class ApplyHolidayEvent extends HolidayEvent {
  final String holidayId;

  const ApplyHolidayEvent(this.holidayId);

  @override
  List<Object?> get props => [holidayId];
}

class DeleteHolidayEvent extends HolidayEvent {
  final String holidayAssignId;

  const DeleteHolidayEvent(this.holidayAssignId);

  @override
  List<Object?> get props => [holidayAssignId];
}
