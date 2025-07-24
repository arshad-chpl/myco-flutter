import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/appointments/data/models/request/approve_appointment_entity_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/get_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/get_my_appointments_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/reject_appointment_request_model.dart';

abstract class AppointmentEvent extends Equatable{
  const AppointmentEvent();

  @override
  List<Object?> get props => [];
}

class AppointmentTabChange extends AppointmentEvent {
  final int tabIndex;

  const AppointmentTabChange({required this.tabIndex});
}

class GetAppointmentEvent extends AppointmentEvent {
  final GetAppointmentRequestModel params;

  const GetAppointmentEvent( this.params);
}

class GetMyAppointmentEvent extends AppointmentEvent {
  final GetMyAppointmentsRequestModel params;

  const GetMyAppointmentEvent(this.params);
}

class ApprovedAppointmentEvent extends AppointmentEvent {
  final ApproveAppointmentRequestModel params;

  const ApprovedAppointmentEvent(this.params);
}

class RejectAppointmentEvent extends AppointmentEvent {
  final RejectAppointmentRequestModel params;

  const RejectAppointmentEvent(this.params);
}