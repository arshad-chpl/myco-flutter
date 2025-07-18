import 'package:json_annotation/json_annotation.dart';

part 'holiday_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class HolidayListResponse {
  List<Holiday>? holiday;
  int? count;
  @JsonKey(name: 'current_month')
  String? currentMonth;
  String? message;

  HolidayListResponse({
    this.holiday,
    this.count,
    this.currentMonth,
    this.message,
  });

  factory HolidayListResponse.fromJson(Map<String, dynamic> json) =>
      _$HolidayListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HolidayListResponseToJson(this);
}

@JsonSerializable()
class Holiday {
  @JsonKey(name: 'holiday_id')
  String? holidayId;

  @JsonKey(name: 'optional_holiday_assign_id')
  String? optionalHolidayAssignId;

  @JsonKey(name: 'society_id')
  String? societyId;

  @JsonKey(name: 'holiday_name')
  String? holidayName;

  @JsonKey(name: 'holiday_description')
  String? holidayDescription;

  @JsonKey(name: 'holiday_start_date')
  DateTime? holidayStartDate;

  @JsonKey(name: 'holiday_day')
  String? holidayDay;

  @JsonKey(name: 'holiday_month')
  String? holidayMonth;

  @JsonKey(name: 'holiday_end_date')
  DateTime? holidayEndDate;

  @JsonKey(name: 'month_view_start')
  String? monthViewStart;

  @JsonKey(name: 'month_start')
  String? monthStart;

  @JsonKey(name: 'month_view_end')
  String? monthViewEnd;

  @JsonKey(name: 'month_end')
  String? monthEnd;

  @JsonKey(name: 'day_view_start')
  String? dayViewStart;

  @JsonKey(name: 'day_view_end')
  String? dayViewEnd;

  @JsonKey(name: 'holiday_icon')
  String? holidayIcon;

  @JsonKey(name: 'is_gone')
  bool? isGone;

  @JsonKey(name: 'holiday_type')
  String? holidayType;

  @JsonKey(name: 'holiday_group_id')
  String? holidayGroupId;

  @JsonKey(name: 'holiday_type_option')
  String? holidayTypeOption;

  @JsonKey(name: 'holiday_type_display')
  String? holidayTypeDisplay;

  @JsonKey(name: 'remain_optional_holiday')
  String? remainOptionalHoliday;

  @JsonKey(name: 'already_applied_holiday')
  String? alreadyAppliedHoliday;

  @JsonKey(name: 'optional_holiday_assign_delete_id')
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

  factory Holiday.fromJson(Map<String, dynamic> json) => _$HolidayFromJson(json);

  Map<String, dynamic> toJson() => _$HolidayToJson(this);
}
