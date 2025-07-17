// To parse this JSON data, do
//
//     final shiftResponse = shiftResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'shift_response.g.dart';

ShiftResponse shiftResponseFromJson(String str) => ShiftResponse.fromJson(json.decode(str));

String shiftResponseToJson(ShiftResponse data) => json.encode(data.toJson());

@JsonSerializable()
class ShiftResponse {
  @JsonKey(name: "shift")
  List<Shift>? shift;
  @JsonKey(name: "message")
  String? message;

  ShiftResponse({
    this.shift,
    this.message,
  });

  factory ShiftResponse.fromJson(Map<String, dynamic> json) => _$ShiftResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftResponseToJson(this);
}

@JsonSerializable()
class Shift {
  @JsonKey(name: "shift_time_id")
  String? shiftTimeId;
  @JsonKey(name: "shift_name")
  String? shiftName;
  @JsonKey(name: "shift_code")
  String? shiftCode;
  @JsonKey(name: "shift_type")
  ShiftType? shiftType;
  @JsonKey(name: "shift_start_time")
  String? shiftStartTime;
  @JsonKey(name: "shift_end_time")
  String? shiftEndTime;
  @JsonKey(name: "week_off")
  WeekOff? weekOff;
  @JsonKey(name: "shift_time_view")
  String? shiftTimeView;
  @JsonKey(name: "shift_time")
  ShiftTime? shiftTime;

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
}

enum ShiftTime {
  @JsonValue("05:30 AM - 05:30 AM")
  THE_0530_AM_0530_AM
}

final shiftTimeValues = EnumValues({
  "05:30 AM - 05:30 AM": ShiftTime.THE_0530_AM_0530_AM
});

enum ShiftType {
  @JsonValue("Day")
  DAY
}

final shiftTypeValues = EnumValues({
  "Day": ShiftType.DAY
});

enum WeekOff {
  @JsonValue("")
  EMPTY,
  @JsonValue("Monday")
  MONDAY,
  @JsonValue("Monday,Thursday")
  MONDAY_THURSDAY,
  @JsonValue("Saturday")
  SATURDAY,
  @JsonValue("Sunday")
  SUNDAY,
  @JsonValue("Sunday,Monday")
  SUNDAY_MONDAY,
  @JsonValue("Sunday,Saturday")
  SUNDAY_SATURDAY,
  @JsonValue("Thursday")
  THURSDAY
}

final weekOffValues = EnumValues({
  "": WeekOff.EMPTY,
  "Monday": WeekOff.MONDAY,
  "Monday,Thursday": WeekOff.MONDAY_THURSDAY,
  "Saturday": WeekOff.SATURDAY,
  "Sunday": WeekOff.SUNDAY,
  "Sunday,Monday": WeekOff.SUNDAY_MONDAY,
  "Sunday,Saturday": WeekOff.SUNDAY_SATURDAY,
  "Thursday": WeekOff.THURSDAY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
