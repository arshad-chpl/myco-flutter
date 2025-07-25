import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/appointments/data/models/request/approve_appointment_entity_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/delete_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/get_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/get_my_appointments_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/reject_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/send_appointment_reminder_request_model.dart';
import 'package:myco_flutter/features/appointments/domain/entities/appointment_entities_model.dart';
import 'package:myco_flutter/features/appointments/domain/repositories/appointment_repository.dart';

class AppointmentUseCase {
  final AppointmentRepository repository;

  AppointmentUseCase({required this.repository});

  Future<Either<Failure, AppointmentEntityModel>> getAppointment(
    GetAppointmentRequestModel params,
  ) async => await repository.getAppointment(params);

  Future<Either<Failure, AppointmentEntityModel>> getMyAppointment(
    GetMyAppointmentsRequestModel params,
  ) async => await repository.getMyAppointment(params);

  Future<Either<Failure, CommonResponseModelEntity>> approvedAppointment(
    ApproveAppointmentRequestModel params,
  ) async => await repository.approveAppointment(params);

  Future<Either<Failure, CommonResponseModelEntity>> rejectAppointment(
    RejectAppointmentRequestModel params,
  ) async => await repository.rejectAppointment(params);

  Future<Either<Failure, CommonResponseModelEntity>> deleteAppointment(
    DeleteAppointmentRequestModel params,
  ) async => await repository.deleteAppointmentRequest(params);

}
