class SendAppointmentReminderRequestModel {
  final String? sendAppointmentReminder;
  final String? companyId;
  final String? languageId;
  final String? appointmentId;
  final String? appointmentForUserId;
  final String? userId;
  final String? userName;
  final String? forUserName;
  final String? appointmentTime;
  final String? appointmentPlace;
  final String? appointmentAgenda;

  const SendAppointmentReminderRequestModel({
    this.sendAppointmentReminder,
    this.companyId,
    this.languageId,
    this.appointmentId,
    this.appointmentForUserId,
    this.userId,
    this.userName,
    this.forUserName,
    this.appointmentTime,
    this.appointmentPlace,
    this.appointmentAgenda,
  });

  Map<String, dynamic> toJson() => {
    'sendAppointmentReminder': sendAppointmentReminder,
    'company_id': companyId,
    'language_id': languageId,
    'appointment_id': appointmentId,
    'appointment_for_user_id': appointmentForUserId,
    'user_id': userId,
    'user_name': userName,
    'for_user_name': forUserName,
    'appointment_time': appointmentTime,
    'appointment_place': appointmentPlace,
    'appointment_agenda': appointmentAgenda,
  };
}
