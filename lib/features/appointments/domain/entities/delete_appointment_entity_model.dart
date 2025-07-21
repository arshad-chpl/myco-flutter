import 'package:equatable/equatable.dart';

class DeleteAppointmentEntityModel extends Equatable {
  final String? deleteAppointment;
  final String? companyId;
  final String? languageId;
  final String? appointmentId;

  const DeleteAppointmentEntityModel({
    this.deleteAppointment,
    this.companyId,
    this.languageId,
    this.appointmentId,
  });

  @override
  List<Object?> get props => [
    deleteAppointment,
    companyId,
    languageId,
    appointmentId,
  ];
}
