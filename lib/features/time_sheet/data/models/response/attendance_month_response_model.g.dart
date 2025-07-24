// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_month_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceMonthResponseModel _$AttendanceMonthResponseModelFromJson(
        Map<String, dynamic> json) =>
    AttendanceMonthResponseModel(
      salaryGenerated: json['salary_generated'] as bool?,
      hideWorkingHours: json['hide_working_hours'] as bool?,
      monthlyHistory: (json['monthly_history'] as List<dynamic>?)
          ?.map((e) => MonthlyHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      month: json['month'] as String?,
      sameDayFutureTimeAttendance:
          json['same_day_future_time_attendance'] as bool?,
      userFullName: json['user_full_name'] as String?,
      totalIncompleteDays: json['total_incomplete_days'] as String?,
      totalMonthHoursView: json['total_month_hours_view'] as String?,
      totalMonthHours: json['total_month_hours'] as String?,
      totalMonthMinutes: json['total_month_minutes'] as String?,
      totalMonthHoursWeb: json['total_month_hours_web'] as String?,
      totalWorkingMinutes: json['total_working_minutes'] as String?,
      totalPresentWorkingMinutes:
          json['total_present_working_minutes'] as String?,
      totalPresentWorkingMinutesView:
          json['total_present_working_minutes_view'] as String?,
      totalMonthHourSpent: json['total_month_hour_spent'] as String?,
      totalMonthHourSpentView: json['total_month_hour_spent_view'] as String?,
      totalMonthHourSpentViewWeb:
          json['total_month_hour_spent_view_web'] as String?,
      latePunchIn: json['late_punch_in'] as String?,
      earlyPunchOut: json['early_punch_out'] as String?,
      totalLeavesNew: json['total_leaves_new'] as String?,
      totalLeave: json['total_leave'] as String?,
      totalPaidLeaves: json['total_paid_leaves'] as String?,
      totalUnpaidLeaves: json['total_unpaid_leaves'] as String?,
      totalShortLeave: json['total_short_leave'] as String?,
      totalHalfDay: json['total_half_day'] as String?,
      totalPresentDays: json['total_present_days'] as String?,
      totalPresent: json['total_present'] as String?,
      totalPresentAttendanceDays:
          json['total_present_attendance_days'] as String?,
      totalProductiveHoursView: json['total_productive_hours_view'] as String?,
      totalProductiveHoursViewWeb:
          json['total_productive_hours_view_web'] as String?,
      totalProductiveHoursMinutes:
          json['total_productive_hours_minutes'] as String?,
      totalExtraMinutes: json['total_extra_minutes'] as String?,
      totalExtraHoursView: json['total_extra_hours_view'] as String?,
      totalExtraHoursViewWeb: json['total_extra_hours_view_web'] as String?,
      totalWorkingHoursViewWeb: json['total_working_hours_view_web'] as String?,
      totalRemainingMinutes: json['total_remaining_minutes'] as String?,
      totalRemainingHoursView: json['total_remaining_hours_view'] as String?,
      totalRemainingHoursViewWeb:
          json['total_remaining_hours_view_web'] as String?,
      totalLeaveHours: json['total_leave_hours'] as String?,
      totalAdjustedHours: json['total_adjusted_hours'] as String?,
      totalAdjustedHoursType: json['total_adjusted_hours_type'] as String?,
      hasExtraHours: json['has_extra_hours'] as bool?,
      totalPunchOutMissing: json['total_punch_out_missing'] as String?,
      totalWeekOff: json['total_week_off'] as String?,
      totalHolidays: json['total_holidays'] as String?,
      totalPendingAttendance: json['total_pending_attendance'] as String?,
      totalRejectedAttendance: json['total_rejected_attendance'] as String?,
      totalWorkingDays: json['total_working_days'] as String?,
      totalAvgPercentage: json['total_avg_percentage'] as String?,
      totalExtraDays: json['total_extra_days'] as String?,
      totalExtraDaysView: json['total_extra_days_view'] as String?,
      totalAbsent: json['total_absent'] as String?,
      infoMessage: json['info_message'] as String?,
      avgPerDayWorkingHours: json['avg_per_day_working_hours'] as String?,
      totalBetweenShiftWorkingMinutes:
          json['total_between_shift_working_minutes'] as String?,
      totalBetweenShiftWorkingMinutesView:
          json['total_between_shift_working_minutes_view'] as String?,
      totalSalaryDays: json['total_salary_days'] as String?,
    );

Map<String, dynamic> _$AttendanceMonthResponseModelToJson(
        AttendanceMonthResponseModel instance) =>
    <String, dynamic>{
      'salary_generated': instance.salaryGenerated,
      'hide_working_hours': instance.hideWorkingHours,
      'monthly_history': instance.monthlyHistory,
      'month': instance.month,
      'same_day_future_time_attendance': instance.sameDayFutureTimeAttendance,
      'user_full_name': instance.userFullName,
      'total_incomplete_days': instance.totalIncompleteDays,
      'total_month_hours_view': instance.totalMonthHoursView,
      'total_month_hours': instance.totalMonthHours,
      'total_month_minutes': instance.totalMonthMinutes,
      'total_month_hours_web': instance.totalMonthHoursWeb,
      'total_working_minutes': instance.totalWorkingMinutes,
      'total_present_working_minutes': instance.totalPresentWorkingMinutes,
      'total_present_working_minutes_view':
          instance.totalPresentWorkingMinutesView,
      'total_month_hour_spent': instance.totalMonthHourSpent,
      'total_month_hour_spent_view': instance.totalMonthHourSpentView,
      'total_month_hour_spent_view_web': instance.totalMonthHourSpentViewWeb,
      'late_punch_in': instance.latePunchIn,
      'early_punch_out': instance.earlyPunchOut,
      'total_leaves_new': instance.totalLeavesNew,
      'total_leave': instance.totalLeave,
      'total_paid_leaves': instance.totalPaidLeaves,
      'total_unpaid_leaves': instance.totalUnpaidLeaves,
      'total_short_leave': instance.totalShortLeave,
      'total_half_day': instance.totalHalfDay,
      'total_present_days': instance.totalPresentDays,
      'total_present': instance.totalPresent,
      'total_present_attendance_days': instance.totalPresentAttendanceDays,
      'total_productive_hours_view': instance.totalProductiveHoursView,
      'total_productive_hours_view_web': instance.totalProductiveHoursViewWeb,
      'total_productive_hours_minutes': instance.totalProductiveHoursMinutes,
      'total_extra_minutes': instance.totalExtraMinutes,
      'total_extra_hours_view': instance.totalExtraHoursView,
      'total_extra_hours_view_web': instance.totalExtraHoursViewWeb,
      'total_working_hours_view_web': instance.totalWorkingHoursViewWeb,
      'total_remaining_minutes': instance.totalRemainingMinutes,
      'total_remaining_hours_view': instance.totalRemainingHoursView,
      'total_remaining_hours_view_web': instance.totalRemainingHoursViewWeb,
      'total_leave_hours': instance.totalLeaveHours,
      'total_adjusted_hours': instance.totalAdjustedHours,
      'total_adjusted_hours_type': instance.totalAdjustedHoursType,
      'has_extra_hours': instance.hasExtraHours,
      'total_punch_out_missing': instance.totalPunchOutMissing,
      'total_week_off': instance.totalWeekOff,
      'total_holidays': instance.totalHolidays,
      'total_pending_attendance': instance.totalPendingAttendance,
      'total_rejected_attendance': instance.totalRejectedAttendance,
      'total_working_days': instance.totalWorkingDays,
      'total_avg_percentage': instance.totalAvgPercentage,
      'total_extra_days': instance.totalExtraDays,
      'total_extra_days_view': instance.totalExtraDaysView,
      'total_absent': instance.totalAbsent,
      'info_message': instance.infoMessage,
      'avg_per_day_working_hours': instance.avgPerDayWorkingHours,
      'total_between_shift_working_minutes':
          instance.totalBetweenShiftWorkingMinutes,
      'total_between_shift_working_minutes_view':
          instance.totalBetweenShiftWorkingMinutesView,
      'total_salary_days': instance.totalSalaryDays,
    };

MonthlyHistory _$MonthlyHistoryFromJson(Map<String, dynamic> json) =>
    MonthlyHistory(
      date: json['date'] as String?,
      dateName: json['date_name'] as String?,
      dayName: json['day_name'] as String?,
      dayNameShort: json['day_name_short'] as String?,
      isToday: json['is_today'] as bool?,
      attendanceId: json['attendance_id'] as String?,
      beforeJoiningDate: json['before_joining_date'] as bool?,
      shiftType: json['shift_type'] as String?,
      shiftPerDayHours: json['shift_per_day_hours'] as String?,
      lateTimeStart: json['late_time_start'] as String?,
      earlyOutTime: json['early_out_time'] as String?,
      shiftStartTime: json['shift_start_time'] as String?,
      shiftEndTime: json['shift_end_time'] as String?,
      maxPunchOutTime: json['max_punch_out_time'] as String?,
      maxShiftHour: json['max_shift_hour'] as String?,
      minimumHoursForFullDay: json['minimum_hours_for_full_day'] as String?,
      isMultiplePunchIn: json['is_multiple_punch_in'] as String?,
      perDayMinutes: json['per_day_minutes'] as String?,
      shiftPerDayHoursView: json['shift_per_day_hours_view'] as String?,
      canApplyAttendance: json['can_apply_attendance'] as bool?,
      leaveList: (json['leave_list'] as List<dynamic>?)
          ?.map((e) => LeaveList.fromJson(e as Map<String, dynamic>))
          .toList(),
      isDateGone: json['is_date_gone'] as bool?,
      leave: json['leave'] as bool?,
      halfDay: json['half_day'] as bool?,
      quarterDay: json['quarter_day'] as bool?,
      threeQuarterDay: json['three_quarter_day'] as bool?,
      totalSpendTime: json['total_spend_time'] as String?,
      shortLeaveAvailable: json['short_leave_available'] as bool?,
      needOtRequest: json['need_ot_request'] as String?,
      needOtRequestForWorkingDays:
          json['need_ot_request_for_working_days'] as String?,
      needOtRequestForSameDay: json['need_ot_request_for_same_day'] as String?,
      present: json['present'] as bool?,
      workReport: json['work_report'] as bool?,
      extraDay: json['extra_day'] as bool?,
      lateIn: json['late_in'] as bool?,
      earlyOut: json['early_out'] as bool?,
      isShortLeave: json['is_short_leave'] as bool?,
      autoLeave: json['auto_leave'] as bool?,
      inRangePunchIn: json['in_range_punch_in'] as bool?,
      inRangePunchOut: json['in_range_punch_out'] as bool?,
      otRequestStatus: json['ot_request_status'] as String?,
      otRequestStatusView: json['ot_request_status_view'] as String?,
      attendnacePending: json['attendnace_pending'] as bool?,
      attendancePendingMessage: json['attendance_pending_message'] as String?,
      punchInRequestSent: json['punch_in_request_sent'] as bool?,
      isPunchOutMissing: json['is_punch_out_missing'] as bool?,
      punchOutMissingMessage: json['punch_out_missing_message'] as String?,
      attendanceDeclined: json['attendance_declined'] as bool?,
      attendanceDeclinedMessage: json['attendance_declined_message'] as String?,
      extraWorkingHoursView: json['extra_working_hours_view'] as String?,
      extraWorkingHours: json['extra_working_hours'] as String?,
      extraWorkingHoursMinutes: json['extra_working_hours_minutes'] as String?,
      remainingWorkingHoursView:
          json['remaining_working_hours_view'] as String?,
      remainingWorkingHours: json['remaining_working_hours'] as String?,
      remainingWorkingHoursMinutes:
          json['remaining_working_hours_minutes'] as String?,
      shiftCode: json['shift_code'] as String?,
      salaryGenerated: json['salary_generated'] as bool?,
      holidayName: json['holiday_name'] as String?,
      holidayDescription: json['holiday_description'] as String?,
      weekOff: json['week_off'] as bool?,
      holiday: json['holiday'] as bool?,
      penaltyDate: json['penalty_date'] as String?,
      penaltyName: json['penalty_name'] as String?,
      hasOtData: json['has_ot_data'] as bool?,
      otStatusMessage: json['ot_status_message'] as String?,
      punchMissingDateAry: json['punch_missing_date_ary'] == null
          ? null
          : PunchMissingDateAry.fromJson(
              json['punch_missing_date_ary'] as Map<String, dynamic>),
      addAttendaceClick: json['add_attendace_click'] as String?,
      otData: json['ot_data'] == null
          ? null
          : OtData.fromJson(json['ot_data'] as Map<String, dynamic>),
      shiftName: json['shift_name'] as String?,
      maxAttendancePunchOutDate:
          json['max_attendance_punch_out_date'] as String?,
      maxAttendancePunchOutTime:
          json['max_attendance_punch_out_time'] as String?,
      unitId: json['unit_id'] as String?,
      punchInTime: json['punch_in_time'] as String?,
      punchOutTime: json['punch_out_time'] as String?,
      punchInDateTime: json['punch_in_date_time'] as String?,
      punchOutDateTime: json['punch_out_date_time'] as String?,
      attendanceDateStart: json['attendance_date_start'] as String?,
      shiftHoursDayTime: json['shift_hours_day_time'] as String?,
      overTimeDayTime: json['over_time_day_time'] as String?,
      shiftHoursNightTime: json['shift_hours_night_time'] as String?,
      overtimeNighttimeWithoutPrior:
          json['overtime_nighttime_without_prior'] as String?,
      overtimeNighttimeWithPrior:
          json['overtime_nighttime_with_prior'] as String?,
      lateInTimeView: json['late_in_time_view'] as String?,
      earlyOutTimeView: json['early_out_time_view'] as String?,
      punchInOdometer: json['punch_in_odometer'] as String?,
      punchInOdometerImage: json['punch_in_odometer_image'] as String?,
      lastPunchInOdometer: json['last_punch_in_odometer'] as String?,
      lastPunchInOdometerImage: json['last_punch_in_odometer_image'] as String?,
      punchOutOdometer: json['punch_out_odometer'] as String?,
      punchOutOdometerImage: json['punch_out_odometer_image'] as String?,
      punchInBranchId: json['punch_in_branch_id'] as String?,
      punchInBranchType: json['punch_in_branch_type'] as String?,
      punchOutBranchId: json['punch_out_branch_id'] as String?,
      punchOutBranchType: json['punch_out_branch_type'] as String?,
      betweenShiftWorkingMinutes:
          json['between_shift_working_minutes'] as String?,
      betweenShiftWorkingMinutesView:
          json['between_shift_working_minutes_view'] as String?,
      punchInData: (json['punch_in_data'] as List<dynamic>?)
          ?.map((e) => PunchInDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalSpendMinutes: json['total_spend_minutes'] as String?,
      totalHoursSpend: json['total_hours_spend'] as String?,
      productiveWorkingHours: json['productive_working_hours'] as String?,
      productiveWorkingHoursMinutes:
          json['productive_working_hours_minutes'] as String?,
      attendanceHistory: (json['attendance_history'] as List<dynamic>?)
          ?.map((e) => AttendanceHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      newUiDataView: json['new_ui_data_view'] == null
          ? null
          : NewUiDataView.fromJson(
              json['new_ui_data_view'] as Map<String, dynamic>),
      attendancePunchOutMissingId:
          json['attendance_punch_out_missing_id'] as String?,
      punchOutMissingRejectReason:
          json['punch_out_missing_reject_reason'] as String?,
      attendancePunchOutMissingStatus:
          json['attendance_punch_out_missing_status'] as String?,
      attendancePunchOutMissingStatusView:
          json['attendance_punch_out_missing_status_view'] as String?,
      totalSpendTimeBreak: json['total_spend_time_break'] as String?,
    );

Map<String, dynamic> _$MonthlyHistoryToJson(MonthlyHistory instance) =>
    <String, dynamic>{
      'date': instance.date,
      'date_name': instance.dateName,
      'day_name': instance.dayName,
      'day_name_short': instance.dayNameShort,
      'is_today': instance.isToday,
      'attendance_id': instance.attendanceId,
      'before_joining_date': instance.beforeJoiningDate,
      'shift_type': instance.shiftType,
      'shift_per_day_hours': instance.shiftPerDayHours,
      'late_time_start': instance.lateTimeStart,
      'early_out_time': instance.earlyOutTime,
      'shift_start_time': instance.shiftStartTime,
      'shift_end_time': instance.shiftEndTime,
      'max_punch_out_time': instance.maxPunchOutTime,
      'max_shift_hour': instance.maxShiftHour,
      'minimum_hours_for_full_day': instance.minimumHoursForFullDay,
      'is_multiple_punch_in': instance.isMultiplePunchIn,
      'per_day_minutes': instance.perDayMinutes,
      'shift_per_day_hours_view': instance.shiftPerDayHoursView,
      'can_apply_attendance': instance.canApplyAttendance,
      'leave_list': instance.leaveList,
      'is_date_gone': instance.isDateGone,
      'leave': instance.leave,
      'half_day': instance.halfDay,
      'quarter_day': instance.quarterDay,
      'three_quarter_day': instance.threeQuarterDay,
      'total_spend_time': instance.totalSpendTime,
      'short_leave_available': instance.shortLeaveAvailable,
      'need_ot_request': instance.needOtRequest,
      'need_ot_request_for_working_days': instance.needOtRequestForWorkingDays,
      'need_ot_request_for_same_day': instance.needOtRequestForSameDay,
      'present': instance.present,
      'work_report': instance.workReport,
      'extra_day': instance.extraDay,
      'late_in': instance.lateIn,
      'early_out': instance.earlyOut,
      'is_short_leave': instance.isShortLeave,
      'auto_leave': instance.autoLeave,
      'in_range_punch_in': instance.inRangePunchIn,
      'in_range_punch_out': instance.inRangePunchOut,
      'ot_request_status': instance.otRequestStatus,
      'ot_request_status_view': instance.otRequestStatusView,
      'attendnace_pending': instance.attendnacePending,
      'attendance_pending_message': instance.attendancePendingMessage,
      'punch_in_request_sent': instance.punchInRequestSent,
      'is_punch_out_missing': instance.isPunchOutMissing,
      'punch_out_missing_message': instance.punchOutMissingMessage,
      'attendance_declined': instance.attendanceDeclined,
      'attendance_declined_message': instance.attendanceDeclinedMessage,
      'extra_working_hours_view': instance.extraWorkingHoursView,
      'extra_working_hours': instance.extraWorkingHours,
      'extra_working_hours_minutes': instance.extraWorkingHoursMinutes,
      'remaining_working_hours_view': instance.remainingWorkingHoursView,
      'remaining_working_hours': instance.remainingWorkingHours,
      'remaining_working_hours_minutes': instance.remainingWorkingHoursMinutes,
      'shift_code': instance.shiftCode,
      'salary_generated': instance.salaryGenerated,
      'holiday_name': instance.holidayName,
      'holiday_description': instance.holidayDescription,
      'week_off': instance.weekOff,
      'holiday': instance.holiday,
      'penalty_date': instance.penaltyDate,
      'penalty_name': instance.penaltyName,
      'has_ot_data': instance.hasOtData,
      'ot_status_message': instance.otStatusMessage,
      'punch_missing_date_ary': instance.punchMissingDateAry,
      'add_attendace_click': instance.addAttendaceClick,
      'ot_data': instance.otData,
      'shift_name': instance.shiftName,
      'max_attendance_punch_out_date': instance.maxAttendancePunchOutDate,
      'max_attendance_punch_out_time': instance.maxAttendancePunchOutTime,
      'unit_id': instance.unitId,
      'punch_in_time': instance.punchInTime,
      'punch_out_time': instance.punchOutTime,
      'punch_in_date_time': instance.punchInDateTime,
      'punch_out_date_time': instance.punchOutDateTime,
      'attendance_date_start': instance.attendanceDateStart,
      'shift_hours_day_time': instance.shiftHoursDayTime,
      'over_time_day_time': instance.overTimeDayTime,
      'shift_hours_night_time': instance.shiftHoursNightTime,
      'overtime_nighttime_without_prior':
          instance.overtimeNighttimeWithoutPrior,
      'overtime_nighttime_with_prior': instance.overtimeNighttimeWithPrior,
      'late_in_time_view': instance.lateInTimeView,
      'early_out_time_view': instance.earlyOutTimeView,
      'punch_in_odometer': instance.punchInOdometer,
      'punch_in_odometer_image': instance.punchInOdometerImage,
      'last_punch_in_odometer': instance.lastPunchInOdometer,
      'last_punch_in_odometer_image': instance.lastPunchInOdometerImage,
      'punch_out_odometer': instance.punchOutOdometer,
      'punch_out_odometer_image': instance.punchOutOdometerImage,
      'punch_in_branch_id': instance.punchInBranchId,
      'punch_in_branch_type': instance.punchInBranchType,
      'punch_out_branch_id': instance.punchOutBranchId,
      'punch_out_branch_type': instance.punchOutBranchType,
      'between_shift_working_minutes': instance.betweenShiftWorkingMinutes,
      'between_shift_working_minutes_view':
          instance.betweenShiftWorkingMinutesView,
      'punch_in_data': instance.punchInData,
      'total_spend_minutes': instance.totalSpendMinutes,
      'total_hours_spend': instance.totalHoursSpend,
      'productive_working_hours': instance.productiveWorkingHours,
      'productive_working_hours_minutes':
          instance.productiveWorkingHoursMinutes,
      'attendance_history': instance.attendanceHistory,
      'new_ui_data_view': instance.newUiDataView,
      'attendance_punch_out_missing_id': instance.attendancePunchOutMissingId,
      'punch_out_missing_reject_reason': instance.punchOutMissingRejectReason,
      'attendance_punch_out_missing_status':
          instance.attendancePunchOutMissingStatus,
      'attendance_punch_out_missing_status_view':
          instance.attendancePunchOutMissingStatusView,
      'total_spend_time_break': instance.totalSpendTimeBreak,
    };

AttendanceHistory _$AttendanceHistoryFromJson(Map<String, dynamic> json) =>
    AttendanceHistory(
      attendanceBreakHistoryId: json['attendance_break_history_id'] as String?,
      attendanceTypeName: json['attendance_type_name'] as String?,
      breakStartDate: json['break_start_date'] as String?,
      breakStartDateYmd: json['break_start_date_ymd'] as String?,
      breakEndDate: json['break_end_date'] as String?,
      breakEndDateYmd: json['break_end_date_ymd'] as String?,
      breakInTime: json['break_in_time'] as String?,
      breakInTime24: json['break_in_time_24'] as String?,
      breakOutTime: json['break_out_time'] as String?,
      breakOutTime24: json['break_out_time_24'] as String?,
      breakStatus: json['break_status'] as String?,
      breakColor: json['break_color'] as String?,
      breakStatusView: json['break_status_view'] as String?,
      totalBreakHoursSpend: json['total_break_hours_spend'] as String?,
      breakName: json['break_name'] as String?,
      startMinutes: json['start_minutes'] as String?,
      endMinutes: json['end_minutes'] as String?,
      totalMinutes: json['total_minutes'] as String?,
    );

Map<String, dynamic> _$AttendanceHistoryToJson(AttendanceHistory instance) =>
    <String, dynamic>{
      'attendance_break_history_id': instance.attendanceBreakHistoryId,
      'attendance_type_name': instance.attendanceTypeName,
      'break_start_date': instance.breakStartDate,
      'break_start_date_ymd': instance.breakStartDateYmd,
      'break_end_date': instance.breakEndDate,
      'break_end_date_ymd': instance.breakEndDateYmd,
      'break_in_time': instance.breakInTime,
      'break_in_time_24': instance.breakInTime24,
      'break_out_time': instance.breakOutTime,
      'break_out_time_24': instance.breakOutTime24,
      'break_status': instance.breakStatus,
      'break_color': instance.breakColor,
      'break_status_view': instance.breakStatusView,
      'total_break_hours_spend': instance.totalBreakHoursSpend,
      'break_name': instance.breakName,
      'start_minutes': instance.startMinutes,
      'end_minutes': instance.endMinutes,
      'total_minutes': instance.totalMinutes,
    };

LeaveList _$LeaveListFromJson(Map<String, dynamic> json) => LeaveList(
      leaveTypeName: json['leave_type_name'] as String?,
      canApplyAttendance: json['can_apply_attendance'] as bool?,
      leavePaidUnpaid: json['leave_paid_unpaid'] as String?,
      isPaidLeave: json['is_paid_leave'] as bool?,
      leaveDayTypeStatus: json['leave_day_type_status'] as String?,
      leaveDayView: json['leave_day_view'] as String?,
      leaveDayType: json['leave_day_type'] as String?,
      leaveReason: json['leave_reason'] as String?,
      autoLeaveReason: json['auto_leave_reason'] as String?,
    );

Map<String, dynamic> _$LeaveListToJson(LeaveList instance) => <String, dynamic>{
      'leave_type_name': instance.leaveTypeName,
      'can_apply_attendance': instance.canApplyAttendance,
      'leave_paid_unpaid': instance.leavePaidUnpaid,
      'is_paid_leave': instance.isPaidLeave,
      'leave_day_type_status': instance.leaveDayTypeStatus,
      'leave_day_view': instance.leaveDayView,
      'leave_day_type': instance.leaveDayType,
      'leave_reason': instance.leaveReason,
      'auto_leave_reason': instance.autoLeaveReason,
    };

NewUiDataView _$NewUiDataViewFromJson(Map<String, dynamic> json) =>
    NewUiDataView(
      multiPunchDataView: (json['multi_punch_data_view'] as List<dynamic>?)
          ?.map((e) => PunchInDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      breaks: (json['breaks'] as List<dynamic>?)
          ?.map((e) => Break.fromJson(e as Map<String, dynamic>))
          .toList(),
      workingHourInPer: json['working_hour_in_per'] as String?,
    );

Map<String, dynamic> _$NewUiDataViewToJson(NewUiDataView instance) =>
    <String, dynamic>{
      'multi_punch_data_view': instance.multiPunchDataView,
      'breaks': instance.breaks,
      'working_hour_in_per': instance.workingHourInPer,
    };

Break _$BreakFromJson(Map<String, dynamic> json) => Break(
      breakColor: json['break_color'] as String?,
      breakName: json['break_name'] as String?,
      startMinutes: json['start_minutes'] as String?,
      endMinutes: json['end_minutes'] as String?,
      totalMinutes: json['total_minutes'] as String?,
      breakTimeView: json['break_time_view'] as String?,
    );

Map<String, dynamic> _$BreakToJson(Break instance) => <String, dynamic>{
      'break_color': instance.breakColor,
      'break_name': instance.breakName,
      'start_minutes': instance.startMinutes,
      'end_minutes': instance.endMinutes,
      'total_minutes': instance.totalMinutes,
      'break_time_view': instance.breakTimeView,
    };

PunchInDatum _$PunchInDatumFromJson(Map<String, dynamic> json) => PunchInDatum(
      punchInDate: json['punch_in_date'] as String?,
      punchInDateYmd: json['punch_in_date_ymd'] as String?,
      punchInTime: json['punch_in_time'] as String?,
      punchInTime24: json['punch_in_time_24'] as String?,
      punchOutDate: json['punch_out_date'] as String?,
      punchOutDateYmd: json['punch_out_date_ymd'] as String?,
      punchOutTime: json['punch_out_time'] as String?,
      punchOutTime24: json['punch_out_time_24'] as String?,
      workingHour: json['working_hour'] as String?,
      locationNameIn: json['location_name_in'] as String?,
      locationNameOut: json['location_name_out'] as String?,
      workingHourMinute: json['working_hour_minute'] as String?,
      breaks: (json['breaks'] as List<dynamic>?)
          ?.map((e) => AttendanceHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PunchInDatumToJson(PunchInDatum instance) =>
    <String, dynamic>{
      'punch_in_date': instance.punchInDate,
      'punch_in_date_ymd': instance.punchInDateYmd,
      'punch_in_time': instance.punchInTime,
      'punch_in_time_24': instance.punchInTime24,
      'punch_out_date': instance.punchOutDate,
      'punch_out_date_ymd': instance.punchOutDateYmd,
      'punch_out_time': instance.punchOutTime,
      'punch_out_time_24': instance.punchOutTime24,
      'working_hour': instance.workingHour,
      'location_name_in': instance.locationNameIn,
      'location_name_out': instance.locationNameOut,
      'working_hour_minute': instance.workingHourMinute,
      'breaks': instance.breaks,
    };

OtData _$OtDataFromJson(Map<String, dynamic> json) => OtData(
      otId: json['ot_id'] as String?,
      otDate: json['ot_date'] as String?,
      otTime: json['ot_time'] as String?,
      otStatusChangeReason: json['ot_status_change_reason'] as String?,
      otRequestedDate: json['ot_requested_date'] as String?,
      otStatusChangedDate: json['ot_status_changed_date'] as String?,
      otRemark: json['ot_remark'] as String?,
      otStatus: json['ot_status'] as String?,
      otType: json['ot_type'] as String?,
      otDayType: json['ot_day_type'] as String?,
      otChangeByName: json['ot_change_by_name'] as String?,
      rejectedReason: json['rejected_reason'] as String?,
    );

Map<String, dynamic> _$OtDataToJson(OtData instance) => <String, dynamic>{
      'ot_id': instance.otId,
      'ot_date': instance.otDate,
      'ot_time': instance.otTime,
      'ot_status_change_reason': instance.otStatusChangeReason,
      'ot_requested_date': instance.otRequestedDate,
      'ot_status_changed_date': instance.otStatusChangedDate,
      'ot_remark': instance.otRemark,
      'ot_status': instance.otStatus,
      'ot_type': instance.otType,
      'ot_day_type': instance.otDayType,
      'ot_change_by_name': instance.otChangeByName,
      'rejected_reason': instance.rejectedReason,
    };

PunchMissingDateAry _$PunchMissingDateAryFromJson(Map<String, dynamic> json) =>
    PunchMissingDateAry(
      dateOneView: json['date_one_view'] as String?,
      dateOne: json['date_one'] as String?,
    );

Map<String, dynamic> _$PunchMissingDateAryToJson(
        PunchMissingDateAry instance) =>
    <String, dynamic>{
      'date_one_view': instance.dateOneView,
      'date_one': instance.dateOne,
    };
