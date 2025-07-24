import 'package:equatable/equatable.dart';

class AttendanceMonthEntity extends Equatable {
  final bool? salaryGenerated;
  final bool? hideWorkingHours;
  final List<MonthlyHistoryEntity>? monthlyHistory;
  final String? month;
  final bool? sameDayFutureTimeAttendance;
  final String? userFullName;
  final String? totalIncompleteDays;
  final String? totalMonthHoursView;
  final String? totalMonthHours;
  final String? totalMonthMinutes;
  final String? totalMonthHoursWeb;
  final String? totalWorkingMinutes;
  final String? totalPresentWorkingMinutes;
  final String? totalPresentWorkingMinutesView;
  final String? totalMonthHourSpent;
  final String? totalMonthHourSpentView;
  final String? totalMonthHourSpentViewWeb;
  final String? latePunchIn;
  final String? earlyPunchOut;
  final String? totalLeavesNew;
  final String? totalLeave;
  final String? totalPaidLeaves;
  final String? totalUnpaidLeaves;
  final String? totalShortLeave;
  final String? totalHalfDay;
  final String? totalPresentDays;
  final String? totalPresent;
  final String? totalPresentAttendanceDays;
  final String? totalProductiveHoursView;
  final String? totalProductiveHoursViewWeb;
  final String? totalProductiveHoursMinutes;
  final String? totalExtraMinutes;
  final String? totalExtraHoursView;
  final String? totalExtraHoursViewWeb;
  final String? totalWorkingHoursViewWeb;
  final String? totalRemainingMinutes;
  final String? totalRemainingHoursView;
  final String? totalRemainingHoursViewWeb;
  final String? totalLeaveHours;
  final String? totalAdjustedHours;
  final String? totalAdjustedHoursType;
  final bool? hasExtraHours;
  final String? totalPunchOutMissing;
  final String? totalWeekOff;
  final String? totalHolidays;
  final String? totalPendingAttendance;
  final String? totalRejectedAttendance;
  final String? totalWorkingDays;
  final String? totalAvgPercentage;
  final String? totalExtraDays;
  final String? totalExtraDaysView;
  final String? totalAbsent;
  final String? infoMessage;
  final String? avgPerDayWorkingHours;
  final String? totalBetweenShiftWorkingMinutes;
  final String? totalBetweenShiftWorkingMinutesView;
  final String? totalSalaryDays;

  const AttendanceMonthEntity({
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

  @override
  List<Object?> get props => [
    salaryGenerated,
    hideWorkingHours,
    monthlyHistory,
    month,
    sameDayFutureTimeAttendance,
    userFullName,
    totalIncompleteDays,
    totalMonthHoursView,
    totalMonthHours,
    totalMonthMinutes,
    totalMonthHoursWeb,
    totalWorkingMinutes,
    totalPresentWorkingMinutes,
    totalPresentWorkingMinutesView,
    totalMonthHourSpent,
    totalMonthHourSpentView,
    totalMonthHourSpentViewWeb,
    latePunchIn,
    earlyPunchOut,
    totalLeavesNew,
    totalLeave,
    totalPaidLeaves,
    totalUnpaidLeaves,
    totalShortLeave,
    totalHalfDay,
    totalPresentDays,
    totalPresent,
    totalPresentAttendanceDays,
    totalProductiveHoursView,
    totalProductiveHoursViewWeb,
    totalProductiveHoursMinutes,
    totalExtraMinutes,
    totalExtraHoursView,
    totalExtraHoursViewWeb,
    totalWorkingHoursViewWeb,
    totalRemainingMinutes,
    totalRemainingHoursView,
    totalRemainingHoursViewWeb,
    totalLeaveHours,
    totalAdjustedHours,
    totalAdjustedHoursType,
    hasExtraHours,
    totalPunchOutMissing,
    totalWeekOff,
    totalHolidays,
    totalPendingAttendance,
    totalRejectedAttendance,
    totalWorkingDays,
    totalAvgPercentage,
    totalExtraDays,
    totalExtraDaysView,
    totalAbsent,
    infoMessage,
    avgPerDayWorkingHours,
    totalBetweenShiftWorkingMinutes,
    totalBetweenShiftWorkingMinutesView,
    totalSalaryDays,
  ];
}

class MonthlyHistoryEntity extends Equatable {
  final String? date;
  final String? dateName;
  final String? dayName;
  final String? dayNameShort;
  final bool? isToday;
  final String? attendanceId;
  final bool? beforeJoiningDate;
  final String? shiftType;
  final String? shiftPerDayHours;
  final String? lateTimeStart;
  final String? earlyOutTime;
  final String? shiftStartTime;
  final String? shiftEndTime;
  final String? maxPunchOutTime;
  final String? maxShiftHour;
  final String? minimumHoursForFullDay;
  final String? isMultiplePunchIn;
  final String? perDayMinutes;
  final String? shiftPerDayHoursView;
  final bool? canApplyAttendance;
  final List<LeaveListEntity>? leaveList;
  final bool? isDateGone;
  final bool? leave;
  final bool? halfDay;
  final bool? quarterDay;
  final bool? threeQuarterDay;
  final String? totalSpendTime;
  final bool? shortLeaveAvailable;
  final String? needOtRequest;
  final String? needOtRequestForWorkingDays;
  final String? needOtRequestForSameDay;
  final bool? present;
  final bool? workReport;
  final bool? extraDay;
  final bool? lateIn;
  final bool? earlyOut;
  final bool? isShortLeave;
  final bool? autoLeave;
  final bool? inRangePunchIn;
  final bool? inRangePunchOut;
  final String? otRequestStatus;
  final String? otRequestStatusView;
  final bool? attendnacePending;
  final String? attendancePendingMessage;
  final bool? punchInRequestSent;
  final bool? isPunchOutMissing;
  final String? punchOutMissingMessage;
  final bool? attendanceDeclined;
  final String? attendanceDeclinedMessage;
  final String? extraWorkingHoursView;
  final String? extraWorkingHours;
  final String? extraWorkingHoursMinutes;
  final String? remainingWorkingHoursView;
  final String? remainingWorkingHours;
  final String? remainingWorkingHoursMinutes;
  final String? shiftCode;
  final bool? salaryGenerated;
  final String? holidayName;
  final String? holidayDescription;
  final bool? weekOff;
  final bool? holiday;
  final String? penaltyDate;
  final String? penaltyName;
  final bool? hasOtData;
  final String? otStatusMessage;
  final PunchMissingDateAryEntity? punchMissingDateAry;
  final String? addAttendaceClick;
  final OtDataEntity? otData;
  final String? shiftName;
  final String? maxAttendancePunchOutDate;
  final String? maxAttendancePunchOutTime;
  final String? unitId;
  final String? punchInTime;
  final String? punchOutTime;
  final String? punchInDateTime;
  final String? punchOutDateTime;
  final String? attendanceDateStart;
  final String? shiftHoursDayTime;
  final String? overTimeDayTime;
  final String? shiftHoursNightTime;
  final String? overtimeNighttimeWithoutPrior;
  final String? overtimeNighttimeWithPrior;
  final String? lateInTimeView;
  final String? earlyOutTimeView;
  final String? punchInOdometer;
  final String? punchInOdometerImage;
  final String? lastPunchInOdometer;
  final String? lastPunchInOdometerImage;
  final String? punchOutOdometer;
  final String? punchOutOdometerImage;
  final String? punchInBranchId;
  final String? punchInBranchType;
  final String? punchOutBranchId;
  final String? punchOutBranchType;
  final String? betweenShiftWorkingMinutes;
  final String? betweenShiftWorkingMinutesView;
  final List<PunchInDatumEntity>? punchInData;
  final String? totalSpendMinutes;
  final String? totalHoursSpend;
  final String? productiveWorkingHours;
  final String? productiveWorkingHoursMinutes;
  final List<AttendanceHistoryEntity>? attendanceHistory;
  final NewUiDataViewEntity? newUiDataView;
  final String? attendancePunchOutMissingId;
  final String? punchOutMissingRejectReason;
  final String? attendancePunchOutMissingStatus;
  final String? attendancePunchOutMissingStatusView;
  final String? totalSpendTimeBreak;

  const MonthlyHistoryEntity({
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

  @override
  List<Object?> get props => [
    date,
    dateName,
    dayName,
    dayNameShort,
    isToday,
    attendanceId,
    beforeJoiningDate,
    shiftType,
    shiftPerDayHours,
    lateTimeStart,
    earlyOutTime,
    shiftStartTime,
    shiftEndTime,
    maxPunchOutTime,
    maxShiftHour,
    minimumHoursForFullDay,
    isMultiplePunchIn,
    perDayMinutes,
    shiftPerDayHoursView,
    canApplyAttendance,
    leaveList,
    isDateGone,
    leave,
    halfDay,
    quarterDay,
    threeQuarterDay,
    totalSpendTime,
    shortLeaveAvailable,
    needOtRequest,
    needOtRequestForWorkingDays,
    needOtRequestForSameDay,
    present,
    workReport,
    extraDay,
    lateIn,
    earlyOut,
    isShortLeave,
    autoLeave,
    inRangePunchIn,
    inRangePunchOut,
    otRequestStatus,
    otRequestStatusView,
    attendnacePending,
    attendancePendingMessage,
    punchInRequestSent,
    isPunchOutMissing,
    punchOutMissingMessage,
    attendanceDeclined,
    attendanceDeclinedMessage,
    extraWorkingHoursView,
    extraWorkingHours,
    extraWorkingHoursMinutes,
    remainingWorkingHoursView,
    remainingWorkingHours,
    remainingWorkingHoursMinutes,
    shiftCode,
    salaryGenerated,
    holidayName,
    holidayDescription,
    weekOff,
    holiday,
    penaltyDate,
    penaltyName,
    hasOtData,
    otStatusMessage,
    punchMissingDateAry,
    addAttendaceClick,
    otData,
    shiftName,
    maxAttendancePunchOutDate,
    maxAttendancePunchOutTime,
    unitId,
    punchInTime,
    punchOutTime,
    punchInDateTime,
    punchOutDateTime,
    attendanceDateStart,
    shiftHoursDayTime,
    overTimeDayTime,
    shiftHoursNightTime,
    overtimeNighttimeWithoutPrior,
    overtimeNighttimeWithPrior,
    lateInTimeView,
    earlyOutTimeView,
    punchInOdometer,
    punchInOdometerImage,
    lastPunchInOdometer,
    lastPunchInOdometerImage,
    punchOutOdometer,
    punchOutOdometerImage,
    punchInBranchId,
    punchInBranchType,
    punchOutBranchId,
    punchOutBranchType,
    betweenShiftWorkingMinutes,
    betweenShiftWorkingMinutesView,
    punchInData,
    totalSpendMinutes,
    totalHoursSpend,
    productiveWorkingHours,
    productiveWorkingHoursMinutes,
    attendanceHistory,
    newUiDataView,
    attendancePunchOutMissingId,
    punchOutMissingRejectReason,
    attendancePunchOutMissingStatus,
    attendancePunchOutMissingStatusView,
    totalSpendTimeBreak,
  ];
}

class AttendanceHistoryEntity extends Equatable {
  final String? attendanceBreakHistoryId;
  final String? attendanceTypeName;
  final String? breakStartDate;
  final String? breakStartDateYmd;
  final String? breakEndDate;
  final String? breakEndDateYmd;
  final String? breakInTime;
  final String? breakInTime24;
  final String? breakOutTime;
  final String? breakOutTime24;
  final String? breakStatus;
  final String? breakColor;
  final String? breakStatusView;
  final String? totalBreakHoursSpend;
  final String? breakName;
  final String? startMinutes;
  final String? endMinutes;
  final String? totalMinutes;

  const AttendanceHistoryEntity({
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

  @override
  List<Object?> get props => [
    attendanceBreakHistoryId,
    attendanceTypeName,
    breakStartDate,
    breakStartDateYmd,
    breakEndDate,
    breakEndDateYmd,
    breakInTime,
    breakInTime24,
    breakOutTime,
    breakOutTime24,
    breakStatus,
    breakColor,
    breakStatusView,
    totalBreakHoursSpend,
    breakName,
    startMinutes,
    endMinutes,
    totalMinutes,
  ];
}

class LeaveListEntity extends Equatable {
  final String? leaveTypeName;
  final bool? canApplyAttendance;
  final String? leavePaidUnpaid;
  final bool? isPaidLeave;
  final String? leaveDayTypeStatus;
  final String? leaveDayView;
  final String? leaveDayType;
  final String? leaveReason;
  final String? autoLeaveReason;

  const LeaveListEntity({
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

  @override
  List<Object?> get props => [
    leaveTypeName,
    canApplyAttendance,
    leavePaidUnpaid,
    isPaidLeave,
    leaveDayTypeStatus,
    leaveDayView,
    leaveDayType,
    leaveReason,
    autoLeaveReason,
  ];
}

class NewUiDataViewEntity extends Equatable {
  final List<PunchInDatumEntity>? multiPunchDataView;
  final List<BreakEntity>? breaks;
  final String? workingHourInPer;

  const NewUiDataViewEntity({
    this.multiPunchDataView,
    this.breaks,
    this.workingHourInPer,
  });

  @override
  List<Object?> get props => [multiPunchDataView, breaks, workingHourInPer];
}

class BreakEntity extends Equatable {
  final String? breakColor;
  final String? breakName;
  final String? startMinutes;
  final String? endMinutes;
  final String? totalMinutes;
  final String? breakTimeView;

  const BreakEntity({
    this.breakColor,
    this.breakName,
    this.startMinutes,
    this.endMinutes,
    this.totalMinutes,
    this.breakTimeView,
  });

  @override
  List<Object?> get props => [
    breakColor,
    breakName,
    startMinutes,
    endMinutes,
    totalMinutes,
    breakTimeView,
  ];
}

class PunchInDatumEntity extends Equatable {
  final String? punchInDate;
  final String? punchInDateYmd;
  final String? punchInTime;
  final String? punchInTime24;
  final String? punchOutDate;
  final String? punchOutDateYmd;
  final String? punchOutTime;
  final String? punchOutTime24;
  final String? workingHour;
  final String? locationNameIn;
  final String? locationNameOut;
  final String? workingHourMinute;
  final List<AttendanceHistoryEntity>? breaks;

  const PunchInDatumEntity({
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

  @override
  List<Object?> get props => [
    punchInDate,
    punchInDateYmd,
    punchInTime,
    punchInTime24,
    punchOutDate,
    punchOutDateYmd,
    punchOutTime,
    punchOutTime24,
    workingHour,
    locationNameIn,
    locationNameOut,
    workingHourMinute,
    breaks,
  ];
}

class OtDataEntity extends Equatable {
  final String? otId;
  final String? otDate;
  final String? otTime;
  final String? otStatusChangeReason;
  final String? otRequestedDate;
  final String? otStatusChangedDate;
  final String? otRemark;
  final String? otStatus;
  final String? otType;
  final String? otDayType;
  final String? otChangeByName;
  final String? rejectedReason;

  const OtDataEntity({
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

  @override
  List<Object?> get props => [
    otId,
    otDate,
    otTime,
    otStatusChangeReason,
    otRequestedDate,
    otStatusChangedDate,
    otRemark,
    otStatus,
    otType,
    otDayType,
    otChangeByName,
    rejectedReason,
  ];
}

class PunchMissingDateAryEntity extends Equatable {
  final String? dateOneView;
  final String? dateOne;

  const PunchMissingDateAryEntity({this.dateOneView, this.dateOne});

  @override
  List<Object?> get props => [dateOneView, dateOne];
}
