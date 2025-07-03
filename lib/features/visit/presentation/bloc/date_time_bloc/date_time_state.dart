part of 'date_time_bloc.dart';

abstract class DateTimeState {}

class DateTimeInitial extends DateTimeState {}

class DateTimeUpdated extends DateTimeState {
  final String dateTime;

  DateTimeUpdated({required this.dateTime});
}