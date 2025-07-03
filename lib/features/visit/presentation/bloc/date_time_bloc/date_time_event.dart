part of 'date_time_bloc.dart';

abstract class DateTimeEvent {}

class StartDateTime extends DateTimeEvent {}

class UpdateDateTime extends DateTimeEvent {
  final String formattedDateAndTime;

  UpdateDateTime({required this.formattedDateAndTime});

}