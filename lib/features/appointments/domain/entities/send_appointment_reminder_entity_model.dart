import 'package:equatable/equatable.dart';

class SendAppointmentReminderEntityModel extends Equatable {
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

  const SendAppointmentReminderEntityModel({
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

  @override
  List<Object?> get props => [
    sendAppointmentReminder,
    companyId,
    languageId,
    appointmentId,
    appointmentForUserId,
    userId,
    userName,
    forUserName,
    appointmentTime,
    appointmentPlace,
    appointmentAgenda,
  ];
}
