import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/time_sheet/domain/entities/attendence_month_entity.dart';

part 'attendance_month_response_model.g.dart';

AttendanceMonthResponseModel attendanceMonthResponseModelFromJson(String str) =>
    AttendanceMonthResponseModel.fromJson(json.decode(str));

String attendanceMonthResponseModelToJson(AttendanceMonthResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class AttendanceMonthResponseModel {
  @JsonKey(name: 'salary_generated')
  bool? salaryGenerated;
  @JsonKey(name: 'hide_working_hours')
  bool? hideWorkingHours;
  @JsonKey(name: 'monthly_history')
  List<MonthlyHistory>? monthlyHistory;
  @JsonKey(name: 'month')
  String? month;
  @JsonKey(name: 'same_day_future_time_attendance')
  bool? sameDayFutureTimeAttendance;
  @JsonKey(name: 'user_full_name')
  String? userFullName;
  @JsonKey(name: 'total_incomplete_days')
  String? totalIncompleteDays;
  @JsonKey(name: 'total_month_hours_view')
  String? totalMonthHoursView;
  @JsonKey(name: 'total_month_hours')
  String? totalMonthHours;
  @JsonKey(name: 'total_month_minutes')
  String? totalMonthMinutes;
  @JsonKey(name: 'total_month_hours_web')
  String? totalMonthHoursWeb;
  @JsonKey(name: 'total_working_minutes')
  String? totalWorkingMinutes;
  @JsonKey(name: 'total_present_working_minutes')
  String? totalPresentWorkingMinutes;
  @JsonKey(name: 'total_present_working_minutes_view')
  String? totalPresentWorkingMinutesView;
  @JsonKey(name: 'total_month_hour_spent')
  String? totalMonthHourSpent;
  @JsonKey(name: 'total_month_hour_spent_view')
  String? totalMonthHourSpentView;
  @JsonKey(name: 'total_month_hour_spent_view_web')
  String? totalMonthHourSpentViewWeb;
  @JsonKey(name: 'late_punch_in')
  String? latePunchIn;
  @JsonKey(name: 'early_punch_out')
  String? earlyPunchOut;
  @JsonKey(name: 'total_leaves_new')
  String? totalLeavesNew;
  @JsonKey(name: 'total_leave')
  String? totalLeave;
  @JsonKey(name: 'total_paid_leaves')
  String? totalPaidLeaves;
  @JsonKey(name: 'total_unpaid_leaves')
  String? totalUnpaidLeaves;
  @JsonKey(name: 'total_short_leave')
  String? totalShortLeave;
  @JsonKey(name: 'total_half_day')
  String? totalHalfDay;
  @JsonKey(name: 'total_present_days')
  String? totalPresentDays;
  @JsonKey(name: 'total_present')
  String? totalPresent;
  @JsonKey(name: 'total_present_attendance_days')
  String? totalPresentAttendanceDays;
  @JsonKey(name: 'total_productive_hours_view')
  String? totalProductiveHoursView;
  @JsonKey(name: 'total_productive_hours_view_web')
  String? totalProductiveHoursViewWeb;
  @JsonKey(name: 'total_productive_hours_minutes')
  String? totalProductiveHoursMinutes;
  @JsonKey(name: 'total_extra_minutes')
  String? totalExtraMinutes;
  @JsonKey(name: 'total_extra_hours_view')
  String? totalExtraHoursView;
  @JsonKey(name: 'total_extra_hours_view_web')
  String? totalExtraHoursViewWeb;
  @JsonKey(name: 'total_working_hours_view_web')
  String? totalWorkingHoursViewWeb;
  @JsonKey(name: 'total_remaining_minutes')
  String? totalRemainingMinutes;
  @JsonKey(name: 'total_remaining_hours_view')
  String? totalRemainingHoursView;
  @JsonKey(name: 'total_remaining_hours_view_web')
  String? totalRemainingHoursViewWeb;
  @JsonKey(name: 'total_leave_hours')
  String? totalLeaveHours;
  @JsonKey(name: 'total_adjusted_hours')
  String? totalAdjustedHours;
  @JsonKey(name: 'total_adjusted_hours_type')
  String? totalAdjustedHoursType;
  @JsonKey(name: 'has_extra_hours')
  bool? hasExtraHours;
  @JsonKey(name: 'total_punch_out_missing')
  String? totalPunchOutMissing;
  @JsonKey(name: 'total_week_off')
  String? totalWeekOff;
  @JsonKey(name: 'total_holidays')
  String? totalHolidays;
  @JsonKey(name: 'total_pending_attendance')
  String? totalPendingAttendance;
  @JsonKey(name: 'total_rejected_attendance')
  String? totalRejectedAttendance;
  @JsonKey(name: 'total_working_days')
  String? totalWorkingDays;
  @JsonKey(name: 'total_avg_percentage')
  String? totalAvgPercentage;
  @JsonKey(name: 'total_extra_days')
  String? totalExtraDays;
  @JsonKey(name: 'total_extra_days_view')
  String? totalExtraDaysView;
  @JsonKey(name: 'total_absent')
  String? totalAbsent;
  @JsonKey(name: 'info_message')
  String? infoMessage;
  @JsonKey(name: 'avg_per_day_working_hours')
  String? avgPerDayWorkingHours;
  @JsonKey(name: 'total_between_shift_working_minutes')
  String? totalBetweenShiftWorkingMinutes;
  @JsonKey(name: 'total_between_shift_working_minutes_view')
  String? totalBetweenShiftWorkingMinutesView;
  @JsonKey(name: 'total_salary_days')
  String? totalSalaryDays;

  AttendanceMonthResponseModel({
    this.salaryGenerated,
    this.hideWorkingHours,
    this.monthlyHistory,
    this.month,
    this.sameDayFutureTimeAttendance,
    this.userFullName,
    this.totalIncompleteDays,
    this.totalMonthHoursView,
    this.totalMonthHours,
    this.totalMonthMinutes,
    this.totalMonthHoursWeb,
    this.totalWorkingMinutes,
    this.totalPresentWorkingMinutes,
    this.totalPresentWorkingMinutesView,
    this.totalMonthHourSpent,
    this.totalMonthHourSpentView,
    this.totalMonthHourSpentViewWeb,
    this.latePunchIn,
    this.earlyPunchOut,
    this.totalLeavesNew,
    this.totalLeave,
    this.totalPaidLeaves,
    this.totalUnpaidLeaves,
    this.totalShortLeave,
    this.totalHalfDay,
    this.totalPresentDays,
    this.totalPresent,
    this.totalPresentAttendanceDays,
    this.totalProductiveHoursView,
    this.totalProductiveHoursViewWeb,
    this.totalProductiveHoursMinutes,
    this.totalExtraMinutes,
    this.totalExtraHoursView,
    this.totalExtraHoursViewWeb,
    this.totalWorkingHoursViewWeb,
    this.totalRemainingMinutes,
    this.totalRemainingHoursView,
    this.totalRemainingHoursViewWeb,
    this.totalLeaveHours,
    this.totalAdjustedHours,
    this.totalAdjustedHoursType,
    this.hasExtraHours,
    this.totalPunchOutMissing,
    this.totalWeekOff,
    this.totalHolidays,
    this.totalPendingAttendance,
    this.totalRejectedAttendance,
    this.totalWorkingDays,
    this.totalAvgPercentage,
    this.totalExtraDays,
    this.totalExtraDaysView,
    this.totalAbsent,
    this.infoMessage,
    this.avgPerDayWorkingHours,
    this.totalBetweenShiftWorkingMinutes,
    this.totalBetweenShiftWorkingMinutesView,
    this.totalSalaryDays,
  });

  factory AttendanceMonthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceMonthResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceMonthResponseModelToJson(this);

  AttendanceMonthEntity toEntity() => AttendanceMonthEntity(
    salaryGenerated: salaryGenerated,
    hideWorkingHours: hideWorkingHours,
    monthlyHistory: monthlyHistory?.map((e) => e.toEntity()).toList(),
    month: month,
    sameDayFutureTimeAttendance: sameDayFutureTimeAttendance,
    userFullName: userFullName,
    totalIncompleteDays: totalIncompleteDays,
    totalMonthHoursView: totalMonthHoursView,
    totalMonthHours: totalMonthHours,
    totalMonthMinutes: totalMonthMinutes,
    totalMonthHoursWeb: totalMonthHoursWeb,
    totalWorkingMinutes: totalWorkingMinutes,
    totalPresentWorkingMinutes: totalPresentWorkingMinutes,
    totalPresentWorkingMinutesView: totalPresentWorkingMinutesView,
    totalMonthHourSpent: totalMonthHourSpent,
    totalMonthHourSpentView: totalMonthHourSpentView,
    totalMonthHourSpentViewWeb: totalMonthHourSpentViewWeb,
    latePunchIn: latePunchIn,
    earlyPunchOut: earlyPunchOut,
    totalLeavesNew: totalLeavesNew,
    totalLeave: totalLeave,
    totalPaidLeaves: totalPaidLeaves,
    totalUnpaidLeaves: totalUnpaidLeaves,
    totalShortLeave: totalShortLeave,
    totalHalfDay: totalHalfDay,
    totalPresentDays: totalPresentDays,
    totalPresent: totalPresent,
    totalPresentAttendanceDays: totalPresentAttendanceDays,
    totalProductiveHoursView: totalProductiveHoursView,
    totalProductiveHoursViewWeb: totalProductiveHoursViewWeb,
    totalProductiveHoursMinutes: totalProductiveHoursMinutes,
    totalExtraMinutes: totalExtraMinutes,
    totalExtraHoursView: totalExtraHoursView,
    totalExtraHoursViewWeb: totalExtraHoursViewWeb,
    totalWorkingHoursViewWeb: totalWorkingHoursViewWeb,
    totalRemainingMinutes: totalRemainingMinutes,
    totalRemainingHoursView: totalRemainingHoursView,
    totalRemainingHoursViewWeb: totalRemainingHoursViewWeb,
    totalLeaveHours: totalLeaveHours,
    totalAdjustedHours: totalAdjustedHours,
    totalAdjustedHoursType: totalAdjustedHoursType,
    hasExtraHours: hasExtraHours,
    totalPunchOutMissing: totalPunchOutMissing,
    totalWeekOff: totalWeekOff,
    totalHolidays: totalHolidays,
    totalPendingAttendance: totalPendingAttendance,
    totalRejectedAttendance: totalRejectedAttendance,
    totalWorkingDays: totalWorkingDays,
    totalAvgPercentage: totalAvgPercentage,
    totalExtraDays: totalExtraDays,
    totalExtraDaysView: totalExtraDaysView,
    totalAbsent: totalAbsent,
    infoMessage: infoMessage,
    avgPerDayWorkingHours: avgPerDayWorkingHours,
    totalBetweenShiftWorkingMinutes: totalBetweenShiftWorkingMinutes,
    totalBetweenShiftWorkingMinutesView: totalBetweenShiftWorkingMinutesView,
    totalSalaryDays: totalSalaryDays,
  );
}

@JsonSerializable()
class MonthlyHistory {
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'date_name')
  String? dateName;
  @JsonKey(name: 'day_name')
  String? dayName;
  @JsonKey(name: 'day_name_short')
  String? dayNameShort;
  @JsonKey(name: 'is_today')
  bool? isToday;
  @JsonKey(name: 'attendance_id')
  String? attendanceId;
  @JsonKey(name: 'before_joining_date')
  bool? beforeJoiningDate;
  @JsonKey(name: 'shift_type')
  String? shiftType;
  @JsonKey(name: 'shift_per_day_hours')
  String? shiftPerDayHours;
  @JsonKey(name: 'late_time_start')
  String? lateTimeStart;
  @JsonKey(name: 'early_out_time')
  String? earlyOutTime;
  @JsonKey(name: 'shift_start_time')
  String? shiftStartTime;
  @JsonKey(name: 'shift_end_time')
  String? shiftEndTime;
  @JsonKey(name: 'max_punch_out_time')
  String? maxPunchOutTime;
  @JsonKey(name: 'max_shift_hour')
  String? maxShiftHour;
  @JsonKey(name: 'minimum_hours_for_full_day')
  String? minimumHoursForFullDay;
  @JsonKey(name: 'is_multiple_punch_in')
  String? isMultiplePunchIn;
  @JsonKey(name: 'per_day_minutes')
  String? perDayMinutes;
  @JsonKey(name: 'shift_per_day_hours_view')
  String? shiftPerDayHoursView;
  @JsonKey(name: 'can_apply_attendance')
  bool? canApplyAttendance;
  @JsonKey(name: 'leave_list')
  List<LeaveList>? leaveList;
  @JsonKey(name: 'is_date_gone')
  bool? isDateGone;
  @JsonKey(name: 'leave')
  bool? leave;
  @JsonKey(name: 'half_day')
  bool? halfDay;
  @JsonKey(name: 'quarter_day')
  bool? quarterDay;
  @JsonKey(name: 'three_quarter_day')
  bool? threeQuarterDay;
  @JsonKey(name: 'total_spend_time')
  String? totalSpendTime;
  @JsonKey(name: 'short_leave_available')
  bool? shortLeaveAvailable;
  @JsonKey(name: 'need_ot_request')
  String? needOtRequest;
  @JsonKey(name: 'need_ot_request_for_working_days')
  String? needOtRequestForWorkingDays;
  @JsonKey(name: 'need_ot_request_for_same_day')
  String? needOtRequestForSameDay;
  @JsonKey(name: 'present')
  bool? present;
  @JsonKey(name: 'work_report')
  bool? workReport;
  @JsonKey(name: 'extra_day')
  bool? extraDay;
  @JsonKey(name: 'late_in')
  bool? lateIn;
  @JsonKey(name: 'early_out')
  bool? earlyOut;
  @JsonKey(name: 'is_short_leave')
  bool? isShortLeave;
  @JsonKey(name: 'auto_leave')
  bool? autoLeave;
  @JsonKey(name: 'in_range_punch_in')
  bool? inRangePunchIn;
  @JsonKey(name: 'in_range_punch_out')
  bool? inRangePunchOut;
  @JsonKey(name: 'ot_request_status')
  String? otRequestStatus;
  @JsonKey(name: 'ot_request_status_view')
  String? otRequestStatusView;
  @JsonKey(name: 'attendnace_pending')
  bool? attendnacePending;
  @JsonKey(name: 'attendance_pending_message')
  String? attendancePendingMessage;
  @JsonKey(name: 'punch_in_request_sent')
  bool? punchInRequestSent;
  @JsonKey(name: 'is_punch_out_missing')
  bool? isPunchOutMissing;
  @JsonKey(name: 'punch_out_missing_message')
  String? punchOutMissingMessage;
  @JsonKey(name: 'attendance_declined')
  bool? attendanceDeclined;
  @JsonKey(name: 'attendance_declined_message')
  String? attendanceDeclinedMessage;
  @JsonKey(name: 'extra_working_hours_view')
  String? extraWorkingHoursView;
  @JsonKey(name: 'extra_working_hours')
  String? extraWorkingHours;
  @JsonKey(name: 'extra_working_hours_minutes')
  String? extraWorkingHoursMinutes;
  @JsonKey(name: 'remaining_working_hours_view')
  String? remainingWorkingHoursView;
  @JsonKey(name: 'remaining_working_hours')
  String? remainingWorkingHours;
  @JsonKey(name: 'remaining_working_hours_minutes')
  String? remainingWorkingHoursMinutes;
  @JsonKey(name: 'shift_code')
  String? shiftCode;
  @JsonKey(name: 'salary_generated')
  bool? salaryGenerated;
  @JsonKey(name: 'holiday_name')
  String? holidayName;
  @JsonKey(name: 'holiday_description')
  String? holidayDescription;
  @JsonKey(name: 'week_off')
  bool? weekOff;
  @JsonKey(name: 'holiday')
  bool? holiday;
  @JsonKey(name: 'penalty_date')
  String? penaltyDate;
  @JsonKey(name: 'penalty_name')
  String? penaltyName;
  @JsonKey(name: 'has_ot_data')
  bool? hasOtData;
  @JsonKey(name: 'ot_status_message')
  String? otStatusMessage;
  @JsonKey(name: 'punch_missing_date_ary')
  PunchMissingDateAry? punchMissingDateAry;
  @JsonKey(name: 'add_attendace_click')
  String? addAttendaceClick;
  @JsonKey(name: 'ot_data')
  OtData? otData;
  @JsonKey(name: 'shift_name')
  String? shiftName;
  @JsonKey(name: 'max_attendance_punch_out_date')
  String? maxAttendancePunchOutDate;
  @JsonKey(name: 'max_attendance_punch_out_time')
  String? maxAttendancePunchOutTime;
  @JsonKey(name: 'unit_id')
  String? unitId;
  @JsonKey(name: 'punch_in_time')
  String? punchInTime;
  @JsonKey(name: 'punch_out_time')
  String? punchOutTime;
  @JsonKey(name: 'punch_in_date_time')
  String? punchInDateTime;
  @JsonKey(name: 'punch_out_date_time')
  String? punchOutDateTime;
  @JsonKey(name: 'attendance_date_start')
  String? attendanceDateStart;
  @JsonKey(name: 'shift_hours_day_time')
  String? shiftHoursDayTime;
  @JsonKey(name: 'over_time_day_time')
  String? overTimeDayTime;
  @JsonKey(name: 'shift_hours_night_time')
  String? shiftHoursNightTime;
  @JsonKey(name: 'overtime_nighttime_without_prior')
  String? overtimeNighttimeWithoutPrior;
  @JsonKey(name: 'overtime_nighttime_with_prior')
  String? overtimeNighttimeWithPrior;
  @JsonKey(name: 'late_in_time_view')
  String? lateInTimeView;
  @JsonKey(name: 'early_out_time_view')
  String? earlyOutTimeView;
  @JsonKey(name: 'punch_in_odometer')
  String? punchInOdometer;
  @JsonKey(name: 'punch_in_odometer_image')
  String? punchInOdometerImage;
  @JsonKey(name: 'last_punch_in_odometer')
  String? lastPunchInOdometer;
  @JsonKey(name: 'last_punch_in_odometer_image')
  String? lastPunchInOdometerImage;
  @JsonKey(name: 'punch_out_odometer')
  String? punchOutOdometer;
  @JsonKey(name: 'punch_out_odometer_image')
  String? punchOutOdometerImage;
  @JsonKey(name: 'punch_in_branch_id')
  String? punchInBranchId;
  @JsonKey(name: 'punch_in_branch_type')
  String? punchInBranchType;
  @JsonKey(name: 'punch_out_branch_id')
  String? punchOutBranchId;
  @JsonKey(name: 'punch_out_branch_type')
  String? punchOutBranchType;
  @JsonKey(name: 'between_shift_working_minutes')
  String? betweenShiftWorkingMinutes;
  @JsonKey(name: 'between_shift_working_minutes_view')
  String? betweenShiftWorkingMinutesView;
  @JsonKey(name: 'punch_in_data')
  List<PunchInDatum>? punchInData;
  @JsonKey(name: 'total_spend_minutes')
  String? totalSpendMinutes;
  @JsonKey(name: 'total_hours_spend')
  String? totalHoursSpend;
  @JsonKey(name: 'productive_working_hours')
  String? productiveWorkingHours;
  @JsonKey(name: 'productive_working_hours_minutes')
  String? productiveWorkingHoursMinutes;
  @JsonKey(name: 'attendance_history')
  List<AttendanceHistory>? attendanceHistory;
  @JsonKey(name: 'new_ui_data_view')
  NewUiDataView? newUiDataView;
  @JsonKey(name: 'attendance_punch_out_missing_id')
  String? attendancePunchOutMissingId;
  @JsonKey(name: 'punch_out_missing_reject_reason')
  String? punchOutMissingRejectReason;
  @JsonKey(name: 'attendance_punch_out_missing_status')
  String? attendancePunchOutMissingStatus;
  @JsonKey(name: 'attendance_punch_out_missing_status_view')
  String? attendancePunchOutMissingStatusView;
  @JsonKey(name: 'total_spend_time_break')
  String? totalSpendTimeBreak;

  MonthlyHistory({
    this.date,
    this.dateName,
    this.dayName,
    this.dayNameShort,
    this.isToday,
    this.attendanceId,
    this.beforeJoiningDate,
    this.shiftType,
    this.shiftPerDayHours,
    this.lateTimeStart,
    this.earlyOutTime,
    this.shiftStartTime,
    this.shiftEndTime,
    this.maxPunchOutTime,
    this.maxShiftHour,
    this.minimumHoursForFullDay,
    this.isMultiplePunchIn,
    this.perDayMinutes,
    this.shiftPerDayHoursView,
    this.canApplyAttendance,
    this.leaveList,
    this.isDateGone,
    this.leave,
    this.halfDay,
    this.quarterDay,
    this.threeQuarterDay,
    this.totalSpendTime,
    this.shortLeaveAvailable,
    this.needOtRequest,
    this.needOtRequestForWorkingDays,
    this.needOtRequestForSameDay,
    this.present,
    this.workReport,
    this.extraDay,
    this.lateIn,
    this.earlyOut,
    this.isShortLeave,
    this.autoLeave,
    this.inRangePunchIn,
    this.inRangePunchOut,
    this.otRequestStatus,
    this.otRequestStatusView,
    this.attendnacePending,
    this.attendancePendingMessage,
    this.punchInRequestSent,
    this.isPunchOutMissing,
    this.punchOutMissingMessage,
    this.attendanceDeclined,
    this.attendanceDeclinedMessage,
    this.extraWorkingHoursView,
    this.extraWorkingHours,
    this.extraWorkingHoursMinutes,
    this.remainingWorkingHoursView,
    this.remainingWorkingHours,
    this.remainingWorkingHoursMinutes,
    this.shiftCode,
    this.salaryGenerated,
    this.holidayName,
    this.holidayDescription,
    this.weekOff,
    this.holiday,
    this.penaltyDate,
    this.penaltyName,
    this.hasOtData,
    this.otStatusMessage,
    this.punchMissingDateAry,
    this.addAttendaceClick,
    this.otData,
    this.shiftName,
    this.maxAttendancePunchOutDate,
    this.maxAttendancePunchOutTime,
    this.unitId,
    this.punchInTime,
    this.punchOutTime,
    this.punchInDateTime,
    this.punchOutDateTime,
    this.attendanceDateStart,
    this.shiftHoursDayTime,
    this.overTimeDayTime,
    this.shiftHoursNightTime,
    this.overtimeNighttimeWithoutPrior,
    this.overtimeNighttimeWithPrior,
    this.lateInTimeView,
    this.earlyOutTimeView,
    this.punchInOdometer,
    this.punchInOdometerImage,
    this.lastPunchInOdometer,
    this.lastPunchInOdometerImage,
    this.punchOutOdometer,
    this.punchOutOdometerImage,
    this.punchInBranchId,
    this.punchInBranchType,
    this.punchOutBranchId,
    this.punchOutBranchType,
    this.betweenShiftWorkingMinutes,
    this.betweenShiftWorkingMinutesView,
    this.punchInData,
    this.totalSpendMinutes,
    this.totalHoursSpend,
    this.productiveWorkingHours,
    this.productiveWorkingHoursMinutes,
    this.attendanceHistory,
    this.newUiDataView,
    this.attendancePunchOutMissingId,
    this.punchOutMissingRejectReason,
    this.attendancePunchOutMissingStatus,
    this.attendancePunchOutMissingStatusView,
    this.totalSpendTimeBreak,
  });

  factory MonthlyHistory.fromJson(Map<String, dynamic> json) =>
      _$MonthlyHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$MonthlyHistoryToJson(this);

  MonthlyHistoryEntity toEntity() => MonthlyHistoryEntity(
    date: date,
    dateName: dateName,
    dayName: dayName,
    dayNameShort: dayNameShort,
    isToday: isToday,
    attendanceId: attendanceId,
    beforeJoiningDate: beforeJoiningDate,
    shiftType: shiftType,
    shiftPerDayHours: shiftPerDayHours,
    lateTimeStart: lateTimeStart,
    earlyOutTime: earlyOutTime,
    shiftStartTime: shiftStartTime,
    shiftEndTime: shiftEndTime,
    maxPunchOutTime: maxPunchOutTime,
    maxShiftHour: maxShiftHour,
    minimumHoursForFullDay: minimumHoursForFullDay,
    isMultiplePunchIn: isMultiplePunchIn,
    perDayMinutes: perDayMinutes,
    shiftPerDayHoursView: shiftPerDayHoursView,
    canApplyAttendance: canApplyAttendance,
    leaveList: leaveList?.map((e) => e.toEntity()).toList(),
    isDateGone: isDateGone,
    leave: leave,
    halfDay: halfDay,
    quarterDay: quarterDay,
    threeQuarterDay: threeQuarterDay,
    totalSpendTime: totalSpendTime,
    shortLeaveAvailable: shortLeaveAvailable,
    needOtRequest: needOtRequest,
    needOtRequestForWorkingDays: needOtRequestForWorkingDays,
    needOtRequestForSameDay: needOtRequestForSameDay,
    present: present,
    workReport: workReport,
    extraDay: extraDay,
    lateIn: lateIn,
    earlyOut: earlyOut,
    isShortLeave: isShortLeave,
    autoLeave: autoLeave,
    inRangePunchIn: inRangePunchIn,
    inRangePunchOut: inRangePunchOut,
    otRequestStatus: otRequestStatus,
    otRequestStatusView: otRequestStatusView,
    attendnacePending: attendnacePending,
    attendancePendingMessage: attendancePendingMessage,
    punchInRequestSent: punchInRequestSent,
    isPunchOutMissing: isPunchOutMissing,
    punchOutMissingMessage: punchOutMissingMessage,
    attendanceDeclined: attendanceDeclined,
    attendanceDeclinedMessage: attendanceDeclinedMessage,
    extraWorkingHoursView: extraWorkingHoursView,
    extraWorkingHours: extraWorkingHours,
    extraWorkingHoursMinutes: extraWorkingHoursMinutes,
    remainingWorkingHoursView: remainingWorkingHoursView,
    remainingWorkingHours: remainingWorkingHours,
    remainingWorkingHoursMinutes: remainingWorkingHoursMinutes,
    shiftCode: shiftCode,
    salaryGenerated: salaryGenerated,
    holidayName: holidayName,
    holidayDescription: holidayDescription,
    weekOff: weekOff,
    holiday: holiday,
    penaltyDate: penaltyDate,
    penaltyName: penaltyName,
    hasOtData: hasOtData,
    otStatusMessage: otStatusMessage,
    punchMissingDateAry: punchMissingDateAry?.toEntity(),
    addAttendaceClick: addAttendaceClick,
    otData: otData?.toEntity(),
    shiftName: shiftName,
    maxAttendancePunchOutDate: maxAttendancePunchOutDate,
    maxAttendancePunchOutTime: maxAttendancePunchOutTime,
    unitId: unitId,
    punchInTime: punchInTime,
    punchOutTime: punchOutTime,
    punchInDateTime: punchInDateTime,
    punchOutDateTime: punchOutDateTime,
    attendanceDateStart: attendanceDateStart,
    shiftHoursDayTime: shiftHoursDayTime,
    overTimeDayTime: overTimeDayTime,
    shiftHoursNightTime: shiftHoursNightTime,
    overtimeNighttimeWithoutPrior: overtimeNighttimeWithoutPrior,
    overtimeNighttimeWithPrior: overtimeNighttimeWithPrior,
    lateInTimeView: lateInTimeView,
    earlyOutTimeView: earlyOutTimeView,
    punchInOdometer: punchInOdometer,
    punchInOdometerImage: punchInOdometerImage,
    lastPunchInOdometer: lastPunchInOdometer,
    lastPunchInOdometerImage: lastPunchInOdometerImage,
    punchOutOdometer: punchOutOdometer,
    punchOutOdometerImage: punchOutOdometerImage,
    punchInBranchId: punchInBranchId,
    punchInBranchType: punchInBranchType,
    punchOutBranchId: punchOutBranchId,
    punchOutBranchType: punchOutBranchType,
    betweenShiftWorkingMinutes: betweenShiftWorkingMinutes,
    betweenShiftWorkingMinutesView: betweenShiftWorkingMinutesView,
    punchInData: punchInData?.map((e) => e.toEntity()).toList(),
    totalSpendMinutes: totalSpendMinutes,
    totalHoursSpend: totalHoursSpend,
    productiveWorkingHours: productiveWorkingHours,
    productiveWorkingHoursMinutes: productiveWorkingHoursMinutes,
    attendanceHistory: attendanceHistory?.map((e) => e.toEntity()).toList(),
    newUiDataView: newUiDataView?.toEntity(),
    attendancePunchOutMissingId: attendancePunchOutMissingId,
    punchOutMissingRejectReason: punchOutMissingRejectReason,
    attendancePunchOutMissingStatus: attendancePunchOutMissingStatus,
    attendancePunchOutMissingStatusView: attendancePunchOutMissingStatusView,
    totalSpendTimeBreak: totalSpendTimeBreak,
  );
}

@JsonSerializable()
class AttendanceHistory {
  @JsonKey(name: 'attendance_break_history_id')
  String? attendanceBreakHistoryId;
  @JsonKey(name: 'attendance_type_name')
  String? attendanceTypeName;
  @JsonKey(name: 'break_start_date')
  String? breakStartDate;
  @JsonKey(name: 'break_start_date_ymd')
  String? breakStartDateYmd;
  @JsonKey(name: 'break_end_date')
  String? breakEndDate;
  @JsonKey(name: 'break_end_date_ymd')
  String? breakEndDateYmd;
  @JsonKey(name: 'break_in_time')
  String? breakInTime;
  @JsonKey(name: 'break_in_time_24')
  String? breakInTime24;
  @JsonKey(name: 'break_out_time')
  String? breakOutTime;
  @JsonKey(name: 'break_out_time_24')
  String? breakOutTime24;
  @JsonKey(name: 'break_status')
  String? breakStatus;
  @JsonKey(name: 'break_color')
  String? breakColor;
  @JsonKey(name: 'break_status_view')
  String? breakStatusView;
  @JsonKey(name: 'total_break_hours_spend')
  String? totalBreakHoursSpend;
  @JsonKey(name: 'break_name')
  String? breakName;
  @JsonKey(name: 'start_minutes')
  String? startMinutes;
  @JsonKey(name: 'end_minutes')
  String? endMinutes;
  @JsonKey(name: 'total_minutes')
  String? totalMinutes;

  AttendanceHistory({
    this.attendanceBreakHistoryId,
    this.attendanceTypeName,
    this.breakStartDate,
    this.breakStartDateYmd,
    this.breakEndDate,
    this.breakEndDateYmd,
    this.breakInTime,
    this.breakInTime24,
    this.breakOutTime,
    this.breakOutTime24,
    this.breakStatus,
    this.breakColor,
    this.breakStatusView,
    this.totalBreakHoursSpend,
    this.breakName,
    this.startMinutes,
    this.endMinutes,
    this.totalMinutes,
  });

  factory AttendanceHistory.fromJson(Map<String, dynamic> json) =>
      _$AttendanceHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceHistoryToJson(this);

  AttendanceHistoryEntity toEntity() => AttendanceHistoryEntity(
    attendanceBreakHistoryId: attendanceBreakHistoryId,
    attendanceTypeName: attendanceTypeName,
    breakStartDate: breakStartDate,
    breakStartDateYmd: breakStartDateYmd,
    breakEndDate: breakEndDate,
    breakEndDateYmd: breakEndDateYmd,
    breakInTime: breakInTime,
    breakInTime24: breakInTime24,
    breakOutTime: breakOutTime,
    breakOutTime24: breakOutTime24,
    breakStatus: breakStatus,
    breakColor: breakColor,
    breakStatusView: breakStatusView,
    totalBreakHoursSpend: totalBreakHoursSpend,
    breakName: breakName,
    startMinutes: startMinutes,
    endMinutes: endMinutes,
    totalMinutes: totalMinutes,
  );
}

@JsonSerializable()
class LeaveList {
  @JsonKey(name: 'leave_type_name')
  String? leaveTypeName;
  @JsonKey(name: 'can_apply_attendance')
  bool? canApplyAttendance;
  @JsonKey(name: 'leave_paid_unpaid')
  String? leavePaidUnpaid;
  @JsonKey(name: 'is_paid_leave')
  bool? isPaidLeave;
  @JsonKey(name: 'leave_day_type_status')
  String? leaveDayTypeStatus;
  @JsonKey(name: 'leave_day_view')
  String? leaveDayView;
  @JsonKey(name: 'leave_day_type')
  String? leaveDayType;
  @JsonKey(name: 'leave_reason')
  String? leaveReason;
  @JsonKey(name: 'auto_leave_reason')
  String? autoLeaveReason;

  LeaveList({
    this.leaveTypeName,
    this.canApplyAttendance,
    this.leavePaidUnpaid,
    this.isPaidLeave,
    this.leaveDayTypeStatus,
    this.leaveDayView,
    this.leaveDayType,
    this.leaveReason,
    this.autoLeaveReason,
  });

  factory LeaveList.fromJson(Map<String, dynamic> json) =>
      _$LeaveListFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveListToJson(this);

  LeaveListEntity toEntity() => LeaveListEntity(
    leaveTypeName: leaveTypeName,
    canApplyAttendance: canApplyAttendance,
    leavePaidUnpaid: leavePaidUnpaid,
    isPaidLeave: isPaidLeave,
    leaveDayTypeStatus: leaveDayTypeStatus,
    leaveDayView: leaveDayView,
    leaveDayType: leaveDayType,
    leaveReason: leaveReason,
    autoLeaveReason: autoLeaveReason,
  );
}

@JsonSerializable()
class NewUiDataView {
  @JsonKey(name: 'multi_punch_data_view')
  List<PunchInDatum>? multiPunchDataView;
  @JsonKey(name: 'breaks')
  List<Break>? breaks;
  @JsonKey(name: 'working_hour_in_per')
  String? workingHourInPer;

  NewUiDataView({this.multiPunchDataView, this.breaks, this.workingHourInPer});

  factory NewUiDataView.fromJson(Map<String, dynamic> json) =>
      _$NewUiDataViewFromJson(json);

  Map<String, dynamic> toJson() => _$NewUiDataViewToJson(this);

  NewUiDataViewEntity toEntity() => NewUiDataViewEntity(
    multiPunchDataView: multiPunchDataView?.map((e) => e.toEntity()).toList(),
    breaks: breaks?.map((e) => e.toEntity()).toList(),
    workingHourInPer: workingHourInPer,
  );
}

@JsonSerializable()
class Break {
  @JsonKey(name: 'break_color')
  String? breakColor;
  @JsonKey(name: 'break_name')
  String? breakName;
  @JsonKey(name: 'start_minutes')
  String? startMinutes;
  @JsonKey(name: 'end_minutes')
  String? endMinutes;
  @JsonKey(name: 'total_minutes')
  String? totalMinutes;
  @JsonKey(name: 'break_time_view')
  String? breakTimeView;

  Break({
    this.breakColor,
    this.breakName,
    this.startMinutes,
    this.endMinutes,
    this.totalMinutes,
    this.breakTimeView,
  });

  factory Break.fromJson(Map<String, dynamic> json) => _$BreakFromJson(json);

  Map<String, dynamic> toJson() => _$BreakToJson(this);

  BreakEntity toEntity() => BreakEntity(
    breakColor: breakColor,
    breakName: breakName,
    startMinutes: startMinutes,
    endMinutes: endMinutes,
    totalMinutes: totalMinutes,
    breakTimeView: breakTimeView,
  );
}

@JsonSerializable()
class PunchInDatum {
  @JsonKey(name: 'punch_in_date')
  String? punchInDate;
  @JsonKey(name: 'punch_in_date_ymd')
  String? punchInDateYmd;
  @JsonKey(name: 'punch_in_time')
  String? punchInTime;
  @JsonKey(name: 'punch_in_time_24')
  String? punchInTime24;
  @JsonKey(name: 'punch_out_date')
  String? punchOutDate;
  @JsonKey(name: 'punch_out_date_ymd')
  String? punchOutDateYmd;
  @JsonKey(name: 'punch_out_time')
  String? punchOutTime;
  @JsonKey(name: 'punch_out_time_24')
  String? punchOutTime24;
  @JsonKey(name: 'working_hour')
  String? workingHour;
  @JsonKey(name: 'location_name_in')
  String? locationNameIn;
  @JsonKey(name: 'location_name_out')
  String? locationNameOut;
  @JsonKey(name: 'working_hour_minute')
  String? workingHourMinute;
  @JsonKey(name: 'breaks')
  List<AttendanceHistory>? breaks;

  PunchInDatum({
    this.punchInDate,
    this.punchInDateYmd,
    this.punchInTime,
    this.punchInTime24,
    this.punchOutDate,
    this.punchOutDateYmd,
    this.punchOutTime,
    this.punchOutTime24,
    this.workingHour,
    this.locationNameIn,
    this.locationNameOut,
    this.workingHourMinute,
    this.breaks,
  });

  factory PunchInDatum.fromJson(Map<String, dynamic> json) =>
      _$PunchInDatumFromJson(json);

  Map<String, dynamic> toJson() => _$PunchInDatumToJson(this);

  PunchInDatumEntity toEntity() => PunchInDatumEntity(
    punchInDate: punchInDate,
    punchInDateYmd: punchInDateYmd,
    punchInTime: punchInTime,
    punchInTime24: punchInTime24,
    punchOutDate: punchOutDate,
    punchOutDateYmd: punchOutDateYmd,
    punchOutTime: punchOutTime,
    punchOutTime24: punchOutTime24,
    workingHour: workingHour,
    locationNameIn: locationNameIn,
    locationNameOut: locationNameOut,
    workingHourMinute: workingHourMinute,
    breaks: breaks?.map((e) => e.toEntity()).toList(),
  );
}

@JsonSerializable()
class OtData {
  @JsonKey(name: 'ot_id')
  String? otId;
  @JsonKey(name: 'ot_date')
  String? otDate;
  @JsonKey(name: 'ot_time')
  String? otTime;
  @JsonKey(name: 'ot_status_change_reason')
  String? otStatusChangeReason;
  @JsonKey(name: 'ot_requested_date')
  String? otRequestedDate;
  @JsonKey(name: 'ot_status_changed_date')
  String? otStatusChangedDate;
  @JsonKey(name: 'ot_remark')
  String? otRemark;
  @JsonKey(name: 'ot_status')
  String? otStatus;
  @JsonKey(name: 'ot_type')
  String? otType;
  @JsonKey(name: 'ot_day_type')
  String? otDayType;
  @JsonKey(name: 'ot_change_by_name')
  String? otChangeByName;
  @JsonKey(name: 'rejected_reason')
  String? rejectedReason;

  OtData({
    this.otId,
    this.otDate,
    this.otTime,
    this.otStatusChangeReason,
    this.otRequestedDate,
    this.otStatusChangedDate,
    this.otRemark,
    this.otStatus,
    this.otType,
    this.otDayType,
    this.otChangeByName,
    this.rejectedReason,
  });

  factory OtData.fromJson(Map<String, dynamic> json) => _$OtDataFromJson(json);

  Map<String, dynamic> toJson() => _$OtDataToJson(this);

  OtDataEntity toEntity() => OtDataEntity(
    otId: otId,
    otDate: otDate,
    otTime: otTime,
    otStatusChangeReason: otStatusChangeReason,
    otRequestedDate: otRequestedDate,
    otStatusChangedDate: otStatusChangedDate,
    otRemark: otRemark,
    otStatus: otStatus,
    otType: otType,
    otDayType: otDayType,
    otChangeByName: otChangeByName,
    rejectedReason: rejectedReason,
  );
}

@JsonSerializable()
class PunchMissingDateAry {
  @JsonKey(name: 'date_one_view')
  String? dateOneView;
  @JsonKey(name: 'date_one')
  String? dateOne;

  PunchMissingDateAry({this.dateOneView, this.dateOne});

  factory PunchMissingDateAry.fromJson(Map<String, dynamic> json) =>
      _$PunchMissingDateAryFromJson(json);

  Map<String, dynamic> toJson() => _$PunchMissingDateAryToJson(this);

  PunchMissingDateAryEntity toEntity() =>
      PunchMissingDateAryEntity(dateOneView: dateOneView, dateOne: dateOne);
}
