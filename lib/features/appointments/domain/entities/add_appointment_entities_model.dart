import 'package:equatable/equatable.dart';

class AddAppointmentEntity extends Equatable {
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

  const AddAppointmentEntity({
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

  @override
  List<Object?> get props => [
    addAppointment,
    companyId,
    languageId,
    appointmentByUserId,
    appointmentForUserId,
    appointmentDatetime,
    appointmentPlace,
    appointmentAgenda,
    userName,
    userDesignation,
  ];
}
