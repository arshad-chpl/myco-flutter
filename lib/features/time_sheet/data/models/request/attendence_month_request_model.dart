class MonthlyAttendanceRequestModel {
  final String? getMonthlyAttendanceHistory;
  final String? companyId;
  final String? unitId;
  final String? userId;
  final String? branchId;
  final String? departmentId;
  final String? levelId;
  final String? languageId;
  final String? monthStartDate;
  final String? monthEndDate;
  final String? punchInDate;

  MonthlyAttendanceRequestModel({
    this.getMonthlyAttendanceHistory,
    this.companyId,
    this.unitId,
    this.userId,
    this.branchId,
    this.departmentId,
    this.levelId,
    this.languageId,
    this.monthStartDate,
    this.monthEndDate,
    this.punchInDate,
  });

  Map<String, dynamic> toJson() => {
    'getMonthlyAttendanceHistoryV2': getMonthlyAttendanceHistory,
    'society_id': companyId,
    'unit_id': unitId,
    'user_id': userId,
    'block_id': branchId,
    'floor_id': departmentId,
    'level_id': levelId,
    'language_id': languageId,
    'month_start_date': monthStartDate,
    'month_end_date': monthEndDate,
    'punch_in_date': punchInDate,
  };
}
