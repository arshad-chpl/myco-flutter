import 'package:equatable/equatable.dart';

class ApproveAppointmentEntityModel extends Equatable {
  final String? approveAppointment;
  final String? companyId;
  final String? userId;
  final String? languageId;
  final String? appointmentId;
  final String? appointmentByUserId;
  final String? userName;

  const ApproveAppointmentEntityModel({
    this.approveAppointment,
    this.companyId,
    this.userId,
    this.languageId,
    this.appointmentId,
    this.appointmentByUserId,
    this.userName,
  });

  @override
  List<Object?> get props => [
    approveAppointment,
    companyId,
    userId,
    languageId,
    appointmentId,
    appointmentByUserId,
    userName,
  ];
}
