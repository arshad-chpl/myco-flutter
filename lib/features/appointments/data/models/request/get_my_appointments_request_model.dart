class GetMyAppointmentsRequestModel {
  final String? getMyAppointments;
  final String? companyId;
  final String? userId;
  final String? languageId;

  const GetMyAppointmentsRequestModel({
    this.getMyAppointments,
    this.companyId,
    this.userId,
    this.languageId,
  });

  Map<String, dynamic> toJson() => {
    'getMyAppointments': getMyAppointments,
    'company_Id': companyId,
    'user_Id': userId,
    'language_Id': languageId,
  };
}
