import 'package:equatable/equatable.dart';

class RejectAppointmentEntitiesModel extends Equatable {
  final String? rejectAppointment;
  final String? companyId;
  final String? userId;
  final String? languageId;
  final String? appointmentId;
  final String? appointmentByUserId;
  final String? appointmentRejectReason;
  final String? userName;

  const RejectAppointmentEntitiesModel({
    this.rejectAppointment,
    this.companyId,
    this.userId,
    this.languageId,
    this.appointmentId,
    this.appointmentByUserId,
    this.appointmentRejectReason,
    this.userName,
  });

  @override
  List<Object?> get props => [
    rejectAppointment,
    companyId,
    userId,
    languageId,
    appointmentId,
    appointmentByUserId,
    appointmentRejectReason,
    userName,
  ];
}
