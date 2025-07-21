class ApplyOptionalHoliday {
  final String companyId;
  final String userId;
  final String optionalHolidayAssignId;
  final String holidayId;

  ApplyOptionalHoliday({
    required this.companyId,
    required this.userId,
    required this.holidayId,
    required this.optionalHolidayAssignId,
  });

  Map<String, dynamic> toMap() => {
    'applyOptionalHoliday': 'applyOptionalHoliday',
    'society_id': companyId,
    'holiday_id': holidayId,
    'user_id': userId,
    'optional_holiday_assign_id': optionalHolidayAssignId,
  };
}
