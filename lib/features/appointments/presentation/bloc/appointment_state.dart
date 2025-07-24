import 'package:equatable/equatable.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/appointments/domain/entities/appointment_entities_model.dart';

abstract class AppointmentState extends Equatable {
  final int tabIndex;

  const AppointmentState({this.tabIndex = 0});

  AppointmentState copyWith({int? tabIndex});

  @override
  List<Object?> get props => [tabIndex];
}

class AppointmentInitial extends AppointmentState {
  const AppointmentInitial({super.tabIndex});

  @override
  AppointmentInitial copyWith({int? tabIndex}) =>
      AppointmentInitial(tabIndex: tabIndex ?? this.tabIndex);
}

class AppointmentLoading extends AppointmentState {
  const AppointmentLoading({super.tabIndex});

  @override
  AppointmentLoading copyWith({int? tabIndex}) =>
      AppointmentLoading(tabIndex: tabIndex ?? this.tabIndex);
}

class AppointmentLoaded extends AppointmentState {
  final AppointmentEntityModel appointments;

  const AppointmentLoaded(this.appointments, {super.tabIndex});

  @override
  List<Object> get props => [appointments, tabIndex];

  @override
  AppointmentState copyWith({int? tabIndex}) => AppointmentLoaded(
      appointments,
      tabIndex: tabIndex ?? this.tabIndex,
    );
}

class CommonResponseAppointment extends AppointmentState {
  final CommonResponseModelEntity commonResponse;

  const CommonResponseAppointment(this.commonResponse, {super.tabIndex});

  @override
  List<Object?> get props => [commonResponse, tabIndex];

  @override
  AppointmentState copyWith({int? tabIndex}) => CommonResponseAppointment(
    commonResponse,
    tabIndex: tabIndex ?? this.tabIndex,
  );
}

class AppointmentError extends AppointmentState {
  final String message;

  const AppointmentError(this.message, {super.tabIndex});

  @override
  List<Object?> get props => [message, tabIndex];

  @override
  AppointmentError copyWith({int? tabIndex}) => AppointmentError(
      message,
      tabIndex: tabIndex ?? this.tabIndex,
    );
}
