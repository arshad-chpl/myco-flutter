// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftResponse _$ShiftResponseFromJson(Map<String, dynamic> json) =>
    ShiftResponse(
      shift: (json['shift'] as List<dynamic>?)
          ?.map((e) => Shift.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ShiftResponseToJson(ShiftResponse instance) =>
    <String, dynamic>{
      'shift': instance.shift,
      'message': instance.message,
    };

Shift _$ShiftFromJson(Map<String, dynamic> json) => Shift(
      shiftTimeId: json['shift_time_id'] as String?,
      shiftName: json['shift_name'] as String?,
      shiftCode: json['shift_code'] as String?,
      shiftType: $enumDecodeNullable(_$ShiftTypeEnumMap, json['shift_type']),
      shiftStartTime: json['shift_start_time'] as String?,
      shiftEndTime: json['shift_end_time'] as String?,
      weekOff: $enumDecodeNullable(_$WeekOffEnumMap, json['week_off']),
      shiftTimeView: json['shift_time_view'] as String?,
      shiftTime: $enumDecodeNullable(_$ShiftTimeEnumMap, json['shift_time']),
    );

Map<String, dynamic> _$ShiftToJson(Shift instance) => <String, dynamic>{
      'shift_time_id': instance.shiftTimeId,
      'shift_name': instance.shiftName,
      'shift_code': instance.shiftCode,
      'shift_type': _$ShiftTypeEnumMap[instance.shiftType],
      'shift_start_time': instance.shiftStartTime,
      'shift_end_time': instance.shiftEndTime,
      'week_off': _$WeekOffEnumMap[instance.weekOff],
      'shift_time_view': instance.shiftTimeView,
      'shift_time': _$ShiftTimeEnumMap[instance.shiftTime],
    };

const _$ShiftTypeEnumMap = {
  ShiftType.DAY: 'Day',
};

const _$WeekOffEnumMap = {
  WeekOff.EMPTY: '',
  WeekOff.MONDAY: 'Monday',
  WeekOff.MONDAY_THURSDAY: 'Monday,Thursday',
  WeekOff.SATURDAY: 'Saturday',
  WeekOff.SUNDAY: 'Sunday',
  WeekOff.SUNDAY_MONDAY: 'Sunday,Monday',
  WeekOff.SUNDAY_SATURDAY: 'Sunday,Saturday',
  WeekOff.THURSDAY: 'Thursday',
};

const _$ShiftTimeEnumMap = {
  ShiftTime.THE_0530_AM_0530_AM: '05:30 AM - 05:30 AM',
};
