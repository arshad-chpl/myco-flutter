class RejectAppointmentRequestModel {
  final String? rejectAppointment;
  final String? companyId;
  final String? userId;
  final String? languageId;
  final String? appointmentId;
  final String? appointmentByUserId;
  final String? appointmentRejectReason;
  final String? userName;

  RejectAppointmentRequestModel({
    this.rejectAppointment,
    this.companyId,
    this.userId,
    this.languageId,
    this.appointmentId,
    this.appointmentByUserId,
    this.appointmentRejectReason,
    this.userName,
  });

  Map<String, dynamic> toJson() => {
    'rejectAppointment': rejectAppointment,
    'society_id': companyId,
    'user_id': userId,
    'language_id': languageId,
    'appointment_id': appointmentId,
    'appointment_by_user_id': appointmentByUserId,
    'appointment_reject_reason': appointmentRejectReason,
    'user_name': userName,
  };
}
