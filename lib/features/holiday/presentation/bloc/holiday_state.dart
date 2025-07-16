import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/holiday/model/holiday_list_response.dart';

abstract class HolidayState extends Equatable {
  const HolidayState();

  @override
  List<Object?> get props => [];
}

class HolidayInitial extends HolidayState {}

class HolidayLoading extends HolidayState {}

class HolidayListLoaded extends HolidayState {
  final List<Holiday> holidays;

  const HolidayListLoaded(this.holidays);

  @override
  List<Object?> get props => [holidays];
}

class HolidayApplied extends HolidayState {}

class HolidayDeleted extends HolidayState {}

class HolidayError extends HolidayState {
  final String message;

  const HolidayError(this.message);

  @override
  List<Object?> get props => [message];
}
