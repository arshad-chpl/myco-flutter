import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/appointments/data/models/request/get_appointment_request_model.dart';

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