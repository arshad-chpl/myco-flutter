import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/appointments/domain/entities/appointment_entities_model.dart';

abstract class AppointmentState extends Equatable {
  final int tabIndex;
  const AppointmentState({this.tabIndex = 0});

  @override
  List<Object?> get props => [tabIndex];
}

class AppointmentInitial extends AppointmentState {
  const AppointmentInitial({super.tabIndex});
}

class AppointmentLoading extends AppointmentState {
  const AppointmentLoading({super.tabIndex});
}

class AppointmentLoaded extends AppointmentState {
  final AppointmentEntityModel appointments;

  const AppointmentLoaded(
      this.appointments,
      {super.tabIndex}
  );

  @override
  List<Object> get props => [appointments, tabIndex];
}

class AppointmentError extends AppointmentState{
  final String message;
  const AppointmentError (this.message, {super.tabIndex});
  @override
  List<Object?> get props => [message, tabIndex];
}

