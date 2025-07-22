import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/appointments/data/models/request/get_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/domain/entities/appointment_entities_model.dart';
import 'package:myco_flutter/features/appointments/domain/repositories/appointment_repository.dart';

class AppointmentUseCase {
  final AppointmentRepository repository;

  AppointmentUseCase({required this.repository});

  Future<Either<Failure, AppointmentEntityModel>> getAppointment(
    GetAppointmentRequestModel params,
  ) async => await repository.getAppointment(params);
}
