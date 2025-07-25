class DeleteAppointmentRequestModel {
  final String? deleteAppointment;
  final String? companyId;
  final String? languageId;
  final String? appointmentId;

  const DeleteAppointmentRequestModel({
    this.deleteAppointment,
    this.companyId,
    this.languageId,
    this.appointmentId,
  });

  Map<String, dynamic> toJson() => {
    'deleteAppointment': deleteAppointment,
    'company_id': companyId,
    'language_id': languageId,
    'appointment_id': appointmentId,
  };
}
