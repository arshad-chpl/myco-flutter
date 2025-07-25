import 'package:equatable/equatable.dart';

class HolidayListResponseEntity extends Equatable {
  final List<HolidayEntity>? holiday;
  final int? count;
  final String? currentMonth;
  final String? message;

  const HolidayListResponseEntity({
    this.holiday,
    this.count,
    this.currentMonth,
    this.message,
  });

  @override
  List<Object?> get props => [holiday, count, currentMonth, message];
}

class HolidayEntity extends Equatable {
  final String? holidayId;
  final String? optionalHolidayAssignId;
  final String? companyId;
  final String? holidayName;
  final String? holidayDescription;
  final String? holidayStartDate;
  final String? holidayDay;
  final String? holidayMonth;
  final String? holidayEndDate;
  final String? monthViewStart;
  final String? monthStart;
  final String? monthViewEnd;
  final String? monthEnd;
  final String? dayViewStart;
  final String? dayViewEnd;
  final String? holidayIcon;
  final bool? isGone;
  final String? holidayType;
  final String? holidayGroupId;
  final String? holidayTypeOption;
  final String? holidayTypeDisplay;
  final String? remainOptionalHoliday;
  final String? alreadyAppliedHoliday;
  final String? optionalHolidayAssignDeleteId;

  const HolidayEntity({
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

  @override
  List<Object?> get props => [
    holidayId,
    optionalHolidayAssignId,
    companyId,
    holidayName,
    holidayDescription,
    holidayStartDate,
    holidayDay,
    holidayMonth,
    holidayEndDate,
    monthViewStart,
    monthStart,
    monthViewEnd,
    monthEnd,
    dayViewStart,
    dayViewEnd,
    holidayIcon,
    isGone,
    holidayType,
    holidayGroupId,
    holidayTypeOption,
    holidayTypeDisplay,
    remainOptionalHoliday,
    alreadyAppliedHoliday,
    optionalHolidayAssignDeleteId,
  ];
}
