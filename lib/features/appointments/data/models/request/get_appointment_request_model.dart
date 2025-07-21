class GetAppointmentRequestModel {
  final String? getAppointments;
  final String? companyId;
  final String? userId;
  final String? languageId;

  const GetAppointmentRequestModel({
    this.getAppointments,
    this.companyId,
    this.userId,
    this.languageId,
  });

  Map<String, dynamic> toJson() => {
    'getAppointments': getAppointments,
    'society_id': companyId,
    'user_id': userId,
    'language_id': languageId,
  };
}