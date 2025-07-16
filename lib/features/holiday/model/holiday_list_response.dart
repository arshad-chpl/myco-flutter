import 'dart:convert';

HolidayListResponse holidayListResponseFromJson(String str) => HolidayListResponse.fromJson(json.decode(str));

String holidayListResponseToJson(HolidayListResponse data) => json.encode(data.toJson());

class HolidayListResponse {
  List<Holiday>? holiday;
  int? count;
  String? currentMonth;
  String? message;

  HolidayListResponse({
    this.holiday,
    this.count,
    this.currentMonth,
    this.message,
  });

  factory HolidayListResponse.fromJson(Map<String, dynamic> json) => HolidayListResponse(
    holiday: json["holiday"] == null ? [] : List<Holiday>.from(json["holiday"]!.map((x) => Holiday.fromJson(x))),
    count: json["count"],
    currentMonth: json["current_month"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "holiday": holiday == null ? [] : List<dynamic>.from(holiday!.map((x) => x.toJson())),
    "count": count,
    "current_month": currentMonth,
    "message": message,
  };
}

class Holiday {
  String? holidayId;
  String? optionalHolidayAssignId;
  String? societyId;
  String? holidayName;
  String? holidayDescription;
  DateTime? holidayStartDate;
  String? holidayDay;
  String? holidayMonth;
  DateTime? holidayEndDate;
  String? monthViewStart;
  String? monthStart;
  String? monthViewEnd;
  String? monthEnd;
  String? dayViewStart;
  String? dayViewEnd;
  String? holidayIcon;
  bool? isGone;
  String? holidayType;
  String? holidayGroupId;
  String? holidayTypeOption;
  String? holidayTypeDisplay;
  String? remainOptionalHoliday;
  String? alreadyAppliedHoliday;
  String? optionalHolidayAssignDeleteId;

  Holiday({
    this.holidayId,
    this.optionalHolidayAssignId,
    this.societyId,
    this.holidayName,
    this.holidayDescription,
    this.holidayStartDate,
    this.holidayDay,
    this.holidayMonth,
    this.holidayEndDate,
    this.monthViewStart,
    this.monthStart,
    this.monthViewEnd,
    this.monthEnd,
    this.dayViewStart,
    this.dayViewEnd,
    this.holidayIcon,
    this.isGone,
    this.holidayType,
    this.holidayGroupId,
    this.holidayTypeOption,
    this.holidayTypeDisplay,
    this.remainOptionalHoliday,
    this.alreadyAppliedHoliday,
    this.optionalHolidayAssignDeleteId,
  });

  factory Holiday.fromJson(Map<String, dynamic> json) => Holiday(
    holidayId: json["holiday_id"],
    optionalHolidayAssignId: json["optional_holiday_assign_id"],
    societyId: json["society_id"],
    holidayName: json["holiday_name"],
    holidayDescription: json["holiday_description"],
    holidayStartDate: json["holiday_start_date"] == null ? null : DateTime.parse(json["holiday_start_date"]),
    holidayDay: json["holiday_day"],
    holidayMonth: json["holiday_month"],
    holidayEndDate: json["holiday_end_date"] == null ? null : DateTime.parse(json["holiday_end_date"]),
    monthViewStart: json["month_view_start"],
    monthStart: json["month_start"],
    monthViewEnd: json["month_view_end"],
    monthEnd: json["month_end"],
    dayViewStart: json["day_view_start"],
    dayViewEnd: json["day_view_end"],
    holidayIcon: json["holiday_icon"],
    isGone: json["is_gone"],
    holidayType: json["holiday_type"],
    holidayGroupId: json["holiday_group_id"],
    holidayTypeOption: json["holiday_type_option"],
    holidayTypeDisplay: json["holiday_type_display"],
    remainOptionalHoliday: json["remain_optional_holiday"],
    alreadyAppliedHoliday: json["already_applied_holiday"],
    optionalHolidayAssignDeleteId: json["optional_holiday_assign_delete_id"],
  );

  Map<String, dynamic> toJson() => {
    "holiday_id": holidayId,
    "optional_holiday_assign_id": optionalHolidayAssignId,
    "society_id": societyId,
    "holiday_name": holidayName,
    "holiday_description": holidayDescription,
    "holiday_start_date": "${holidayStartDate!.year.toString().padLeft(4, '0')}-${holidayStartDate!.month.toString().padLeft(2, '0')}-${holidayStartDate!.day.toString().padLeft(2, '0')}",
    "holiday_day": holidayDay,
    "holiday_month": holidayMonth,
    "holiday_end_date": "${holidayEndDate!.year.toString().padLeft(4, '0')}-${holidayEndDate!.month.toString().padLeft(2, '0')}-${holidayEndDate!.day.toString().padLeft(2, '0')}",
    "month_view_start": monthViewStart,
    "month_start": monthStart,
    "month_view_end": monthViewEnd,
    "month_end": monthEnd,
    "day_view_start": dayViewStart,
    "day_view_end": dayViewEnd,
    "holiday_icon": holidayIcon,
    "is_gone": isGone,
    "holiday_type": holidayType,
    "holiday_group_id": holidayGroupId,
    "holiday_type_option": holidayTypeOption,
    "holiday_type_display": holidayTypeDisplay,
    "remain_optional_holiday": remainOptionalHoliday,
    "already_applied_holiday": alreadyAppliedHoliday,
    "optional_holiday_assign_delete_id": optionalHolidayAssignDeleteId,
  };
}
