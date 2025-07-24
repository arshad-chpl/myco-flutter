import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/holiday/domain/entities/holiday_list_response_entity.dart';
import 'package:myco_flutter/features/holiday/model/holiday_list_response.dart';

abstract class HolidayState extends Equatable {
  const HolidayState();

  @override
  List<Object?> get props => [];
}

class HolidayInitial extends HolidayState {}

class HolidayLoading extends HolidayState {}

class HolidayListLoaded extends HolidayState {
  final List<HolidayEntity> holidays;

  const HolidayListLoaded(this.holidays);

  @override
  List<Object?> get props => [holidays];
}

class HolidayApplied extends HolidayState {
  final HolidayListResponseEntity response;

  const HolidayApplied(this.response);

  @override
  List<Object?> get props => [response];
}

class HolidayDeleted extends HolidayState {
  final HolidayListResponseEntity response;

  const HolidayDeleted(this.response);

  @override
  List<Object?> get props => [response];
}

class HolidayError extends HolidayState {
  final String message;

  const HolidayError(this.message);

  @override
  List<Object?> get props => [message];
}
