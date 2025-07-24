import 'package:equatable/equatable.dart';

class ShiftResponseEntity extends Equatable {
  final List<ShiftEntity>? shift;
  final String? message;

  const ShiftResponseEntity({
    this.shift,
    this.message,
  });

  @override
  List<Object?> get props => [shift, message];
}

class ShiftEntity extends Equatable {
  final String? shiftTimeId;
  final String? shiftName;
  final String? shiftCode;
  final ShiftType? shiftType;
  final String? shiftStartTime;
  final String? shiftEndTime;
  final WeekOff? weekOff;
  final String? shiftTimeView;
  final ShiftTime? shiftTime;

  const ShiftEntity({
    this.shiftTimeId,
    this.shiftName,
    this.shiftCode,
    this.shiftType,
    this.shiftStartTime,
    this.shiftEndTime,
    this.weekOff,
    this.shiftTimeView,
    this.shiftTime,
  });

  @override
  List<Object?> get props => [
    shiftTimeId,
    shiftName,
    shiftCode,
    shiftType,
    shiftStartTime,
    shiftEndTime,
    weekOff,
    shiftTimeView,
    shiftTime,
  ];
}

enum ShiftType { DAY }

enum ShiftTime { THE_0530_AM_0530_AM }

enum WeekOff {
  EMPTY,
  MONDAY,
  MONDAY_THURSDAY,
  SATURDAY,
  SUNDAY,
  SUNDAY_MONDAY,
  SUNDAY_SATURDAY,
  THURSDAY
}
