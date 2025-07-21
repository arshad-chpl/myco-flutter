class AddAppointmentRequestModel {
  final String? addAppointment;
  final String? companyId;
  final String? languageId;
  final String? appointmentByUserId;
  final String? appointmentForUserId;
  final String? appointmentDatetime;
  final String? appointmentPlace;
  final String? appointmentAgenda;
  final String? userName;
  final String? userDesignation;

  AddAppointmentRequestModel({
    this.addAppointment,
    this.companyId,
    this.languageId,
    this.appointmentByUserId,
    this.appointmentForUserId,
    this.appointmentDatetime,
    this.appointmentPlace,
    this.appointmentAgenda,
    this.userName,
    this.userDesignation,
  });

  Map<String, dynamic> toJson() => {
    'addAppointment': addAppointment,
    'society_id': companyId,
    'language_id': languageId,
    'appointment_by_user_id': appointmentByUserId,
    'appointment_for_user_id': appointmentForUserId,
    'appointment_datetime': appointmentDatetime,
    'appointment_place': appointmentPlace,
    'appointment_agenda': appointmentAgenda,
    'user_name': userName,
    'user_designation': userDesignation,
  };
}
