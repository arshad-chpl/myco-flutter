// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday_list_response.dart';

// **************
// ***********************************************************
// JsonSerializableGenerator
// **************************************************************************

HolidayListResponse _$HolidayListResponseFromJson(Map<String, dynamic> json) =>
    HolidayListResponse(
      holiday: (json['holiday'] as List<dynamic>?)
          ?.map((e) => Holiday.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
      currentMonth: json['current_month'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$HolidayListResponseToJson(
        HolidayListResponse instance) =>
    <String, dynamic>{
      'holiday': instance.holiday?.map((e) => e.toJson()).toList(),
      'count': instance.count,
      'current_month': instance.currentMonth,
      'message': instance.message,
    };

Holiday _$HolidayFromJson(Map<String, dynamic> json) => Holiday(
      holidayId: json['holiday_id'] as String?,
      optionalHolidayAssignId: json['optional_holiday_assign_id'] as String?,
      companyId: json['society_id'] as String?,
      holidayName: json['holiday_name'] as String?,
      holidayDescription: json['holiday_description'] as String?,
      holidayStartDate: json['holiday_start_date'] == null
          ? null
          : DateTime.parse(json['holiday_start_date'] as String),
      holidayDay: json['holiday_day'] as String?,
      holidayMonth: json['holiday_month'] as String?,
      holidayEndDate: json['holiday_end_date'] == null
          ? null
          : DateTime.parse(json['holiday_end_date'] as String),
      monthViewStart: json['month_view_start'] as String?,
      monthStart: json['month_start'] as String?,
      monthViewEnd: json['month_view_end'] as String?,
      monthEnd: json['month_end'] as String?,
      dayViewStart: json['day_view_start'] as String?,
      dayViewEnd: json['day_view_end'] as String?,
      holidayIcon: json['holiday_icon'] as String?,
      isGone: json['is_gone'] as bool?,
      holidayType: json['holiday_type'] as String?,
      holidayGroupId: json['holiday_group_id'] as String?,
      holidayTypeOption: json['holiday_type_option'] as String?,
      holidayTypeDisplay: json['holiday_type_display'] as String?,
      remainOptionalHoliday: json['remain_optional_holiday'] as String?,
      alreadyAppliedHoliday: json['already_applied_holiday'] as String?,
      optionalHolidayAssignDeleteId:
          json['optional_holiday_assign_delete_id'] as String?,
    );

Map<String, dynamic> _$HolidayToJson(Holiday instance) => <String, dynamic>{
      'holiday_id': instance.holidayId,
      'optional_holiday_assign_id': instance.optionalHolidayAssignId,
      'society_id': instance.companyId,
      'holiday_name': instance.holidayName,
      'holiday_description': instance.holidayDescription,
      'holiday_start_date': instance.holidayStartDate?.toIso8601String(),
      'holiday_day': instance.holidayDay,
      'holiday_month': instance.holidayMonth,
      'holiday_end_date': instance.holidayEndDate?.toIso8601String(),
      'month_view_start': instance.monthViewStart,
      'month_start': instance.monthStart,
      'month_view_end': instance.monthViewEnd,
      'month_end': instance.monthEnd,
      'day_view_start': instance.dayViewStart,
      'day_view_end': instance.dayViewEnd,
      'holiday_icon': instance.holidayIcon,
      'is_gone': instance.isGone,
      'holiday_type': instance.holidayType,
      'holiday_group_id': instance.holidayGroupId,
      'holiday_type_option': instance.holidayTypeOption,
      'holiday_type_display': instance.holidayTypeDisplay,
      'remain_optional_holiday': instance.remainOptionalHoliday,
      'already_applied_holiday': instance.alreadyAppliedHoliday,
      'optional_holiday_assign_delete_id':
          instance.optionalHolidayAssignDeleteId,
    };
