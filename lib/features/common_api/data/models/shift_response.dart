import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/common_api/domain/entities/shift_response_entity.dart';

part 'shift_response.g.dart';

ShiftResponseModel ShiftResponseModelFromJson(String str) =>
    ShiftResponseModel.fromJson(json.decode(str));

String ShiftResponseModelToJson(ShiftResponseModel data) => json.encode(data.toJson());

@JsonSerializable()
class ShiftResponseModel {
  @JsonKey(name: "shift")
  final List<Shift>? shift;
  @JsonKey(name: "message")
  final String? message;

  ShiftResponseModel({
    this.shift,
    this.message,
  });

  factory ShiftResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ShiftResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftResponseModelToJson(this);

  /// Convert to domain entity
  ShiftResponseEntity toEntity() => ShiftResponseEntity(
    shift: shift?.map((e) => e.toEntity()).toList(),
    message: message,
  );
}

@JsonSerializable()
class Shift {
  @JsonKey(name: "shift_time_id")
  final String? shiftTimeId;
  @JsonKey(name: "shift_name")
  final String? shiftName;
  @JsonKey(name: "shift_code")
  final String? shiftCode;
  @JsonKey(name: "shift_type")
  final String? shiftType; // Keep as String for JSON mapping
  @JsonKey(name: "shift_start_time")
  final String? shiftStartTime;
  @JsonKey(name: "shift_end_time")
  final String? shiftEndTime;
  @JsonKey(name: "week_off")
  final String? weekOff; // Keep as String for JSON mapping
  @JsonKey(name: "shift_time_view")
  final String? shiftTimeView;
  @JsonKey(name: "shift_time")
  final String? shiftTime; // Keep as String for JSON mapping

  Shift({
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

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftToJson(this);

  /// Map to domain entity with enum conversion
  ShiftEntity toEntity() => ShiftEntity(
    shiftTimeId: shiftTimeId,
    shiftName: shiftName,
    shiftCode: shiftCode,
    shiftType: _mapShiftType(shiftType),
    shiftStartTime: shiftStartTime,
    shiftEndTime: shiftEndTime,
    weekOff: _mapWeekOff(weekOff),
    shiftTimeView: shiftTimeView,
    shiftTime: _mapShiftTime(shiftTime),
  );

  /// --- Mappers ---
  ShiftType? _mapShiftType(String? type) {
    switch (type) {
      case "Day":
        return ShiftType.DAY;
      default:
        return null;
    }
  }

  WeekOff? _mapWeekOff(String? week) {
    switch (week) {
      case "":
        return WeekOff.EMPTY;
      case "Monday":
        return WeekOff.MONDAY;
      case "Monday,Thursday":
        return WeekOff.MONDAY_THURSDAY;
      case "Saturday":
        return WeekOff.SATURDAY;
      case "Sunday":
        return WeekOff.SUNDAY;
      case "Sunday,Monday":
        return WeekOff.SUNDAY_MONDAY;
      case "Sunday,Saturday":
        return WeekOff.SUNDAY_SATURDAY;
      case "Thursday":
        return WeekOff.THURSDAY;
      default:
        return null;
    }
  }

  ShiftTime? _mapShiftTime(String? time) {
    switch (time) {
      case "05:30 AM - 05:30 AM":
        return ShiftTime.THE_0530_AM_0530_AM;
      default:
        return null;
    }
  }
}
