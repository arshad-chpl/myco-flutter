import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/holiday/model/request/apply_optional_holiday.dart';
import 'package:myco_flutter/features/holiday/model/request/delete_optional_holiday.dart';
import 'package:myco_flutter/features/holiday/model/request/holiday_list_request_model.dart';

abstract class HolidayEvent extends Equatable {
  const HolidayEvent();

  @override
  List<Object?> get props => [];
}

class FetchHolidayList extends HolidayEvent {
  final HolidayListRequestModel model;

  const FetchHolidayList(this.model);

  @override
  List<Object?> get props => [model];
}

class ApplyHolidayEvent extends HolidayEvent {
  final ApplyOptionalHoliday model;

  const ApplyHolidayEvent(this.model);

  @override
  List<Object?> get props => [model];
}

class DeleteHolidayEvent extends HolidayEvent {
  final DeleteOptionalHoliday model;

  const DeleteHolidayEvent(this.model);

  @override
  List<Object?> get props => [model];
}
