class ApproveAppointmentRequestModel {
  final String? approveAppointment;
  final String? companyId;
  final String? userId;
  final String? languageId;
  final String? appointmentId;
  final String? appointmentByUserId;
  final String? userName;

  const ApproveAppointmentRequestModel({
    this.approveAppointment,
    this.companyId,
    this.userId,
    this.languageId,
    this.appointmentId,
    this.appointmentByUserId,
    this.userName,
  });

  Map<String, dynamic> toJson() => {
    'approveAppointment': approveAppointment,
    'company_id': companyId,
    'user_id': userId,
    'language_id': languageId,
    'appointment_id': appointmentId,
    'appointment_by_user_id': appointmentByUserId,
    'user_name': userName,
  };
}
