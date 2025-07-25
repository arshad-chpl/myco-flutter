import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/holiday/domain/entities/holiday_list_response_entity.dart';

part 'holiday_list_response.g.dart';

HolidayListResponseModel holidayListResponseModelFromJson(String str) =>
    HolidayListResponseModel.fromJson(json.decode(str));

@JsonSerializable(explicitToJson: true)
class HolidayListResponseModel {
  final List<HolidayModel>? holiday;
  final int? count;

  @JsonKey(name: 'current_month')
  final String? currentMonth;

  final String? message;

  HolidayListResponseModel({
    this.holiday,
    this.count,
    this.currentMonth,
    this.message,
  });

  factory HolidayListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HolidayListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HolidayListResponseModelToJson(this);

  HolidayListResponseEntity toEntity() => HolidayListResponseEntity(
    holiday: holiday?.map((h) => h.toEntity()).toList(),
    count: count,
    currentMonth: currentMonth,
    message: message,
  );
}

@JsonSerializable()
class HolidayModel {
  @JsonKey(name: 'holiday_id')
  final String? holidayId;

  @JsonKey(name: 'optional_holiday_assign_id')
  final String? optionalHolidayAssignId;

  @JsonKey(name: 'society_id')
  final String? companyId;

  @JsonKey(name: 'holiday_name')
  final String? holidayName;

  @JsonKey(name: 'holiday_description')
  final String? holidayDescription;

  @JsonKey(name: 'holiday_start_date')
  final String? holidayStartDate;

  @JsonKey(name: 'holiday_day')
  final String? holidayDay;

  @JsonKey(name: 'holiday_month')
  final String? holidayMonth;

  @JsonKey(name: 'holiday_end_date')
  final String? holidayEndDate;

  @JsonKey(name: 'month_view_start')
  final String? monthViewStart;

  @JsonKey(name: 'month_start')
  final String? monthStart;

  @JsonKey(name: 'month_view_end')
  final String? monthViewEnd;

  @JsonKey(name: 'month_end')
  final String? monthEnd;

  @JsonKey(name: 'day_view_start')
  final String? dayViewStart;

  @JsonKey(name: 'day_view_end')
  final String? dayViewEnd;

  @JsonKey(name: 'holiday_icon')
  final String? holidayIcon;

  @JsonKey(name: 'is_gone')
  final bool? isGone;

  @JsonKey(name: 'holiday_type')
  final String? holidayType;

  @JsonKey(name: 'holiday_group_id')
  final String? holidayGroupId;

  @JsonKey(name: 'holiday_type_option')
  final String? holidayTypeOption;

  @JsonKey(name: 'holiday_type_display')
  final String? holidayTypeDisplay;

  @JsonKey(name: 'remain_optional_holiday')
  final String? remainOptionalHoliday;

  @JsonKey(name: 'already_applied_holiday')
  final String? alreadyAppliedHoliday;

  @JsonKey(name: 'optional_holiday_assign_delete_id')
  final String? optionalHolidayAssignDeleteId;

  HolidayModel({
    this.holidayId,
    this.optionalHolidayAssignId,
    this.companyId,
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

  factory HolidayModel.fromJson(Map<String, dynamic> json) =>
      _$HolidayModelFromJson(json);

  Map<String, dynamic> toJson() => _$HolidayModelToJson(this);

  HolidayEntity toEntity() => HolidayEntity(
    holidayId: holidayId,
    optionalHolidayAssignId: optionalHolidayAssignId,
    companyId: companyId,
    holidayName: holidayName,
    holidayDescription: holidayDescription,
    holidayStartDate: holidayStartDate,
    holidayDay: holidayDay,
    holidayMonth: holidayMonth,
    holidayEndDate: holidayEndDate,
    monthViewStart: monthViewStart,
    monthStart: monthStart,
    monthViewEnd: monthViewEnd,
    monthEnd: monthEnd,
    dayViewStart: dayViewStart,
    dayViewEnd: dayViewEnd,
    holidayIcon: holidayIcon,
    isGone: isGone,
    holidayType: holidayType,
    holidayGroupId: holidayGroupId,
    holidayTypeOption: holidayTypeOption,
    holidayTypeDisplay: holidayTypeDisplay,
    remainOptionalHoliday: remainOptionalHoliday,
    alreadyAppliedHoliday: alreadyAppliedHoliday,
    optionalHolidayAssignDeleteId: optionalHolidayAssignDeleteId,
  );
}
