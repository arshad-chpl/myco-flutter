class DeleteOptionalHoliday {
  final String companyId;
  final String userId;
  final String optionalHolidayAssignId;

  DeleteOptionalHoliday({
    required this.companyId,
    required this.userId,
    required this.optionalHolidayAssignId,
  });

  Map<String, dynamic> toMap() => {
    'deleteOptionalHolidayRequest': 'deleteOptionalHolidayRequest',
    'society_id': companyId,
    'user_id': userId,
    'optional_holiday_assign_id': optionalHolidayAssignId,
  };
}