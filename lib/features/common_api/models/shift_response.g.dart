// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftResponseModel _$ShiftResponseModelFromJson(Map<String, dynamic> json) =>
    ShiftResponseModel(
      shift: (json['shift'] as List<dynamic>?)
          ?.map((e) => Shift.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ShiftResponseModelToJson(ShiftResponseModel instance) =>
    <String, dynamic>{
      'shift': instance.shift,
      'message': instance.message,
    };

Shift _$ShiftFromJson(Map<String, dynamic> json) => Shift(
      shiftTimeId: json['shift_time_id'] as String?,
      shiftName: json['shift_name'] as String?,
      shiftCode: json['shift_code'] as String?,
      shiftType: json['shift_type'] as String?,
      shiftStartTime: json['shift_start_time'] as String?,
      shiftEndTime: json['shift_end_time'] as String?,
      weekOff: json['week_off'] as String?,
      shiftTimeView: json['shift_time_view'] as String?,
      shiftTime: json['shift_time'] as String?,
    );

Map<String, dynamic> _$ShiftToJson(Shift instance) => <String, dynamic>{
      'shift_time_id': instance.shiftTimeId,
      'shift_name': instance.shiftName,
      'shift_code': instance.shiftCode,
      'shift_type': instance.shiftType,
      'shift_start_time': instance.shiftStartTime,
      'shift_end_time': instance.shiftEndTime,
      'week_off': instance.weekOff,
      'shift_time_view': instance.shiftTimeView,
      'shift_time': instance.shiftTime,
    };
